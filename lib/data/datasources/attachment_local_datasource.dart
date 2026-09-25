import 'dart:convert';
import 'dart:io';
import 'dart:math';
import '../../domain/models/models.dart';

class AttachmentLocalDataSource {
  AttachmentLocalDataSource(this.directory);
  final Directory directory;
  Future<void> _tail = Future.value();
  Future<T> _serialized<T>(Future<T> Function() action) {
    final result = _tail.then((_) => action());
    _tail = result.then<void>((_) {}, onError: (Object _, StackTrace _) {});
    return result;
  }

  Future<List<TaskAttachment>> _read() async {
    await directory.create(recursive: true);
    final file = File('${directory.path}/index.json');
    if (!await file.exists()) return [];
    try {
      return (jsonDecode(await file.readAsString()) as List)
          .map((e) => TaskAttachment.fromJson(e as Map<String, dynamic>))
          .toList();
    } on FormatException {
      return [];
    } on TypeError {
      return [];
    } on Exception {
      return [];
    }
  }

  Future<void> _write(List<TaskAttachment> items) async {
    final temporary = File('${directory.path}/index.tmp');
    await temporary.writeAsString(
      jsonEncode(items.map((e) => e.toJson()).toList()),
      flush: true,
    );
    await temporary.rename('${directory.path}/index.json');
  }

  Future<List<TaskAttachment>> getByTask(int taskId) => _serialized(() async {
    final items = (await _read()).where((e) => e.taskId == taskId).toList();
    items.sort((a, b) => b.createdAt.compareTo(a.createdAt));
    return items;
  });
  Future<TaskAttachment> add(
    int taskId,
    TaskAttachmentInput input,
  ) => _serialized(() async {
    await directory.create(recursive: true);
    final id =
        '${DateTime.now().microsecondsSinceEpoch}-${Random.secure().nextInt(1 << 30)}';
    final extension =
        RegExp(r'\.([a-zA-Z0-9]+)$').firstMatch(input.photoUri)?.group(1) ??
        'jpg';
    final destination = File('${directory.path}/$id.$extension');
    await File(input.photoUri).copy(destination.path);
    final record = TaskAttachment(
      id: id,
      taskId: taskId,
      photoUri: destination.path,
      latitude: input.latitude,
      longitude: input.longitude,
      createdAt: DateTime.now().toUtc().toIso8601String(),
    );
    try {
      await _write([...await _read(), record]);
    } catch (_) {
      await destination.delete();
      rethrow;
    }
    return record;
  });
  Future<void> remove(String id) => _serialized(() async {
    final items = await _read();
    final matches = items.where((e) => e.id == id);
    if (matches.isEmpty) return;
    final record = matches.first;
    await _write(items.where((e) => e.id != id).toList());
    final photo = File(record.photoUri);
    // Never delete a path outside the private attachment directory.
    final expected = directory.absolute.path.replaceAll('\\', '/');
    if (photo.absolute.path.replaceAll('\\', '/').startsWith('$expected/') &&
        await photo.exists()) {
      await photo.delete();
    }
  });
}
