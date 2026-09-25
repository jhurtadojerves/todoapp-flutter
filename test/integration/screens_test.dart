import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:todoapp_flutter/main.dart';
import 'package:todoapp_flutter/app/router.dart';
import 'package:todoapp_flutter/data/datasources/auth_datasource.dart';
import 'package:todoapp_flutter/data/repositories/auth_repository_impl.dart';
import 'package:todoapp_flutter/presentation/providers/dependencies.dart';
import 'package:todoapp_flutter/presentation/providers/session_provider.dart';
import '../widget_test.dart' show MemoryTokens;

Map<String, dynamic> page(List<Map<String, dynamic>> items, {String? next}) => {
  'count': items.length,
  'next': next,
  'previous': null,
  'results': items,
};
Map<String, dynamic> board(int id, String name) => {
  'id': id,
  'name': name,
  'description': 'Descripción',
  'user_id': 1,
  'created': 'now',
  'modified': 'now',
};
String get access =>
    'header.${base64Url.encode(utf8.encode(jsonEncode({'user_id': 1})))}.sig';
void main() {
  late Dio dio;
  late DioAdapter adapter;
  late MemoryTokens storage;
  setUp(() {
    dio = Dio(BaseOptions(baseUrl: 'https://test.example'));
    adapter = DioAdapter(dio: dio);
    storage = MemoryTokens();
  });
  Future<void> mount(WidgetTester tester, {bool authenticated = false}) async {
    if (authenticated) storage.pair = (access: access, refresh: 'refresh');
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          tokenStorageProvider.overrideWithValue(storage),
          apiClientProvider.overrideWithValue(dio),
          authRepositoryProvider.overrideWithValue(
            AuthRepositoryImpl(AuthDataSource(dio)),
          ),
        ],
        child: const TodoApp(),
      ),
    );
    await tester.pumpAndSettle();
  }

  Future<void> credentials(WidgetTester tester) async {
    await tester.tap(find.text('Users'));
    await tester.pumpAndSettle();
    await tester.enterText(
      find.widgetWithText(TextFormField, 'Correo electrónico'),
      'u@example.com',
    );
    await tester.enterText(
      find.widgetWithText(TextFormField, 'Contraseña'),
      'secret',
    );
    await tester.tap(find.widgetWithText(FilledButton, 'Acceder'));
    await tester.pumpAndSettle();
  }

  testWidgets('Login real con red simulada navega a usuarios', (tester) async {
    adapter.onPost(
      '/api/v1/auth/token/',
      (s) => s.reply(200, {'access': access, 'refresh': 'refresh'}),
      data: {'email': 'u@example.com', 'password': 'secret'},
    );
    adapter.onGet(
      '/api/v1/users/',
      (s) => s.reply(
        200,
        page([
          {
            'id': 1,
            'username': 'Usuario',
            'email': 'u@example.com',
            'profile': null,
          },
        ]),
      ),
      queryParameters: {'page': 1},
    );
    await mount(tester);
    await credentials(tester);
    expect(find.text('Listado de usuarios'), findsOneWidget);
    expect(find.text('Usuario'), findsOneWidget);
    expect(storage.pair?.refresh, 'refresh');
  });
  testWidgets('Login 401 muestra detalle y permanece en formulario', (
    tester,
  ) async {
    adapter.onPost(
      '/api/v1/auth/token/',
      (s) => s.reply(401, {'detail': 'Credenciales incorrectas'}),
      data: {'email': 'u@example.com', 'password': 'secret'},
    );
    await mount(tester);
    await credentials(tester);
    expect(find.text('Credenciales incorrectas'), findsOneWidget);
    expect(storage.pair, null);
  });
  testWidgets('Lista paginada conserva tableros al cargar más', (tester) async {
    adapter.onGet(
      '/api/v1/boards/',
      (s) => s.reply(
        200,
        page([board(1, 'Primero')], next: '/api/v1/boards/?page=2'),
      ),
      queryParameters: {'page': 1},
    );
    adapter.onGet(
      '/api/v1/boards/',
      (s) => s.reply(200, page([board(2, 'Segundo')])),
      queryParameters: {'page': 2},
    );
    await mount(tester, authenticated: true);
    await tester.tap(find.text('Boards'));
    await tester.pumpAndSettle();
    expect(find.text('Primero'), findsOneWidget);
    await tester.tap(find.text('Cargar más'));
    await tester.pumpAndSettle();
    expect(find.text('Primero'), findsOneWidget);
    expect(find.text('Segundo'), findsOneWidget);
    expect(find.text('Cargar más'), findsNothing);
  });
  testWidgets('Contrato roto ofrece reintento', (tester) async {
    adapter.onGet(
      '/api/v1/boards/',
      (s) => s.reply(200, {'results': 'incorrecto'}),
      queryParameters: {'page': 1},
    );
    await mount(tester, authenticated: true);
    await tester.tap(find.text('Boards'));
    await tester.pumpAndSettle();
    expect(
      find.text('El servidor devolvió una respuesta inesperada.'),
      findsOneWidget,
    );
    expect(find.text('Reintentar'), findsOneWidget);
  });
  testWidgets('Crear tablero invalida listado al volver', (tester) async {
    var created = false;
    adapter.onGet(
      '/api/v1/boards/',
      (s) =>
          s.reply(200, page(created ? [board(1, 'Nuevo tablero prueba')] : [])),
      queryParameters: {'page': 1},
    );
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          if (options.method == 'POST' && options.path == '/api/v1/boards/') {
            created = true;
            adapter.onGet(
              '/api/v1/boards/',
              (s) => s.reply(200, page([board(1, 'Nuevo tablero prueba')])),
              queryParameters: {'page': 1},
            );
          }
          handler.next(options);
        },
      ),
    );
    adapter.onPost(
      '/api/v1/boards/',
      (s) => s.reply(201, board(1, 'Nuevo tablero prueba')),
      data: {'name': 'Nuevo tablero prueba', 'description': ''},
    );
    await mount(tester, authenticated: true);
    await tester.tap(find.text('Boards'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Nuevo'));
    await tester.pumpAndSettle();
    await tester.enterText(
      find.widgetWithText(TextFormField, 'Nombre'),
      'Nuevo tablero prueba',
    );
    await tester.tap(find.text('Crear tablero'));
    await tester.pumpAndSettle();
    expect(created, true);
    expect(find.text('Nuevo tablero prueba'), findsOneWidget);
  });
  testWidgets('Los chips envían ids de estado, sprint y usuario', (
    tester,
  ) async {
    final task = <String, dynamic>{
      'id': 8,
      'board_id': 2,
      'sprint': {'id': 4, 'name': 'Sprint activo'},
      'status': {'id': 3, 'name': 'En progreso', 'color': '#0a7ea4'},
      'user_id': 1,
      'assigned_to_id': 7,
      'title': 'Tarea con chips',
      'description': '',
      'created': 'now',
      'modified': 'now',
    };
    adapter.onGet(
      '/api/v1/boards/2/',
      (s) => s.reply(200, board(2, 'Tablero')),
    );
    adapter.onGet(
      '/api/v1/boards/2/tasks/',
      (s) => s.reply(200, page([])),
      queryParameters: {'page': 1},
    );
    adapter.onGet(
      '/api/v1/boards/2/statuses/',
      (s) => s.reply(
        200,
        page([
          {'id': 3, 'name': 'En progreso', 'order': 0, 'color': '#0a7ea4'},
        ]),
      ),
      queryParameters: {'page': 1},
    );
    adapter.onGet(
      '/api/v1/boards/2/sprints/',
      (s) => s.reply(
        200,
        page([
          {
            'id': 4,
            'name': 'Sprint activo',
            'start_date': null,
            'end_date': null,
            'created': 'now',
            'modified': 'now',
          },
        ]),
      ),
      queryParameters: {'page': 1},
    );
    adapter.onGet(
      '/api/v1/boards/2/members/',
      (s) => s.reply(
        200,
        page([
          {
            'id': 99,
            'board_id': 2,
            'user': {
              'id': 7,
              'username': 'member',
              'email': 'member@example.com',
            },
            'role': 'member',
            'created': 'now',
          },
        ]),
      ),
      queryParameters: {'page': 1},
    );
    Map<String, dynamic>? submitted;
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          if (options.method == 'POST' &&
              options.path == '/api/v1/boards/2/tasks/') {
            submitted = Map<String, dynamic>.from(options.data as Map);
            adapter.onGet(
              '/api/v1/boards/2/tasks/',
              (s) => s.reply(200, page([task])),
              queryParameters: {'page': 1},
            );
          }
          handler.next(options);
        },
      ),
    );
    adapter.onPost(
      '/api/v1/boards/2/tasks/',
      (s) => s.reply(201, task),
      data: {
        'title': 'Tarea con chips',
        'description': '',
        'status_id': 3,
        'sprint_id': 4,
        'assigned_to_id': 7,
      },
    );
    await mount(tester, authenticated: true);
    ProviderScope.containerOf(
      tester.element(find.byType(TodoApp)),
    ).read(routerProvider).go('/board/2/tasks/new');
    await tester.pumpAndSettle();
    await tester.enterText(
      find.widgetWithText(TextFormField, 'Título'),
      'Tarea con chips',
    );
    for (final label in [
      'En progreso',
      'Sprint activo',
      'member@example.com',
    ]) {
      await tester.ensureVisible(find.widgetWithText(ChoiceChip, label));
      await tester.tap(find.widgetWithText(ChoiceChip, label));
      await tester.pump();
    }
    await tester.ensureVisible(find.text('Crear tarea'));
    await tester.tap(find.text('Crear tarea'));
    await tester.pumpAndSettle();
    expect(submitted?['assigned_to_id'], 7);
    expect(submitted?['status_id'], 3);
    expect(submitted?['sprint_id'], 4);
    expect(find.text('Tarea con chips'), findsOneWidget);
  });
  testWidgets('Registro espera 500 ms antes de validar contraseña', (
    tester,
  ) async {
    var validations = 0;
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          if (options.path == '/api/v1/auth/password/validate/') validations++;
          handler.next(options);
        },
      ),
    );
    adapter.onPost(
      '/api/v1/auth/password/validate/',
      (s) => s.reply(400, {
        'password': ['Demasiado corta'],
      }),
      data: {'password': '123'},
    );
    await mount(tester);
    await tester.tap(find.text('Users'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Crear cuenta'));
    await tester.pumpAndSettle();
    await tester.enterText(
      find.widgetWithText(TextFormField, 'Contraseña'),
      '123',
    );
    await tester.pump(const Duration(milliseconds: 499));
    expect(validations, 0);
    await tester.pump(const Duration(milliseconds: 1));
    await tester.pumpAndSettle();
    expect(validations, 1);
    expect(find.text('Demasiado corta'), findsOneWidget);
  });
}
