import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:todoapp_flutter/core/network/api_exception.dart';
import 'package:todoapp_flutter/data/datasources/user_datasource.dart';
import 'package:todoapp_flutter/data/repositories/user_repository_impl.dart';
import 'package:todoapp_flutter/domain/usecases/get_users.dart';

void main() {
  late Dio dio;
  late DioAdapter adapter;
  late UserRepositoryImpl repository;
  setUp(() {
    dio = Dio(BaseOptions(baseUrl: 'https://test.example'));
    adapter = DioAdapter(dio: dio);
    repository = UserRepositoryImpl(UserDataSource(dio));
  });
  test('GetUsers: ruta, parámetros y contrato', () async {
    adapter.onGet(
      '/api/v1/users/',
      (s) => s.reply(200, <String, dynamic>{
        "count": 1,
        "next": null,
        "previous": null,
        "results": [
          <String, dynamic>{
            "id": 1,
            "username": "user",
            "email": "user@example.com",
            "profile": null,
          },
        ],
      }),
      queryParameters: <String, dynamic>{"page": 1},
    );
    final result = await GetUsers(repository)(1);
    expect(result.count, 1);
    expect(result.results.single.id, 1);
  });
  test('GetUsers: propaga error del servidor', () async {
    adapter.onGet(
      '/api/v1/users/',
      (s) => s.reply(403, {'detail': 'Sin permiso'}),
      queryParameters: <String, dynamic>{"page": 1},
    );
    await expectLater(
      GetUsers(repository)(1),
      throwsA(
        isA<ApiError>().having((e) => e.message, 'message', 'Sin permiso'),
      ),
    );
  });
  test('GetUsers: rechaza contrato roto', () async {
    adapter.onGet(
      '/api/v1/users/',
      (s) => s.reply(200, {'unexpected': true}),
      queryParameters: <String, dynamic>{"page": 1},
    );
    await expectLater(GetUsers(repository)(1), throwsA(isA<ServerError>()));
  });
}
