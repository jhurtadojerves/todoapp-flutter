import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:todoapp_flutter/core/network/api_exception.dart';
import 'package:todoapp_flutter/data/datasources/board_datasource.dart';
import 'package:todoapp_flutter/data/repositories/board_repository_impl.dart';
import 'package:todoapp_flutter/domain/models/models.dart';
import 'package:todoapp_flutter/domain/usecases/get_boards.dart';
import 'package:todoapp_flutter/domain/usecases/get_board.dart';
import 'package:todoapp_flutter/domain/usecases/create_board.dart';
import 'package:todoapp_flutter/domain/usecases/update_board.dart';
import 'package:todoapp_flutter/domain/usecases/delete_board.dart';

void main() {
  late Dio dio;
  late DioAdapter adapter;
  late BoardRepositoryImpl repository;
  setUp(() {
    dio = Dio(BaseOptions(baseUrl: 'https://test.example'));
    adapter = DioAdapter(dio: dio);
    repository = BoardRepositoryImpl(BoardDataSource(dio));
  });
  test('GetBoards: ruta, parámetros y contrato', () async {
    adapter.onGet(
      '/api/v1/boards/',
      (s) => s.reply(200, <String, dynamic>{
        "count": 1,
        "next": null,
        "previous": null,
        "results": [
          <String, dynamic>{
            "id": 1,
            "name": "Board",
            "description": "Description",
            "user_id": 7,
            "created": "2026-01-01",
            "modified": "2026-01-01",
          },
        ],
      }),
      queryParameters: <String, dynamic>{"page": 1},
    );
    final result = await GetBoards(repository)(1);
    expect(result.count, 1);
    expect(result.results.single.id, 1);
  });
  test('GetBoards: propaga error del servidor', () async {
    adapter.onGet(
      '/api/v1/boards/',
      (s) => s.reply(403, {'detail': 'Sin permiso'}),
      queryParameters: <String, dynamic>{"page": 1},
    );
    await expectLater(
      GetBoards(repository)(1),
      throwsA(
        isA<ApiError>().having((e) => e.message, 'message', 'Sin permiso'),
      ),
    );
  });
  test('GetBoards: rechaza contrato roto', () async {
    adapter.onGet(
      '/api/v1/boards/',
      (s) => s.reply(200, {'unexpected': true}),
      queryParameters: <String, dynamic>{"page": 1},
    );
    await expectLater(GetBoards(repository)(1), throwsA(isA<ServerError>()));
  });
  test('GetBoard: ruta, parámetros y contrato', () async {
    adapter.onGet(
      '/api/v1/boards/1/',
      (s) => s.reply(200, <String, dynamic>{
        "id": 1,
        "name": "Board",
        "description": "Description",
        "user_id": 7,
        "created": "2026-01-01",
        "modified": "2026-01-01",
      }),
    );
    final result = await GetBoard(repository)(1);
    expect(result.id, 1);
  });
  test('GetBoard: propaga error del servidor', () async {
    adapter.onGet(
      '/api/v1/boards/1/',
      (s) => s.reply(403, {'detail': 'Sin permiso'}),
    );
    await expectLater(
      GetBoard(repository)(1),
      throwsA(
        isA<ApiError>().having((e) => e.message, 'message', 'Sin permiso'),
      ),
    );
  });
  test('GetBoard: rechaza contrato roto', () async {
    adapter.onGet(
      '/api/v1/boards/1/',
      (s) => s.reply(200, {'unexpected': true}),
    );
    await expectLater(GetBoard(repository)(1), throwsA(isA<ServerError>()));
  });
  test('CreateBoard: ruta, parámetros y contrato', () async {
    adapter.onPost(
      '/api/v1/boards/',
      (s) => s.reply(201, <String, dynamic>{
        "id": 1,
        "name": "Board",
        "description": "Description",
        "user_id": 7,
        "created": "2026-01-01",
        "modified": "2026-01-01",
      }),
      data: <String, dynamic>{"name": "Board", "description": "Description"},
    );
    final result = await CreateBoard(repository)(
      BoardInput.fromJson(<String, dynamic>{
        "name": "Board",
        "description": "Description",
      }),
    );
    expect(result.id, 1);
  });
  test('CreateBoard: propaga error del servidor', () async {
    adapter.onPost(
      '/api/v1/boards/',
      (s) => s.reply(403, {'detail': 'Sin permiso'}),
      data: <String, dynamic>{"name": "Board", "description": "Description"},
    );
    await expectLater(
      CreateBoard(repository)(
        BoardInput.fromJson(<String, dynamic>{
          "name": "Board",
          "description": "Description",
        }),
      ),
      throwsA(
        isA<ApiError>().having((e) => e.message, 'message', 'Sin permiso'),
      ),
    );
  });
  test('CreateBoard: rechaza contrato roto', () async {
    adapter.onPost(
      '/api/v1/boards/',
      (s) => s.reply(200, {'unexpected': true}),
      data: <String, dynamic>{"name": "Board", "description": "Description"},
    );
    await expectLater(
      CreateBoard(repository)(
        BoardInput.fromJson(<String, dynamic>{
          "name": "Board",
          "description": "Description",
        }),
      ),
      throwsA(isA<ServerError>()),
    );
  });
  test('UpdateBoard: ruta, parámetros y contrato', () async {
    adapter.onPatch(
      '/api/v1/boards/1/',
      (s) => s.reply(200, <String, dynamic>{
        "id": 1,
        "name": "Board",
        "description": "Description",
        "user_id": 7,
        "created": "2026-01-01",
        "modified": "2026-01-01",
      }),
      data: <String, dynamic>{"name": "Board", "description": "Description"},
    );
    final result = await UpdateBoard(repository)(
      1,
      BoardInput.fromJson(<String, dynamic>{
        "name": "Board",
        "description": "Description",
      }),
    );
    expect(result.id, 1);
  });
  test('UpdateBoard: propaga error del servidor', () async {
    adapter.onPatch(
      '/api/v1/boards/1/',
      (s) => s.reply(403, {'detail': 'Sin permiso'}),
      data: <String, dynamic>{"name": "Board", "description": "Description"},
    );
    await expectLater(
      UpdateBoard(repository)(
        1,
        BoardInput.fromJson(<String, dynamic>{
          "name": "Board",
          "description": "Description",
        }),
      ),
      throwsA(
        isA<ApiError>().having((e) => e.message, 'message', 'Sin permiso'),
      ),
    );
  });
  test('UpdateBoard: rechaza contrato roto', () async {
    adapter.onPatch(
      '/api/v1/boards/1/',
      (s) => s.reply(200, {'unexpected': true}),
      data: <String, dynamic>{"name": "Board", "description": "Description"},
    );
    await expectLater(
      UpdateBoard(repository)(
        1,
        BoardInput.fromJson(<String, dynamic>{
          "name": "Board",
          "description": "Description",
        }),
      ),
      throwsA(isA<ServerError>()),
    );
  });
  test('DeleteBoard: ruta, parámetros y contrato', () async {
    adapter.onDelete('/api/v1/boards/1/', (s) => s.reply(204, null));
    await DeleteBoard(repository)(1);
  });
  test('DeleteBoard: propaga error del servidor', () async {
    adapter.onDelete(
      '/api/v1/boards/1/',
      (s) => s.reply(403, {'detail': 'Sin permiso'}),
    );
    await expectLater(
      DeleteBoard(repository)(1),
      throwsA(
        isA<ApiError>().having((e) => e.message, 'message', 'Sin permiso'),
      ),
    );
  });
}
