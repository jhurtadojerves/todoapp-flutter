import '../repositories/sprint_repository.dart';

class DeleteSprint {
  const DeleteSprint(this.repository);
  final SprintRepository repository;
  Future<void> call(int boardId, int id) =>
      repository.deleteSprint(boardId, id);
}
