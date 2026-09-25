import '../models/models.dart';
import '../models/pagination.dart';
import '../repositories/comment_repository.dart';

class GetComments {
  const GetComments(this.repository);
  final CommentRepository repository;
  Future<Paginated<Comment>> call(int taskId, int page) =>
      repository.fetchComments(taskId, page);
}
