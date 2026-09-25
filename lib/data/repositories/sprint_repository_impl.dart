import '../../domain/models/models.dart';
import '../../domain/models/pagination.dart';
import '../../domain/repositories/sprint_repository.dart';
import '../datasources/sprint_datasource.dart';

class SprintRepositoryImpl implements SprintRepository {
  SprintRepositoryImpl(this.source);
  final SprintDataSource source;
  @override
  Future<Paginated<Sprint>> fetchSprints(int boardId, int page) =>
      source.fetchSprints(boardId, page);
  @override
  Future<Sprint> createSprint(int boardId, SprintInput input) =>
      source.createSprint(boardId, input);
  @override
  Future<Sprint> updateSprint(int boardId, int id, SprintInput input) =>
      source.updateSprint(boardId, id, input);
  @override
  Future<void> deleteSprint(int boardId, int id) =>
      source.deleteSprint(boardId, id);
}
