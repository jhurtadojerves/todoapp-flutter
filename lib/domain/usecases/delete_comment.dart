import '../repositories/comment_repository.dart';

class DeleteComment {
  const DeleteComment(this.repository);
  final CommentRepository repository;
  Future<void> call(int taskId, int id) => repository.deleteComment(taskId, id);
}
