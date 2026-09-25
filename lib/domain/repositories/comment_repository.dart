import '../../domain/models/models.dart';
import '../../domain/models/pagination.dart';

abstract interface class CommentRepository {
  Future<Paginated<Comment>> fetchComments(int taskId, int page);
  Future<Comment> createComment(int taskId, CommentInput input);
  Future<Comment> updateComment(int taskId, int id, CommentInput input);
  Future<void> deleteComment(int taskId, int id);
}
