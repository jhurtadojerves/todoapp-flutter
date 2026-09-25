import '../../domain/models/models.dart';
import '../../domain/models/pagination.dart';

abstract interface class StatusRepository {
  Future<Paginated<BoardStatus>> fetchStatuses(int boardId, int page);
  Future<BoardStatus> createStatus(int boardId, BoardStatusInput input);
  Future<BoardStatus> updateStatus(int boardId, int id, BoardStatusInput input);
  Future<void> deleteStatus(int boardId, int id);
}
