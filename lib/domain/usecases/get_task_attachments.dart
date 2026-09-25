import '../models/models.dart';
import '../repositories/attachment_repository.dart';

class GetTaskAttachments {
  const GetTaskAttachments(this.repository);
  final AttachmentRepository repository;
  Future<List<TaskAttachment>> call(int taskId) => repository.getByTask(taskId);
}
