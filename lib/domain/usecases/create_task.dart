import '../models/models.dart';
import '../repositories/task_repository.dart';

class CreateTask {
  const CreateTask(this.repository);
  final TaskRepository repository;
  Future<Task> call(int boardId, TaskInput input) =>
      repository.createTask(boardId, input);
}
