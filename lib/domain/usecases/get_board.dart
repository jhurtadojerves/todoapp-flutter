import '../models/models.dart';
import '../repositories/board_repository.dart';

class GetBoard {
  const GetBoard(this.repository);
  final BoardRepository repository;
  Future<Board> call(int id) => repository.fetchBoard(id);
}
