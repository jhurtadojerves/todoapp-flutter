import '../models/models.dart';
import '../models/pagination.dart';
import '../repositories/board_repository.dart';

class GetBoards {
  const GetBoards(this.repository);
  final BoardRepository repository;
  Future<Paginated<Board>> call(int page) => repository.fetchBoards(page);
}
