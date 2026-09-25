import '../models/models.dart';
import '../repositories/membership_repository.dart';

class AddMember {
  const AddMember(this.repository);
  final MembershipRepository repository;
  Future<BoardMembership> call(int boardId, BoardMembershipInput input) =>
      repository.addMember(boardId, input);
}
