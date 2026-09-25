import '../../domain/models/models.dart';
import '../../domain/models/pagination.dart';
import '../../domain/repositories/comment_repository.dart';
import '../datasources/comment_datasource.dart';

class CommentRepositoryImpl implements CommentRepository {
  CommentRepositoryImpl(this.source);
  final CommentDataSource source;
  @override
  Future<Paginated<Comment>> fetchComments(int taskId, int page) =>
      source.fetchComments(taskId, page);
  @override
  Future<Comment> createComment(int taskId, CommentInput input) =>
      source.createComment(taskId, input);
  @override
  Future<Comment> updateComment(int taskId, int id, CommentInput input) =>
      source.updateComment(taskId, id, input);
  @override
  Future<void> deleteComment(int taskId, int id) =>
      source.deleteComment(taskId, id);
}
