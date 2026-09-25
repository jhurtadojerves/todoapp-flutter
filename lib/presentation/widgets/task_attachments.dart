import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../viewmodels/task_attachments_notifier.dart';
import 'common.dart';

class TaskAttachments extends ConsumerWidget {
  const TaskAttachments({super.key, required this.taskId});
  final int taskId;
  @override
  Widget build(BuildContext context, WidgetRef ref) => Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      Text('Adjuntos', style: Theme.of(context).textTheme.titleLarge),
      AsyncContent(
        value: ref.watch(taskAttachmentsProvider(taskId)),
        retry: () => ref.invalidate(taskAttachmentsProvider(taskId)),
        builder: (state) => Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AppButton(
              'Tomar foto',
              busy: state.isCapturing,
              onPressed: state.deletingId != null
                  ? null
                  : () => ref
                        .read(taskAttachmentsProvider(taskId).notifier)
                        .capture(),
            ),
            if (state.captureError != null) Text(state.captureError!),
            if (state.locationWarning != null) Text(state.locationWarning!),
            if (state.deleteError != null) Text(state.deleteError!),
            if (state.isCameraPermissionBlocked ||
                state.locationWarning != null)
              TextButton(
                onPressed: () => ref.read(devicePermissionsProvider).settings(),
                child: const Text('Abrir configuración del sistema'),
              ),
            ...state.items.map(
              (photo) => Card(
                child: Column(
                  children: [
                    Image.file(
                      File(photo.photoUri),
                      height: 180,
                      fit: BoxFit.cover,
                      errorBuilder: (_, error, stack) =>
                          const Text('No se pudo cargar la foto.'),
                    ),
                    Text(photo.createdAt),
                    Text(
                      photo.latitude == null
                          ? 'Sin ubicación'
                          : '${photo.latitude}, ${photo.longitude}',
                    ),
                    TextButton(
                      onPressed: state.isCapturing || state.deletingId != null
                          ? null
                          : () async {
                              if (await confirmDelete(context)) {
                                await ref
                                    .read(
                                      taskAttachmentsProvider(taskId).notifier,
                                    )
                                    .remove(photo.id);
                              }
                            },
                      child: const Text('Eliminar foto'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
