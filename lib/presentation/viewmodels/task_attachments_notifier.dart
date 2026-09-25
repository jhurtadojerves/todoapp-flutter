import '../providers/attachment_dependencies.dart';
export '../providers/attachment_dependencies.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/device/device_services.dart';

import '../../domain/models/models.dart';

class AttachmentState {
  const AttachmentState({
    this.items = const [],
    this.isCapturing = false,
    this.captureError,
    this.isCameraPermissionBlocked = false,
    this.locationWarning,
    this.isLocationPermissionBlocked = false,
    this.deletingId,
    this.deleteError,
  });
  final List<TaskAttachment> items;
  final bool isCapturing,
      isCameraPermissionBlocked,
      isLocationPermissionBlocked;
  final String? captureError, locationWarning, deletingId, deleteError;
}

final taskAttachmentsProvider = AsyncNotifierProvider.autoDispose
    .family<TaskAttachmentsNotifier, AttachmentState, int>(
      TaskAttachmentsNotifier.new,
    );

class TaskAttachmentsNotifier extends AsyncNotifier<AttachmentState> {
  TaskAttachmentsNotifier(this.taskId);
  final int taskId;
  @override
  Future<AttachmentState> build() async => AttachmentState(
    items: await ref.watch(getTaskAttachmentsProvider)(taskId),
  );
  Future<void> capture() async {
    final previous = state.value;
    if (previous == null ||
        previous.isCapturing ||
        previous.deletingId != null) {
      return;
    }
    state = AsyncData(
      AttachmentState(items: previous.items, isCapturing: true),
    );
    var cameraBlocked = false, locationBlocked = false;
    String? warning;
    try {
      final permissions = ref.read(devicePermissionsProvider);
      final camera = ref.read(cameraServiceProvider);
      final location = ref.read(locationServiceProvider);
      final getAttachments = ref.read(getTaskAttachmentsProvider);
      final addAttachment = ref.read(addTaskAttachmentProvider);

      final permission = await permissions.camera();
      cameraBlocked = permission == DevicePermission.blocked;
      if (permission != DevicePermission.granted) {
        throw StateError(
          cameraBlocked
              ? 'El permiso de cámara está bloqueado. Habilítalo en la configuración del sistema.'
              : 'Se necesita permiso de cámara para tomar la foto.',
        );
      }
      final photo = await camera.capture();
      if (photo == null) {
        if (ref.mounted) {
          state = AsyncData(AttachmentState(items: previous.items));
        }
        return;
      }
      double? latitude, longitude;
      try {
        final gps = await permissions.location();
        locationBlocked = gps == DevicePermission.blocked;
        if (gps == DevicePermission.granted) {
          final coordinates = await location.locate();
          latitude = coordinates.latitude;
          longitude = coordinates.longitude;
        } else {
          warning =
              'La foto se guardó sin ubicación porque el permiso de GPS está desactivado. Es opcional.';
        }
      } catch (_) {
        warning =
            'La foto se guardó sin ubicación porque no se pudo obtener el GPS.';
      }
      await addAttachment(
        taskId,
        TaskAttachmentInput(
          photoUri: photo,
          latitude: latitude,
          longitude: longitude,
        ),
      );
      final items = await getAttachments(taskId);
      if (ref.mounted) {
        state = AsyncData(
          AttachmentState(
            items: items,
            locationWarning: warning,
            isLocationPermissionBlocked: locationBlocked,
          ),
        );
      }
    } catch (e) {
      if (ref.mounted) {
        state = AsyncData(
          AttachmentState(
            items: previous.items,
            captureError: e.toString(),
            isCameraPermissionBlocked: cameraBlocked,
          ),
        );
      }
    }
  }

  Future<void> remove(String id) async {
    final previous = state.value;
    if (previous == null ||
        previous.isCapturing ||
        previous.deletingId != null) {
      return;
    }
    state = AsyncData(AttachmentState(items: previous.items, deletingId: id));
    try {
      final getAttachments = ref.read(getTaskAttachmentsProvider);

      final deleteAttachment = ref.read(deleteTaskAttachmentProvider);
      await deleteAttachment(id);
      final items = await getAttachments(taskId);
      if (ref.mounted) state = AsyncData(AttachmentState(items: items));
    } catch (e) {
      if (ref.mounted) {
        state = AsyncData(
          AttachmentState(items: previous.items, deleteError: e.toString()),
        );
      }
    }
  }
}
