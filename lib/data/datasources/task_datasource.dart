import 'package:dio/dio.dart';
import '../../core/network/api_call.dart';
import '../../domain/models/models.dart';
import '../../domain/models/pagination.dart';

class TaskDataSource {
  TaskDataSource(this.dio);
  final Dio dio;
  Future<Paginated<Task>> fetchTasks(
    int boardId,
    int page, {
    int? status,
    int? sprint,
    int? assignedTo,
  }) => apiCall(
    () => dio.request(
      '/api/v1/boards/$boardId/tasks/',
      options: Options(method: 'GET'),
      queryParameters: {
        'page': page,
        'status': status,
        'sprint': sprint,
        'assigned_to': assignedTo,
      }..removeWhere((key, value) => value == null),
    ),
    (data) => Paginated.fromJson(data, Task.fromJson),
  );
  Future<Task> fetchTask(int id) => apiCall(
    () => dio.request('/api/v1/tasks/$id/', options: Options(method: 'GET')),
    (data) => Task.fromJson(data as Map<String, dynamic>),
  );
  Future<Task> createTask(int boardId, TaskInput input) => apiCall(
    () => dio.request(
      '/api/v1/boards/$boardId/tasks/',
      options: Options(method: 'POST'),
      data: input.toJson(),
    ),
    (data) => Task.fromJson(data as Map<String, dynamic>),
  );
  Future<Task> updateTask(int id, TaskInput input) => apiCall(
    () => dio.request(
      '/api/v1/tasks/$id/',
      options: Options(method: 'PATCH'),
      data: input.toJson(),
    ),
    (data) => Task.fromJson(data as Map<String, dynamic>),
  );
  Future<void> deleteTask(int id) => apiCall(
    () => dio.request('/api/v1/tasks/$id/', options: Options(method: 'DELETE')),
    (_) {},
  );
}
