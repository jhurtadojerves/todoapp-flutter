import '../../domain/models/models.dart';
import '../../domain/repositories/attachment_repository.dart';
import '../datasources/attachment_local_datasource.dart';

class AttachmentRepositoryImpl implements AttachmentRepository {
  AttachmentRepositoryImpl(this.source);
  final Future<AttachmentLocalDataSource> source;
  @override
  Future<List<TaskAttachment>> getByTask(int taskId) async =>
      (await source).getByTask(taskId);
  @override
  Future<TaskAttachment> add(int taskId, TaskAttachmentInput input) async =>
      (await source).add(taskId, input);
  @override
  Future<void> remove(String id) async => (await source).remove(id);
}
