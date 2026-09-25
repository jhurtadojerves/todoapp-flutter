import '../models/models.dart';
import '../repositories/sprint_repository.dart';

class CreateSprint {
  const CreateSprint(this.repository);
  final SprintRepository repository;
  Future<Sprint> call(int boardId, SprintInput input) =>
      repository.createSprint(boardId, input);
}
