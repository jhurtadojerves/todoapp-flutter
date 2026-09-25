import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:todoapp_flutter/core/network/api_exception.dart';
import 'package:todoapp_flutter/data/datasources/sprint_datasource.dart';
import 'package:todoapp_flutter/data/repositories/sprint_repository_impl.dart';
import 'package:todoapp_flutter/domain/models/models.dart';
import 'package:todoapp_flutter/domain/usecases/get_sprints.dart';
import 'package:todoapp_flutter/domain/usecases/create_sprint.dart';
import 'package:todoapp_flutter/domain/usecases/update_sprint.dart';
import 'package:todoapp_flutter/domain/usecases/delete_sprint.dart';

void main() {
  late Dio dio;
  late DioAdapter adapter;
  late SprintRepositoryImpl repository;
  setUp(() {
    dio = Dio(BaseOptions(baseUrl: 'https://test.example'));
    adapter = DioAdapter(dio: dio);
    repository = SprintRepositoryImpl(SprintDataSource(dio));
  });
  test('GetSprints: ruta, parámetros y contrato', () async {
    adapter.onGet(
      '/api/v1/boards/2/sprints/',
      (s) => s.reply(200, <String, dynamic>{
        "count": 1,
        "next": null,
        "previous": null,
        "results": [
          <String, dynamic>{
            "id": 1,
            "name": "Sprint",
            "start_date": null,
            "end_date": null,
            "created": "2026-01-01",
            "modified": "2026-01-01",
          },
        ],
      }),
      queryParameters: <String, dynamic>{"page": 1},
    );
    final result = await GetSprints(repository)(2, 1);
    expect(result.count, 1);
    expect(result.results.single.id, 1);
  });
  test('GetSprints: propaga error del servidor', () async {
    adapter.onGet(
      '/api/v1/boards/2/sprints/',
      (s) => s.reply(403, {'detail': 'Sin permiso'}),
      queryParameters: <String, dynamic>{"page": 1},
    );
    await expectLater(
      GetSprints(repository)(2, 1),
      throwsA(
        isA<ApiError>().having((e) => e.message, 'message', 'Sin permiso'),
      ),
    );
  });
  test('GetSprints: rechaza contrato roto', () async {
    adapter.onGet(
      '/api/v1/boards/2/sprints/',
      (s) => s.reply(200, {'unexpected': true}),
      queryParameters: <String, dynamic>{"page": 1},
    );
    await expectLater(
      GetSprints(repository)(2, 1),
      throwsA(isA<ServerError>()),
    );
  });
  test('CreateSprint: ruta, parámetros y contrato', () async {
    adapter.onPost(
      '/api/v1/boards/2/sprints/',
      (s) => s.reply(201, <String, dynamic>{
        "id": 1,
        "name": "Sprint",
        "start_date": null,
        "end_date": null,
        "created": "2026-01-01",
        "modified": "2026-01-01",
      }),
      data: <String, dynamic>{
        "name": "Sprint",
        "start_date": "2026-01-01",
        "end_date": null,
      },
    );
    final result = await CreateSprint(repository)(
      2,
      SprintInput.fromJson(<String, dynamic>{
        "name": "Sprint",
        "start_date": "2026-01-01",
        "end_date": null,
      }),
    );
    expect(result.id, 1);
  });
  test('CreateSprint: propaga error del servidor', () async {
    adapter.onPost(
      '/api/v1/boards/2/sprints/',
      (s) => s.reply(403, {'detail': 'Sin permiso'}),
      data: <String, dynamic>{
        "name": "Sprint",
        "start_date": "2026-01-01",
        "end_date": null,
      },
    );
    await expectLater(
      CreateSprint(repository)(
        2,
        SprintInput.fromJson(<String, dynamic>{
          "name": "Sprint",
          "start_date": "2026-01-01",
          "end_date": null,
        }),
      ),
      throwsA(
        isA<ApiError>().having((e) => e.message, 'message', 'Sin permiso'),
      ),
    );
  });
  test('CreateSprint: rechaza contrato roto', () async {
    adapter.onPost(
      '/api/v1/boards/2/sprints/',
      (s) => s.reply(200, {'unexpected': true}),
      data: <String, dynamic>{
        "name": "Sprint",
        "start_date": "2026-01-01",
        "end_date": null,
      },
    );
    await expectLater(
      CreateSprint(repository)(
        2,
        SprintInput.fromJson(<String, dynamic>{
          "name": "Sprint",
          "start_date": "2026-01-01",
          "end_date": null,
        }),
      ),
      throwsA(isA<ServerError>()),
    );
  });
  test('UpdateSprint: ruta, parámetros y contrato', () async {
    adapter.onPatch(
      '/api/v1/boards/2/sprints/1/',
      (s) => s.reply(200, <String, dynamic>{
        "id": 1,
        "name": "Sprint",
        "start_date": null,
        "end_date": null,
        "created": "2026-01-01",
        "modified": "2026-01-01",
      }),
      data: <String, dynamic>{
        "name": "Sprint",
        "start_date": "2026-01-01",
        "end_date": null,
      },
    );
    final result = await UpdateSprint(repository)(
      2,
      1,
      SprintInput.fromJson(<String, dynamic>{
        "name": "Sprint",
        "start_date": "2026-01-01",
        "end_date": null,
      }),
    );
    expect(result.id, 1);
  });
  test('UpdateSprint: propaga error del servidor', () async {
    adapter.onPatch(
      '/api/v1/boards/2/sprints/1/',
      (s) => s.reply(403, {'detail': 'Sin permiso'}),
      data: <String, dynamic>{
        "name": "Sprint",
        "start_date": "2026-01-01",
        "end_date": null,
      },
    );
    await expectLater(
      UpdateSprint(repository)(
        2,
        1,
        SprintInput.fromJson(<String, dynamic>{
          "name": "Sprint",
          "start_date": "2026-01-01",
          "end_date": null,
        }),
      ),
      throwsA(
        isA<ApiError>().having((e) => e.message, 'message', 'Sin permiso'),
      ),
    );
  });
  test('UpdateSprint: rechaza contrato roto', () async {
    adapter.onPatch(
      '/api/v1/boards/2/sprints/1/',
      (s) => s.reply(200, {'unexpected': true}),
      data: <String, dynamic>{
        "name": "Sprint",
        "start_date": "2026-01-01",
        "end_date": null,
      },
    );
    await expectLater(
      UpdateSprint(repository)(
        2,
        1,
        SprintInput.fromJson(<String, dynamic>{
          "name": "Sprint",
          "start_date": "2026-01-01",
          "end_date": null,
        }),
      ),
      throwsA(isA<ServerError>()),
    );
  });
  test('DeleteSprint: ruta, parámetros y contrato', () async {
    adapter.onDelete('/api/v1/boards/2/sprints/1/', (s) => s.reply(204, null));
    await DeleteSprint(repository)(2, 1);
  });
  test('DeleteSprint: propaga error del servidor', () async {
    adapter.onDelete(
      '/api/v1/boards/2/sprints/1/',
      (s) => s.reply(403, {'detail': 'Sin permiso'}),
    );
    await expectLater(
      DeleteSprint(repository)(2, 1),
      throwsA(
        isA<ApiError>().having((e) => e.message, 'message', 'Sin permiso'),
      ),
    );
  });
}
