import '../models/models.dart';
import '../models/pagination.dart';
import '../repositories/membership_repository.dart';

class GetMembers {
  const GetMembers(this.repository);
  final MembershipRepository repository;
  Future<Paginated<BoardMembership>> call(int boardId, int page) =>
      repository.fetchMembers(boardId, page);
}
