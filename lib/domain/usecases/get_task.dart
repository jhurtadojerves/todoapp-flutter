import '../models/models.dart';
import '../repositories/task_repository.dart';

class GetTask {
  const GetTask(this.repository);
  final TaskRepository repository;
  Future<Task> call(int id) => repository.fetchTask(id);
}
