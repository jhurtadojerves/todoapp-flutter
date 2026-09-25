import '../models/models.dart';
import '../repositories/status_repository.dart';

class CreateStatus {
  const CreateStatus(this.repository);
  final StatusRepository repository;
  Future<BoardStatus> call(int boardId, BoardStatusInput input) =>
      repository.createStatus(boardId, input);
}
