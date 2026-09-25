import '../repositories/status_repository.dart';

class DeleteStatus {
  const DeleteStatus(this.repository);
  final StatusRepository repository;
  Future<void> call(int boardId, int id) =>
      repository.deleteStatus(boardId, id);
}
