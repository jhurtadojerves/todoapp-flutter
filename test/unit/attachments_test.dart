import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:todoapp_flutter/core/device/device_services.dart';
import 'package:todoapp_flutter/data/datasources/attachment_local_datasource.dart';
import 'package:todoapp_flutter/domain/models/models.dart';
import 'package:todoapp_flutter/presentation/viewmodels/task_attachments_notifier.dart';

class FakePermissions implements DevicePermissions {
  FakePermissions(this.cameraPermission, this.locationPermission);
  final DevicePermission cameraPermission, locationPermission;
  @override
  Future<DevicePermission> camera() async => cameraPermission;
  @override
  Future<DevicePermission> location() async => locationPermission;
  @override
  Future<void> settings() async {}
}

class FakeCamera implements CameraService {
  FakeCamera(this.path);
  final String? path;
  int calls = 0;
  @override
  Future<String?> capture() async {
    calls++;
    return path;
  }
}

class FakeLocation implements LocationService {
  @override
  Future<({double latitude, double longitude})> locate() async =>
      (latitude: 1.0, longitude: 2.0);
}

void main() {
  late Directory temp;
  late File photo;
  late AttachmentLocalDataSource source;
  setUp(() async {
    temp = await Directory.systemTemp.createTemp('todoapp_test_');
    photo = await File('${temp.path}/source.jpg').writeAsBytes([1, 2, 3]);
    source = AttachmentLocalDataSource(
      Directory('${temp.path}/task-attachments'),
    );
  });
  tearDown(() async {
    await temp.delete(recursive: true);
  });
  test('copia y filtra por tarea; borrar no toca original', () async {
    final record = await source.add(
      1,
      TaskAttachmentInput(photoUri: photo.path, latitude: 1, longitude: 2),
    );
    expect(await File(record.photoUri).readAsBytes(), [1, 2, 3]);
    expect(await source.getByTask(2), isEmpty);
    expect((await source.getByTask(1)).single.latitude, 1);
    await source.remove(record.id);
    expect(await File(record.photoUri).exists(), false);
    expect(await photo.exists(), true);
  });
  test('índice corrupto equivale a vacío', () async {
    await source.directory.create();
    await File('${source.directory.path}/index.json').writeAsString('{bad');
    expect(await source.getByTask(1), isEmpty);
  });
  test('escrituras concurrentes no pierden fotos', () async {
    await Future.wait(
      List.generate(
        5,
        (_) => source.add(
          1,
          TaskAttachmentInput(
            photoUri: photo.path,
            latitude: null,
            longitude: null,
          ),
        ),
      ),
    );
    final records = await source.getByTask(1);
    expect(records.length, 5);
    expect(
      records.first.createdAt.compareTo(records.last.createdAt),
      greaterThanOrEqualTo(0),
    );
  });
  for (final permission in [
    DevicePermission.denied,
    DevicePermission.blocked,
  ]) {
    test('cámara $permission no guarda adjunto', () async {
      final camera = FakeCamera(photo.path);
      final container = ProviderContainer(
        overrides: [
          attachmentSourceProvider.overrideWith((ref) async => source),
          devicePermissionsProvider.overrideWithValue(
            FakePermissions(permission, DevicePermission.granted),
          ),
          cameraServiceProvider.overrideWithValue(camera),
          locationServiceProvider.overrideWithValue(FakeLocation()),
        ],
      );
      addTearDown(container.dispose);
      final subscription = container.listen(
        taskAttachmentsProvider(1),
        (_, _) {},
      );
      addTearDown(subscription.close);
      await container.read(taskAttachmentsProvider(1).future);
      await container.read(taskAttachmentsProvider(1).notifier).capture();
      final state = container.read(taskAttachmentsProvider(1)).requireValue;
      expect(state.captureError, isNotNull);
      expect(
        state.isCameraPermissionBlocked,
        permission == DevicePermission.blocked,
      );
      expect(camera.calls, 0);
      expect(state.items, isEmpty);
    });
    test('GPS $permission guarda sin coordenadas', () async {
      final container = ProviderContainer(
        overrides: [
          attachmentSourceProvider.overrideWith((ref) async => source),
          devicePermissionsProvider.overrideWithValue(
            FakePermissions(DevicePermission.granted, permission),
          ),
          cameraServiceProvider.overrideWithValue(FakeCamera(photo.path)),
          locationServiceProvider.overrideWithValue(FakeLocation()),
        ],
      );
      addTearDown(container.dispose);
      final subscription = container.listen(
        taskAttachmentsProvider(1),
        (_, _) {},
      );
      addTearDown(subscription.close);
      await container.read(taskAttachmentsProvider(1).future);
      await container.read(taskAttachmentsProvider(1).notifier).capture();
      final state = container.read(taskAttachmentsProvider(1)).requireValue;
      expect(state.items.single.latitude, null);
      expect(state.locationWarning, isNotNull);
      expect(
        state.isLocationPermissionBlocked,
        permission == DevicePermission.blocked,
      );
    });
  }
  test('cámara cancelada no guarda foto', () async {
    final container = ProviderContainer(
      overrides: [
        attachmentSourceProvider.overrideWith((ref) async => source),
        devicePermissionsProvider.overrideWithValue(
          FakePermissions(DevicePermission.granted, DevicePermission.granted),
        ),
        cameraServiceProvider.overrideWithValue(FakeCamera(null)),
      ],
    );
    addTearDown(container.dispose);
    final subscription = container.listen(
      taskAttachmentsProvider(1),
      (_, _) {},
    );
    addTearDown(subscription.close);
    await container.read(taskAttachmentsProvider(1).future);
    await container.read(taskAttachmentsProvider(1).notifier).capture();
    expect(
      container.read(taskAttachmentsProvider(1)).requireValue.items,
      isEmpty,
    );
  });
}
