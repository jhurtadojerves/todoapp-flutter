import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import '../../core/device/device_services.dart';
import '../../data/datasources/attachment_local_datasource.dart';
import '../../data/repositories/attachment_repository_impl.dart';
import '../../domain/repositories/attachment_repository.dart';
import '../../domain/usecases/get_task_attachments.dart';
import '../../domain/usecases/add_task_attachment.dart';
import '../../domain/usecases/delete_task_attachment.dart';

final attachmentSourceProvider = FutureProvider(
  (ref) async => AttachmentLocalDataSource(
    Directory(
      '${(await getApplicationDocumentsDirectory()).path}/task-attachments',
    ),
  ),
);
final attachmentRepositoryProvider = Provider<AttachmentRepository>(
  (ref) => AttachmentRepositoryImpl(ref.watch(attachmentSourceProvider.future)),
);
final getTaskAttachmentsProvider = Provider(
  (ref) => GetTaskAttachments(ref.watch(attachmentRepositoryProvider)),
);
final addTaskAttachmentProvider = Provider(
  (ref) => AddTaskAttachment(ref.watch(attachmentRepositoryProvider)),
);
final deleteTaskAttachmentProvider = Provider(
  (ref) => DeleteTaskAttachment(ref.watch(attachmentRepositoryProvider)),
);
final devicePermissionsProvider = Provider<DevicePermissions>(
  (ref) => NativePermissions(),
);
final cameraServiceProvider = Provider<CameraService>((ref) => NativeCamera());
final locationServiceProvider = Provider<LocationService>(
  (ref) => NativeLocation(),
);
