import '../../domain/models/models.dart';
import '../../domain/models/pagination.dart';
import '../../domain/repositories/membership_repository.dart';
import '../datasources/membership_datasource.dart';

class MembershipRepositoryImpl implements MembershipRepository {
  MembershipRepositoryImpl(this.source);
  final MembershipDataSource source;
  @override
  Future<Paginated<BoardMembership>> fetchMembers(int boardId, int page) =>
      source.fetchMembers(boardId, page);
  @override
  Future<BoardMembership> addMember(int boardId, BoardMembershipInput input) =>
      source.addMember(boardId, input);
  @override
  Future<void> removeMember(int boardId, int id) =>
      source.removeMember(boardId, id);
}
