import '../models/models.dart';
import '../repositories/attachment_repository.dart';

class AddTaskAttachment {
  const AddTaskAttachment(this.repository);
  final AttachmentRepository repository;
  Future<TaskAttachment> call(int taskId, TaskAttachmentInput input) =>
      repository.add(taskId, input);
}
