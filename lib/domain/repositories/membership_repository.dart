import '../../domain/models/models.dart';
import '../../domain/models/pagination.dart';

abstract interface class MembershipRepository {
  Future<Paginated<BoardMembership>> fetchMembers(int boardId, int page);
  Future<BoardMembership> addMember(int boardId, BoardMembershipInput input);
  Future<void> removeMember(int boardId, int id);
}
