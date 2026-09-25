import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:todoapp_flutter/core/network/api_exception.dart';
import 'package:todoapp_flutter/data/datasources/task_datasource.dart';
import 'package:todoapp_flutter/data/repositories/task_repository_impl.dart';
import 'package:todoapp_flutter/domain/models/models.dart';
import 'package:todoapp_flutter/domain/usecases/get_tasks.dart';
import 'package:todoapp_flutter/domain/usecases/get_task.dart';
import 'package:todoapp_flutter/domain/usecases/create_task.dart';
import 'package:todoapp_flutter/domain/usecases/update_task.dart';
import 'package:todoapp_flutter/domain/usecases/delete_task.dart';

void main() {
  late Dio dio;
  late DioAdapter adapter;
  late TaskRepositoryImpl repository;
  setUp(() {
    dio = Dio(BaseOptions(baseUrl: 'https://test.example'));
    adapter = DioAdapter(dio: dio);
    repository = TaskRepositoryImpl(TaskDataSource(dio));
  });
  test('GetTasks: ruta, parámetros y contrato', () async {
    adapter.onGet(
      '/api/v1/boards/2/tasks/',
      (s) => s.reply(200, <String, dynamic>{
        "count": 1,
        "next": null,
        "previous": null,
        "results": [
          <String, dynamic>{
            "id": 1,
            "board_id": 2,
            "sprint": null,
            "status": null,
            "user_id": 7,
            "assigned_to_id": null,
            "title": "Task",
            "description": "",
            "created": "2026-01-01",
            "modified": "2026-01-01",
          },
        ],
      }),
      queryParameters: <String, dynamic>{
        "page": 1,
        "status": 3,
        "sprint": 4,
        "assigned_to": 7,
      },
    );
    final result = await GetTasks(repository)(
      2,
      1,
      status: 3,
      sprint: 4,
      assignedTo: 7,
    );
    expect(result.count, 1);
    expect(result.results.single.id, 1);
  });
  test('GetTasks: propaga error del servidor', () async {
    adapter.onGet(
      '/api/v1/boards/2/tasks/',
      (s) => s.reply(403, {'detail': 'Sin permiso'}),
      queryParameters: <String, dynamic>{
        "page": 1,
        "status": 3,
        "sprint": 4,
        "assigned_to": 7,
      },
    );
    await expectLater(
      GetTasks(repository)(2, 1, status: 3, sprint: 4, assignedTo: 7),
      throwsA(
        isA<ApiError>().having((e) => e.message, 'message', 'Sin permiso'),
      ),
    );
  });
  test('GetTasks: rechaza contrato roto', () async {
    adapter.onGet(
      '/api/v1/boards/2/tasks/',
      (s) => s.reply(200, {'unexpected': true}),
      queryParameters: <String, dynamic>{
        "page": 1,
        "status": 3,
        "sprint": 4,
        "assigned_to": 7,
      },
    );
    await expectLater(
      GetTasks(repository)(2, 1, status: 3, sprint: 4, assignedTo: 7),
      throwsA(isA<ServerError>()),
    );
  });
  test('GetTask: ruta, parámetros y contrato', () async {
    adapter.onGet(
      '/api/v1/tasks/1/',
      (s) => s.reply(200, <String, dynamic>{
        "id": 1,
        "board_id": 2,
        "sprint": null,
        "status": null,
        "user_id": 7,
        "assigned_to_id": null,
        "title": "Task",
        "description": "",
        "created": "2026-01-01",
        "modified": "2026-01-01",
      }),
    );
    final result = await GetTask(repository)(1);
    expect(result.id, 1);
  });
  test('GetTask: propaga error del servidor', () async {
    adapter.onGet(
      '/api/v1/tasks/1/',
      (s) => s.reply(403, {'detail': 'Sin permiso'}),
    );
    await expectLater(
      GetTask(repository)(1),
      throwsA(
        isA<ApiError>().having((e) => e.message, 'message', 'Sin permiso'),
      ),
    );
  });
  test('GetTask: rechaza contrato roto', () async {
    adapter.onGet(
      '/api/v1/tasks/1/',
      (s) => s.reply(200, {'unexpected': true}),
    );
    await expectLater(GetTask(repository)(1), throwsA(isA<ServerError>()));
  });
  test('CreateTask: ruta, parámetros y contrato', () async {
    adapter.onPost(
      '/api/v1/boards/2/tasks/',
      (s) => s.reply(201, <String, dynamic>{
        "id": 1,
        "board_id": 2,
        "sprint": null,
        "status": null,
        "user_id": 7,
        "assigned_to_id": null,
        "title": "Task",
        "description": "",
        "created": "2026-01-01",
        "modified": "2026-01-01",
      }),
      data: <String, dynamic>{
        "title": "Task",
        "description": "",
        "status_id": 2,
        "sprint_id": 3,
        "assigned_to_id": 7,
      },
    );
    final result = await CreateTask(repository)(
      2,
      TaskInput.fromJson(<String, dynamic>{
        "title": "Task",
        "description": "",
        "status_id": 2,
        "sprint_id": 3,
        "assigned_to_id": 7,
      }),
    );
    expect(result.id, 1);
  });
  test('CreateTask: propaga error del servidor', () async {
    adapter.onPost(
      '/api/v1/boards/2/tasks/',
      (s) => s.reply(403, {'detail': 'Sin permiso'}),
      data: <String, dynamic>{
        "title": "Task",
        "description": "",
        "status_id": 2,
        "sprint_id": 3,
        "assigned_to_id": 7,
      },
    );
    await expectLater(
      CreateTask(repository)(
        2,
        TaskInput.fromJson(<String, dynamic>{
          "title": "Task",
          "description": "",
          "status_id": 2,
          "sprint_id": 3,
          "assigned_to_id": 7,
        }),
      ),
      throwsA(
        isA<ApiError>().having((e) => e.message, 'message', 'Sin permiso'),
      ),
    );
  });
  test('CreateTask: rechaza contrato roto', () async {
    adapter.onPost(
      '/api/v1/boards/2/tasks/',
      (s) => s.reply(200, {'unexpected': true}),
      data: <String, dynamic>{
        "title": "Task",
        "description": "",
        "status_id": 2,
        "sprint_id": 3,
        "assigned_to_id": 7,
      },
    );
    await expectLater(
      CreateTask(repository)(
        2,
        TaskInput.fromJson(<String, dynamic>{
          "title": "Task",
          "description": "",
          "status_id": 2,
          "sprint_id": 3,
          "assigned_to_id": 7,
        }),
      ),
      throwsA(isA<ServerError>()),
    );
  });
  test('UpdateTask: ruta, parámetros y contrato', () async {
    adapter.onPatch(
      '/api/v1/tasks/1/',
      (s) => s.reply(200, <String, dynamic>{
        "id": 1,
        "board_id": 2,
        "sprint": null,
        "status": null,
        "user_id": 7,
        "assigned_to_id": null,
        "title": "Task",
        "description": "",
        "created": "2026-01-01",
        "modified": "2026-01-01",
      }),
      data: <String, dynamic>{
        "title": "Task",
        "description": "",
        "status_id": 2,
        "sprint_id": 3,
        "assigned_to_id": 7,
      },
    );
    final result = await UpdateTask(repository)(
      1,
      TaskInput.fromJson(<String, dynamic>{
        "title": "Task",
        "description": "",
        "status_id": 2,
        "sprint_id": 3,
        "assigned_to_id": 7,
      }),
    );
    expect(result.id, 1);
  });
  test('UpdateTask: propaga error del servidor', () async {
    adapter.onPatch(
      '/api/v1/tasks/1/',
      (s) => s.reply(403, {'detail': 'Sin permiso'}),
      data: <String, dynamic>{
        "title": "Task",
        "description": "",
        "status_id": 2,
        "sprint_id": 3,
        "assigned_to_id": 7,
      },
    );
    await expectLater(
      UpdateTask(repository)(
        1,
        TaskInput.fromJson(<String, dynamic>{
          "title": "Task",
          "description": "",
          "status_id": 2,
          "sprint_id": 3,
          "assigned_to_id": 7,
        }),
      ),
      throwsA(
        isA<ApiError>().having((e) => e.message, 'message', 'Sin permiso'),
      ),
    );
  });
  test('UpdateTask: rechaza contrato roto', () async {
    adapter.onPatch(
      '/api/v1/tasks/1/',
      (s) => s.reply(200, {'unexpected': true}),
      data: <String, dynamic>{
        "title": "Task",
        "description": "",
        "status_id": 2,
        "sprint_id": 3,
        "assigned_to_id": 7,
      },
    );
    await expectLater(
      UpdateTask(repository)(
        1,
        TaskInput.fromJson(<String, dynamic>{
          "title": "Task",
          "description": "",
          "status_id": 2,
          "sprint_id": 3,
          "assigned_to_id": 7,
        }),
      ),
      throwsA(isA<ServerError>()),
    );
  });
  test('DeleteTask: ruta, parámetros y contrato', () async {
    adapter.onDelete('/api/v1/tasks/1/', (s) => s.reply(204, null));
    await DeleteTask(repository)(1);
  });
  test('DeleteTask: propaga error del servidor', () async {
    adapter.onDelete(
      '/api/v1/tasks/1/',
      (s) => s.reply(403, {'detail': 'Sin permiso'}),
    );
    await expectLater(
      DeleteTask(repository)(1),
      throwsA(
        isA<ApiError>().having((e) => e.message, 'message', 'Sin permiso'),
      ),
    );
  });
}
