import '../models/models.dart';
import '../repositories/board_repository.dart';

class UpdateBoard {
  const UpdateBoard(this.repository);
  final BoardRepository repository;
  Future<Board> call(int id, BoardInput input) =>
      repository.updateBoard(id, input);
}
