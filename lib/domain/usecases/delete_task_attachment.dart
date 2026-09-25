import '../repositories/attachment_repository.dart';

class DeleteTaskAttachment {
  const DeleteTaskAttachment(this.repository);
  final AttachmentRepository repository;
  Future<void> call(String id) => repository.remove(id);
}
