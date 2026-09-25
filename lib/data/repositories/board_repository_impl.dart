import '../../domain/models/models.dart';
import '../../domain/models/pagination.dart';
import '../../domain/repositories/board_repository.dart';
import '../datasources/board_datasource.dart';

class BoardRepositoryImpl implements BoardRepository {
  BoardRepositoryImpl(this.source);
  final BoardDataSource source;
  @override
  Future<Paginated<Board>> fetchBoards(int page) => source.fetchBoards(page);
  @override
  Future<Board> fetchBoard(int id) => source.fetchBoard(id);
  @override
  Future<Board> createBoard(BoardInput input) => source.createBoard(input);
  @override
  Future<Board> updateBoard(int id, BoardInput input) =>
      source.updateBoard(id, input);
  @override
  Future<void> deleteBoard(int id) => source.deleteBoard(id);
}
