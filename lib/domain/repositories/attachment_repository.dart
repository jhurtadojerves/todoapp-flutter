import '../models/models.dart';

abstract interface class AttachmentRepository {
  Future<List<TaskAttachment>> getByTask(int taskId);
  Future<TaskAttachment> add(int taskId, TaskAttachmentInput input);
  Future<void> remove(String id);
}
