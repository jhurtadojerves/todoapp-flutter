import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:todoapp_flutter/core/network/api_exception.dart';
import 'package:todoapp_flutter/data/datasources/status_datasource.dart';
import 'package:todoapp_flutter/data/repositories/status_repository_impl.dart';
import 'package:todoapp_flutter/domain/models/models.dart';
import 'package:todoapp_flutter/domain/usecases/get_statuses.dart';
import 'package:todoapp_flutter/domain/usecases/create_status.dart';
import 'package:todoapp_flutter/domain/usecases/update_status.dart';
import 'package:todoapp_flutter/domain/usecases/delete_status.dart';

void main() {
  late Dio dio;
  late DioAdapter adapter;
  late StatusRepositoryImpl repository;
  setUp(() {
    dio = Dio(BaseOptions(baseUrl: 'https://test.example'));
    adapter = DioAdapter(dio: dio);
    repository = StatusRepositoryImpl(StatusDataSource(dio));
  });
  test('GetStatuses: ruta, parámetros y contrato', () async {
    adapter.onGet(
      '/api/v1/boards/2/statuses/',
      (s) => s.reply(200, <String, dynamic>{
        "count": 1,
        "next": null,
        "previous": null,
        "results": [
          <String, dynamic>{
            "id": 1,
            "name": "Todo",
            "order": 0,
            "color": "#0a7ea4",
          },
        ],
      }),
      queryParameters: <String, dynamic>{"page": 1},
    );
    final result = await GetStatuses(repository)(2, 1);
    expect(result.count, 1);
    expect(result.results.single.id, 1);
  });
  test('GetStatuses: propaga error del servidor', () async {
    adapter.onGet(
      '/api/v1/boards/2/statuses/',
      (s) => s.reply(403, {'detail': 'Sin permiso'}),
      queryParameters: <String, dynamic>{"page": 1},
    );
    await expectLater(
      GetStatuses(repository)(2, 1),
      throwsA(
        isA<ApiError>().having((e) => e.message, 'message', 'Sin permiso'),
      ),
    );
  });
  test('GetStatuses: rechaza contrato roto', () async {
    adapter.onGet(
      '/api/v1/boards/2/statuses/',
      (s) => s.reply(200, {'unexpected': true}),
      queryParameters: <String, dynamic>{"page": 1},
    );
    await expectLater(
      GetStatuses(repository)(2, 1),
      throwsA(isA<ServerError>()),
    );
  });
  test('CreateStatus: ruta, parámetros y contrato', () async {
    adapter.onPost(
      '/api/v1/boards/2/statuses/',
      (s) => s.reply(201, <String, dynamic>{
        "id": 1,
        "name": "Todo",
        "order": 0,
        "color": "#0a7ea4",
      }),
      data: <String, dynamic>{"name": "Todo", "order": 0, "color": "#0a7ea4"},
    );
    final result = await CreateStatus(repository)(
      2,
      BoardStatusInput.fromJson(<String, dynamic>{
        "name": "Todo",
        "order": 0,
        "color": "#0a7ea4",
      }),
    );
    expect(result.id, 1);
  });
  test('CreateStatus: propaga error del servidor', () async {
    adapter.onPost(
      '/api/v1/boards/2/statuses/',
      (s) => s.reply(403, {'detail': 'Sin permiso'}),
      data: <String, dynamic>{"name": "Todo", "order": 0, "color": "#0a7ea4"},
    );
    await expectLater(
      CreateStatus(repository)(
        2,
        BoardStatusInput.fromJson(<String, dynamic>{
          "name": "Todo",
          "order": 0,
          "color": "#0a7ea4",
        }),
      ),
      throwsA(
        isA<ApiError>().having((e) => e.message, 'message', 'Sin permiso'),
      ),
    );
  });
  test('CreateStatus: rechaza contrato roto', () async {
    adapter.onPost(
      '/api/v1/boards/2/statuses/',
      (s) => s.reply(200, {'unexpected': true}),
      data: <String, dynamic>{"name": "Todo", "order": 0, "color": "#0a7ea4"},
    );
    await expectLater(
      CreateStatus(repository)(
        2,
        BoardStatusInput.fromJson(<String, dynamic>{
          "name": "Todo",
          "order": 0,
          "color": "#0a7ea4",
        }),
      ),
      throwsA(isA<ServerError>()),
    );
  });
  test('UpdateStatus: ruta, parámetros y contrato', () async {
    adapter.onPatch(
      '/api/v1/boards/2/statuses/1/',
      (s) => s.reply(200, <String, dynamic>{
        "id": 1,
        "name": "Todo",
        "order": 0,
        "color": "#0a7ea4",
      }),
      data: <String, dynamic>{"name": "Todo", "order": 0, "color": "#0a7ea4"},
    );
    final result = await UpdateStatus(repository)(
      2,
      1,
      BoardStatusInput.fromJson(<String, dynamic>{
        "name": "Todo",
        "order": 0,
        "color": "#0a7ea4",
      }),
    );
    expect(result.id, 1);
  });
  test('UpdateStatus: propaga error del servidor', () async {
    adapter.onPatch(
      '/api/v1/boards/2/statuses/1/',
      (s) => s.reply(403, {'detail': 'Sin permiso'}),
      data: <String, dynamic>{"name": "Todo", "order": 0, "color": "#0a7ea4"},
    );
    await expectLater(
      UpdateStatus(repository)(
        2,
        1,
        BoardStatusInput.fromJson(<String, dynamic>{
          "name": "Todo",
          "order": 0,
          "color": "#0a7ea4",
        }),
      ),
      throwsA(
        isA<ApiError>().having((e) => e.message, 'message', 'Sin permiso'),
      ),
    );
  });
  test('UpdateStatus: rechaza contrato roto', () async {
    adapter.onPatch(
      '/api/v1/boards/2/statuses/1/',
      (s) => s.reply(200, {'unexpected': true}),
      data: <String, dynamic>{"name": "Todo", "order": 0, "color": "#0a7ea4"},
    );
    await expectLater(
      UpdateStatus(repository)(
        2,
        1,
        BoardStatusInput.fromJson(<String, dynamic>{
          "name": "Todo",
          "order": 0,
          "color": "#0a7ea4",
        }),
      ),
      throwsA(isA<ServerError>()),
    );
  });
  test('DeleteStatus: ruta, parámetros y contrato', () async {
    adapter.onDelete('/api/v1/boards/2/statuses/1/', (s) => s.reply(204, null));
    await DeleteStatus(repository)(2, 1);
  });
  test('DeleteStatus: propaga error del servidor', () async {
    adapter.onDelete(
      '/api/v1/boards/2/statuses/1/',
      (s) => s.reply(403, {'detail': 'Sin permiso'}),
    );
    await expectLater(
      DeleteStatus(repository)(2, 1),
      throwsA(
        isA<ApiError>().having((e) => e.message, 'message', 'Sin permiso'),
      ),
    );
  });
}
