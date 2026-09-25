import '../models/models.dart';
import '../models/pagination.dart';
import '../repositories/sprint_repository.dart';

class GetSprints {
  const GetSprints(this.repository);
  final SprintRepository repository;
  Future<Paginated<Sprint>> call(int boardId, int page) =>
      repository.fetchSprints(boardId, page);
}
