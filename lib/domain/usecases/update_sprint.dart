import '../models/models.dart';
import '../repositories/sprint_repository.dart';

class UpdateSprint {
  const UpdateSprint(this.repository);
  final SprintRepository repository;
  Future<Sprint> call(int boardId, int id, SprintInput input) =>
      repository.updateSprint(boardId, id, input);
}
