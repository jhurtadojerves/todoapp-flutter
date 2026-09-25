import 'package:dio/dio.dart';
import '../../core/network/api_call.dart';
import '../../domain/models/models.dart';
import '../../domain/models/pagination.dart';

class StatusDataSource {
  StatusDataSource(this.dio);
  final Dio dio;
  Future<Paginated<BoardStatus>> fetchStatuses(int boardId, int page) =>
      apiCall(
        () => dio.request(
          '/api/v1/boards/$boardId/statuses/',
          options: Options(method: 'GET'),
          queryParameters: {'page': page}
            ..removeWhere((key, value) => value == null),
        ),
        (data) => Paginated.fromJson(data, BoardStatus.fromJson),
      );
  Future<BoardStatus> createStatus(int boardId, BoardStatusInput input) =>
      apiCall(
        () => dio.request(
          '/api/v1/boards/$boardId/statuses/',
          options: Options(method: 'POST'),
          data: input.toJson(),
        ),
        (data) => BoardStatus.fromJson(data as Map<String, dynamic>),
      );
  Future<BoardStatus> updateStatus(
    int boardId,
    int id,
    BoardStatusInput input,
  ) => apiCall(
    () => dio.request(
      '/api/v1/boards/$boardId/statuses/$id/',
      options: Options(method: 'PATCH'),
      data: input.toJson(),
    ),
    (data) => BoardStatus.fromJson(data as Map<String, dynamic>),
  );
  Future<void> deleteStatus(int boardId, int id) => apiCall(
    () => dio.request(
      '/api/v1/boards/$boardId/statuses/$id/',
      options: Options(method: 'DELETE'),
    ),
    (_) {},
  );
}
