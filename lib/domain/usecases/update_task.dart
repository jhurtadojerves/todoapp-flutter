import '../models/models.dart';
import '../repositories/task_repository.dart';

class UpdateTask {
  const UpdateTask(this.repository);
  final TaskRepository repository;
  Future<Task> call(int id, TaskInput input) =>
      repository.updateTask(id, input);
}
