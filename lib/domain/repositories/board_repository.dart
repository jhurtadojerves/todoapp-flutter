import '../../domain/models/models.dart';
import '../../domain/models/pagination.dart';

abstract interface class BoardRepository {
  Future<Paginated<Board>> fetchBoards(int page);
  Future<Board> fetchBoard(int id);
  Future<Board> createBoard(BoardInput input);
  Future<Board> updateBoard(int id, BoardInput input);
  Future<void> deleteBoard(int id);
}
