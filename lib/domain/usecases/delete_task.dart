import '../repositories/task_repository.dart';

class DeleteTask {
  const DeleteTask(this.repository);
  final TaskRepository repository;
  Future<void> call(int id) => repository.deleteTask(id);
}
