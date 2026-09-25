import '../../domain/models/models.dart';
import '../../domain/models/pagination.dart';

abstract interface class SprintRepository {
  Future<Paginated<Sprint>> fetchSprints(int boardId, int page);
  Future<Sprint> createSprint(int boardId, SprintInput input);
  Future<Sprint> updateSprint(int boardId, int id, SprintInput input);
  Future<void> deleteSprint(int boardId, int id);
}
