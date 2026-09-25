import '../models/models.dart';
import '../models/pagination.dart';
import '../repositories/status_repository.dart';

class GetStatuses {
  const GetStatuses(this.repository);
  final StatusRepository repository;
  Future<Paginated<BoardStatus>> call(int boardId, int page) =>
      repository.fetchStatuses(boardId, page);
}
