import '../models/models.dart';
import '../repositories/status_repository.dart';

class UpdateStatus {
  const UpdateStatus(this.repository);
  final StatusRepository repository;
  Future<BoardStatus> call(int boardId, int id, BoardStatusInput input) =>
      repository.updateStatus(boardId, id, input);
}
