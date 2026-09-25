import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:todoapp_flutter/core/network/api_exception.dart';
import 'package:todoapp_flutter/data/datasources/comment_datasource.dart';
import 'package:todoapp_flutter/data/repositories/comment_repository_impl.dart';
import 'package:todoapp_flutter/domain/models/models.dart';
import 'package:todoapp_flutter/domain/usecases/get_comments.dart';
import 'package:todoapp_flutter/domain/usecases/create_comment.dart';
import 'package:todoapp_flutter/domain/usecases/update_comment.dart';
import 'package:todoapp_flutter/domain/usecases/delete_comment.dart';

void main() {
  late Dio dio;
  late DioAdapter adapter;
  late CommentRepositoryImpl repository;
  setUp(() {
    dio = Dio(BaseOptions(baseUrl: 'https://test.example'));
    adapter = DioAdapter(dio: dio);
    repository = CommentRepositoryImpl(CommentDataSource(dio));
  });
  test('GetComments: ruta, parámetros y contrato', () async {
    adapter.onGet(
      '/api/v1/tasks/2/comments/',
      (s) => s.reply(200, <String, dynamic>{
        "count": 1,
        "next": null,
        "previous": null,
        "results": [
          <String, dynamic>{
            "id": 1,
            "task_id": 2,
            "user_id": 7,
            "content": "Comment",
            "created": "2026-01-01",
            "modified": "2026-01-01",
          },
        ],
      }),
      queryParameters: <String, dynamic>{"page": 1},
    );
    final result = await GetComments(repository)(2, 1);
    expect(result.count, 1);
    expect(result.results.single.id, 1);
  });
  test('GetComments: propaga error del servidor', () async {
    adapter.onGet(
      '/api/v1/tasks/2/comments/',
      (s) => s.reply(403, {'detail': 'Sin permiso'}),
      queryParameters: <String, dynamic>{"page": 1},
    );
    await expectLater(
      GetComments(repository)(2, 1),
      throwsA(
        isA<ApiError>().having((e) => e.message, 'message', 'Sin permiso'),
      ),
    );
  });
  test('GetComments: rechaza contrato roto', () async {
    adapter.onGet(
      '/api/v1/tasks/2/comments/',
      (s) => s.reply(200, {'unexpected': true}),
      queryParameters: <String, dynamic>{"page": 1},
    );
    await expectLater(
      GetComments(repository)(2, 1),
      throwsA(isA<ServerError>()),
    );
  });
  test('CreateComment: ruta, parámetros y contrato', () async {
    adapter.onPost(
      '/api/v1/tasks/2/comments/',
      (s) => s.reply(201, <String, dynamic>{
        "id": 1,
        "task_id": 2,
        "user_id": 7,
        "content": "Comment",
        "created": "2026-01-01",
        "modified": "2026-01-01",
      }),
      data: <String, dynamic>{"content": "Comment"},
    );
    final result = await CreateComment(repository)(
      2,
      CommentInput.fromJson(<String, dynamic>{"content": "Comment"}),
    );
    expect(result.id, 1);
  });
  test('CreateComment: propaga error del servidor', () async {
    adapter.onPost(
      '/api/v1/tasks/2/comments/',
      (s) => s.reply(403, {'detail': 'Sin permiso'}),
      data: <String, dynamic>{"content": "Comment"},
    );
    await expectLater(
      CreateComment(repository)(
        2,
        CommentInput.fromJson(<String, dynamic>{"content": "Comment"}),
      ),
      throwsA(
        isA<ApiError>().having((e) => e.message, 'message', 'Sin permiso'),
      ),
    );
  });
  test('CreateComment: rechaza contrato roto', () async {
    adapter.onPost(
      '/api/v1/tasks/2/comments/',
      (s) => s.reply(200, {'unexpected': true}),
      data: <String, dynamic>{"content": "Comment"},
    );
    await expectLater(
      CreateComment(repository)(
        2,
        CommentInput.fromJson(<String, dynamic>{"content": "Comment"}),
      ),
      throwsA(isA<ServerError>()),
    );
  });
  test('UpdateComment: ruta, parámetros y contrato', () async {
    adapter.onPatch(
      '/api/v1/tasks/2/comments/1/',
      (s) => s.reply(200, <String, dynamic>{
        "id": 1,
        "task_id": 2,
        "user_id": 7,
        "content": "Comment",
        "created": "2026-01-01",
        "modified": "2026-01-01",
      }),
      data: <String, dynamic>{"content": "Comment"},
    );
    final result = await UpdateComment(repository)(
      2,
      1,
      CommentInput.fromJson(<String, dynamic>{"content": "Comment"}),
    );
    expect(result.id, 1);
  });
  test('UpdateComment: propaga error del servidor', () async {
    adapter.onPatch(
      '/api/v1/tasks/2/comments/1/',
      (s) => s.reply(403, {'detail': 'Sin permiso'}),
      data: <String, dynamic>{"content": "Comment"},
    );
    await expectLater(
      UpdateComment(repository)(
        2,
        1,
        CommentInput.fromJson(<String, dynamic>{"content": "Comment"}),
      ),
      throwsA(
        isA<ApiError>().having((e) => e.message, 'message', 'Sin permiso'),
      ),
    );
  });
  test('UpdateComment: rechaza contrato roto', () async {
    adapter.onPatch(
      '/api/v1/tasks/2/comments/1/',
      (s) => s.reply(200, {'unexpected': true}),
      data: <String, dynamic>{"content": "Comment"},
    );
    await expectLater(
      UpdateComment(repository)(
        2,
        1,
        CommentInput.fromJson(<String, dynamic>{"content": "Comment"}),
      ),
      throwsA(isA<ServerError>()),
    );
  });
  test('DeleteComment: ruta, parámetros y contrato', () async {
    adapter.onDelete('/api/v1/tasks/2/comments/1/', (s) => s.reply(204, null));
    await DeleteComment(repository)(2, 1);
  });
  test('DeleteComment: propaga error del servidor', () async {
    adapter.onDelete(
      '/api/v1/tasks/2/comments/1/',
      (s) => s.reply(403, {'detail': 'Sin permiso'}),
    );
    await expectLater(
      DeleteComment(repository)(2, 1),
      throwsA(
        isA<ApiError>().having((e) => e.message, 'message', 'Sin permiso'),
      ),
    );
  });
}
