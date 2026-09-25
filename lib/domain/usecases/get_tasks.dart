import '../models/models.dart';
import '../models/pagination.dart';
import '../repositories/task_repository.dart';

class GetTasks {
  const GetTasks(this.repository);
  final TaskRepository repository;
  Future<Paginated<Task>> call(
    int boardId,
    int page, {
    int? status,
    int? sprint,
    int? assignedTo,
  }) => repository.fetchTasks(
    boardId,
    page,
    status: status,
    sprint: sprint,
    assignedTo: assignedTo,
  );
}
