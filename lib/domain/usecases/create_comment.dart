import '../models/models.dart';
import '../repositories/comment_repository.dart';

class CreateComment {
  const CreateComment(this.repository);
  final CommentRepository repository;
  Future<Comment> call(int taskId, CommentInput input) =>
      repository.createComment(taskId, input);
}
