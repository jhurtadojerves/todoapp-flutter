import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:todoapp_flutter/core/config/api_config.dart';
import 'package:todoapp_flutter/core/network/api_call.dart';
import 'package:todoapp_flutter/core/network/api_exception.dart';
import 'package:todoapp_flutter/core/network/auth_interceptor.dart';
import 'package:todoapp_flutter/core/utils/jwt.dart';
import 'package:todoapp_flutter/data/datasources/auth_datasource.dart';
import 'package:todoapp_flutter/data/datasources/task_datasource.dart';
import 'package:todoapp_flutter/domain/models/models.dart';

void main() {
  group('Configuración y JWT', () {
    test(
      'HTTPS permitido en release',
      () => ApiConfig.validate(url: 'https://api.example.com', release: true),
    );
    for (final host in ['localhost', '10.0.2.2', '127.0.0.1']) {
      test('HTTP local $host solo en desarrollo', () {
        ApiConfig.validate(url: 'http://$host:8080', release: false);
        expect(
          () => ApiConfig.validate(url: 'http://$host', release: true),
          throwsStateError,
        );
      });
    }
    test(
      'HTTP remoto rechazado',
      () => expect(
        () => ApiConfig.validate(url: 'http://example.com', release: false),
        throwsStateError,
      ),
    );
    test('user_id extraído del payload', () {
      final jwt =
          'header.${base64Url.encode(utf8.encode(jsonEncode({'user_id': 42})))}.sig';
      expect(userIdFromJwt(jwt), 42);
    });
    test('JWT inválido no rompe arranque', () {
      for (final token in ['', 'bad', 'a.b.c']) {
        expect(userIdFromJwt(token), null);
      }
    });
  });
  group('Errores y contratos', () {
    late Dio dio;
    late DioAdapter adapter;
    setUp(() {
      dio = Dio(BaseOptions(baseUrl: 'https://test.example'));
      adapter = DioAdapter(dio: dio);
    });
    test(
      'detail prioritario',
      () => expect(
        errorMessage({
          'detail': 'Detalle',
          'name': ['Campo'],
        }, 400),
        'Detalle',
      ),
    );
    test(
      'primer error de campo',
      () => expect(
        errorMessage({
          'name': ['Obligatorio'],
        }, 400),
        'Obligatorio',
      ),
    );
    for (final status in [401, 403, 404, 429]) {
      test(
        'fallback $status',
        () => expect(errorMessage(null, status), isNotEmpty),
      );
    }
    test('4xx conserva mensaje y estado', () async {
      adapter.onGet('/x', (s) => s.reply(403, {'detail': 'Prohibido'}));
      await expectLater(
        apiCall(() => dio.get('/x'), (v) => v),
        throwsA(
          isA<ApiError>()
              .having((e) => e.message, 'message', 'Prohibido')
              .having((e) => e.statusCode, 'status', 403),
        ),
      );
    });
    test('5xx ServerError', () async {
      adapter.onGet('/x', (s) => s.reply(500, {}));
      await expectLater(
        apiCall(() => dio.get('/x'), (v) => v),
        throwsA(isA<ServerError>()),
      );
    });
    test('contrato roto ServerError', () async {
      adapter.onGet('/x', (s) => s.reply(200, {'id': 'bad'}));
      await expectLater(
        apiCall(() => dio.get('/x'), (v) => Board.fromJson(v)),
        throwsA(isA<ServerError>()),
      );
    });
    test('204 void', () async {
      adapter.onDelete('/x', (s) => s.reply(204, null));
      await apiCall<void>(() => dio.delete('/x'), (_) {});
    });
    for (final type in [
      DioExceptionType.connectionTimeout,
      DioExceptionType.receiveTimeout,
      DioExceptionType.sendTimeout,
      DioExceptionType.connectionError,
      DioExceptionType.unknown,
    ]) {
      test('traducción $type', () async {
        await expectLater(
          apiCall<dynamic>(
            () => Future.error(
              DioException(requestOptions: RequestOptions(), type: type),
            ),
            (v) => v,
          ),
          throwsA(
            type == DioExceptionType.connectionError ||
                    type == DioExceptionType.unknown
                ? isA<NetworkError>()
                : isA<TimeoutError>(),
          ),
        );
      });
    }
    test('refresh conserva token no rotado', () async {
      adapter.onPost(
        '/api/v1/auth/token/refresh/',
        (s) => s.reply(200, {'access': 'new'}),
        data: {'refresh': 'old'},
      );
      expect(
        await AuthDataSource(dio).refreshToken('old'),
        const TokenPair(access: 'new', refresh: 'old'),
      );
    });
    test('refresh sin access rechaza contrato', () async {
      adapter.onPost(
        '/api/v1/auth/token/refresh/',
        (s) => s.reply(200, {}),
        data: {'refresh': 'old'},
      );
      await expectLater(
        AuthDataSource(dio).refreshToken('old'),
        throwsA(isA<ServerError>()),
      );
    });
    test('contraseña rechazada muestra reglas', () async {
      adapter.onPost(
        '/api/v1/auth/password/validate/',
        (s) => s.reply(400, {
          'password': ['Muy corta'],
        }),
        data: {'password': '123'},
      );
      final result = await AuthDataSource(dio).validatePassword('123');
      expect(result.isValid, false);
      expect(result.errors, ['Muy corta']);
    });
    test('tarea envía ids null en snake_case', () async {
      adapter.onPost(
        '/api/v1/boards/1/tasks/',
        (s) => s.reply(201, {
          'id': 2,
          'board_id': 1,
          'sprint': null,
          'status': null,
          'user_id': 3,
          'assigned_to_id': null,
          'title': 'Prueba',
          'description': '',
          'created': 'now',
          'modified': 'now',
        }),
        data: {
          'title': 'Prueba',
          'description': '',
          'status_id': null,
          'sprint_id': null,
          'assigned_to_id': null,
        },
      );
      final task = await TaskDataSource(dio).createTask(
        1,
        const TaskInput(
          title: 'Prueba',
          description: '',
          statusId: null,
          sprintId: null,
          assignedToId: null,
        ),
      );
      expect(task.id, 2);
      expect(task.status, null);
    });
  });
  group('Refresh interceptor', () {
    test('401 concurrentes refrescan una vez y reintentan', () async {
      final dio = Dio(BaseOptions(baseUrl: 'https://test.example'));
      final adapter = DioAdapter(dio: dio);
      String? token = 'old';
      var refreshes = 0;
      dio.interceptors.add(
        AuthInterceptor(
          dio: dio,
          accessToken: () => token,
          refresh: () async {
            refreshes++;
            await Future<void>.delayed(const Duration(milliseconds: 10));
            return token = 'new';
          },
          onUnauthorized: () async {
            token = null;
          },
        ),
      );
      adapter.onGet(
        '/x',
        (s) => s.reply(401, {}),
        headers: {'Authorization': 'Bearer old'},
      );
      adapter.onGet(
        '/x',
        (s) => s.reply(200, {'ok': true}),
        headers: {'Authorization': 'Bearer new'},
      );
      final responses = await Future.wait([dio.get('/x'), dio.get('/x')]);
      expect(refreshes, 1);
      expect(responses.every((r) => r.statusCode == 200), true);
    });
    test('refresh fallido cierra sesión', () async {
      final dio = Dio(BaseOptions(baseUrl: 'https://test.example'));
      final adapter = DioAdapter(dio: dio);
      var logouts = 0;
      dio.interceptors.add(
        AuthInterceptor(
          dio: dio,
          accessToken: () => 'old',
          refresh: () async => null,
          onUnauthorized: () async {
            logouts++;
          },
        ),
      );
      adapter.onGet('/x', (s) => s.reply(401, {}));
      await expectLater(dio.get('/x'), throwsA(isA<DioException>()));
      expect(logouts, 1);
    });
    test('401 de petición sin token no refresca ni cierra sesión', () async {
      final dio = Dio(BaseOptions(baseUrl: 'https://test.example'));
      final adapter = DioAdapter(dio: dio);
      var refreshes = 0;
      var logouts = 0;
      dio.interceptors.add(
        AuthInterceptor(
          dio: dio,
          accessToken: () => null,
          refresh: () async {
            refreshes++;
            return null;
          },
          onUnauthorized: () async {
            logouts++;
          },
        ),
      );
      adapter.onGet('/x', (s) => s.reply(401, {}));
      await expectLater(dio.get('/x'), throwsA(isA<DioException>()));
      expect(refreshes, 0);
      expect(logouts, 0);
    });
    test('login público no refresca', () async {
      final dio = Dio(BaseOptions(baseUrl: 'https://test.example'));
      final adapter = DioAdapter(dio: dio);
      var refreshes = 0;
      dio.interceptors.add(
        AuthInterceptor(
          dio: dio,
          accessToken: () => 'old',
          refresh: () async {
            refreshes++;
            return null;
          },
          onUnauthorized: () async {},
        ),
      );
      adapter.onPost('/login', (s) => s.reply(401, {}));
      await expectLater(
        dio.post('/login', options: Options(extra: {'authenticated': false})),
        throwsA(isA<DioException>()),
      );
      expect(refreshes, 0);
    });
  });
}
