import '../repositories/board_repository.dart';

class DeleteBoard {
  const DeleteBoard(this.repository);
  final BoardRepository repository;
  Future<void> call(int id) => repository.deleteBoard(id);
}
