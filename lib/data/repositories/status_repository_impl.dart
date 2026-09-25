import '../../domain/models/models.dart';
import '../../domain/models/pagination.dart';
import '../../domain/repositories/status_repository.dart';
import '../datasources/status_datasource.dart';

class StatusRepositoryImpl implements StatusRepository {
  StatusRepositoryImpl(this.source);
  final StatusDataSource source;
  @override
  Future<Paginated<BoardStatus>> fetchStatuses(int boardId, int page) =>
      source.fetchStatuses(boardId, page);
  @override
  Future<BoardStatus> createStatus(int boardId, BoardStatusInput input) =>
      source.createStatus(boardId, input);
  @override
  Future<BoardStatus> updateStatus(
    int boardId,
    int id,
    BoardStatusInput input,
  ) => source.updateStatus(boardId, id, input);
  @override
  Future<void> deleteStatus(int boardId, int id) =>
      source.deleteStatus(boardId, id);
}
