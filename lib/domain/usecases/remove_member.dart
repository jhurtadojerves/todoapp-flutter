import '../repositories/membership_repository.dart';

class RemoveMember {
  const RemoveMember(this.repository);
  final MembershipRepository repository;
  Future<void> call(int boardId, int id) =>
      repository.removeMember(boardId, id);
}
