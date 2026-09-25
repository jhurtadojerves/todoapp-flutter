import '../../domain/models/models.dart';
import '../../domain/models/pagination.dart';

abstract interface class TaskRepository {
  Future<Paginated<Task>> fetchTasks(
    int boardId,
    int page, {
    int? status,
    int? sprint,
    int? assignedTo,
  });
  Future<Task> fetchTask(int id);
  Future<Task> createTask(int boardId, TaskInput input);
  Future<Task> updateTask(int id, TaskInput input);
  Future<void> deleteTask(int id);
}
