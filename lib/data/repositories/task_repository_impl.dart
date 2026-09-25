import '../../domain/models/models.dart';
import '../../domain/models/pagination.dart';
import '../../domain/repositories/task_repository.dart';
import '../datasources/task_datasource.dart';

class TaskRepositoryImpl implements TaskRepository {
  TaskRepositoryImpl(this.source);
  final TaskDataSource source;
  @override
  Future<Paginated<Task>> fetchTasks(
    int boardId,
    int page, {
    int? status,
    int? sprint,
    int? assignedTo,
  }) => source.fetchTasks(
    boardId,
    page,
    status: status,
    sprint: sprint,
    assignedTo: assignedTo,
  );
  @override
  Future<Task> fetchTask(int id) => source.fetchTask(id);
  @override
  Future<Task> createTask(int boardId, TaskInput input) =>
      source.createTask(boardId, input);
  @override
  Future<Task> updateTask(int id, TaskInput input) =>
      source.updateTask(id, input);
  @override
  Future<void> deleteTask(int id) => source.deleteTask(id);
}
