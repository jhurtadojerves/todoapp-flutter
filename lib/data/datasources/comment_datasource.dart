import 'package:dio/dio.dart';
import '../../core/network/api_call.dart';
import '../../domain/models/models.dart';
import '../../domain/models/pagination.dart';

class CommentDataSource {
  CommentDataSource(this.dio);
  final Dio dio;
  Future<Paginated<Comment>> fetchComments(int taskId, int page) => apiCall(
    () => dio.request(
      '/api/v1/tasks/$taskId/comments/',
      options: Options(method: 'GET'),
      queryParameters: {'page': page}
        ..removeWhere((key, value) => value == null),
    ),
    (data) => Paginated.fromJson(data, Comment.fromJson),
  );
  Future<Comment> createComment(int taskId, CommentInput input) => apiCall(
    () => dio.request(
      '/api/v1/tasks/$taskId/comments/',
      options: Options(method: 'POST'),
      data: input.toJson(),
    ),
    (data) => Comment.fromJson(data as Map<String, dynamic>),
  );
  Future<Comment> updateComment(int taskId, int id, CommentInput input) =>
      apiCall(
        () => dio.request(
          '/api/v1/tasks/$taskId/comments/$id/',
          options: Options(method: 'PATCH'),
          data: input.toJson(),
        ),
        (data) => Comment.fromJson(data as Map<String, dynamic>),
      );
  Future<void> deleteComment(int taskId, int id) => apiCall(
    () => dio.request(
      '/api/v1/tasks/$taskId/comments/$id/',
      options: Options(method: 'DELETE'),
    ),
    (_) {},
  );
}
