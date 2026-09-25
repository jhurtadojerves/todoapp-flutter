import '../models/models.dart';
import '../repositories/board_repository.dart';

class CreateBoard {
  const CreateBoard(this.repository);
  final BoardRepository repository;
  Future<Board> call(BoardInput input) => repository.createBoard(input);
}
