import 'package:dio/dio.dart';
import '../../core/network/api_call.dart';
import '../../domain/models/models.dart';
import '../../domain/models/pagination.dart';

class SprintDataSource {
  SprintDataSource(this.dio);
  final Dio dio;
  Future<Paginated<Sprint>> fetchSprints(int boardId, int page) => apiCall(
    () => dio.request(
      '/api/v1/boards/$boardId/sprints/',
      options: Options(method: 'GET'),
      queryParameters: {'page': page}
        ..removeWhere((key, value) => value == null),
    ),
    (data) => Paginated.fromJson(data, Sprint.fromJson),
  );
  Future<Sprint> createSprint(int boardId, SprintInput input) => apiCall(
    () => dio.request(
      '/api/v1/boards/$boardId/sprints/',
      options: Options(method: 'POST'),
      data: input.toJson(),
    ),
    (data) => Sprint.fromJson(data as Map<String, dynamic>),
  );
  Future<Sprint> updateSprint(int boardId, int id, SprintInput input) =>
      apiCall(
        () => dio.request(
          '/api/v1/boards/$boardId/sprints/$id/',
          options: Options(method: 'PATCH'),
          data: input.toJson(),
        ),
        (data) => Sprint.fromJson(data as Map<String, dynamic>),
      );
  Future<void> deleteSprint(int boardId, int id) => apiCall(
    () => dio.request(
      '/api/v1/boards/$boardId/sprints/$id/',
      options: Options(method: 'DELETE'),
    ),
    (_) {},
  );
}
