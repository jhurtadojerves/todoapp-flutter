import '../models/models.dart';
import '../repositories/comment_repository.dart';

class UpdateComment {
  const UpdateComment(this.repository);
  final CommentRepository repository;
  Future<Comment> call(int taskId, int id, CommentInput input) =>
      repository.updateComment(taskId, id, input);
}
