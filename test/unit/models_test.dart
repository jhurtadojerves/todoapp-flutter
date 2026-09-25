import 'package:flutter_test/flutter_test.dart';
import 'package:todoapp_flutter/domain/models/models.dart';

void main() {
  test('Board parsea contrato snake_case y serializa', () {
    final json = {
      'id': 1,
      'name': 'Board',
      'description': 'Description',
      'user_id': 7,
      'created': '2026-01-01',
      'modified': '2026-01-01',
    };
    final result = Board.fromJson(Map<String, dynamic>.from(json));
    for (final key in json.keys) {
      expect(result.toJson()[key], json[key], reason: key);
    }
  });
  test('Task parsea contrato snake_case y serializa', () {
    final json = {
      'id': 1,
      'board_id': 2,
      'sprint': null,
      'status': null,
      'user_id': 7,
      'assigned_to_id': null,
      'title': 'Task',
      'description': '',
      'created': '2026-01-01',
      'modified': '2026-01-01',
    };
    final result = Task.fromJson(Map<String, dynamic>.from(json));
    for (final key in json.keys) {
      expect(result.toJson()[key], json[key], reason: key);
    }
  });
  test('User parsea contrato snake_case y serializa', () {
    final json = {
      'id': 1,
      'username': 'user',
      'email': 'user@example.com',
      'profile': null,
    };
    final result = User.fromJson(Map<String, dynamic>.from(json));
    for (final key in json.keys) {
      expect(result.toJson()[key], json[key], reason: key);
    }
  });
  test('BoardMembership parsea contrato snake_case y serializa', () {
    final json = {
      'id': 1,
      'board_id': 2,
      'user': {'id': 7, 'username': 'user', 'email': 'user@example.com'},
      'role': 'member',
      'created': '2026-01-01',
    };
    final result = BoardMembership.fromJson(Map<String, dynamic>.from(json));
    for (final key in json.keys) {
      expect(result.toJson()[key], json[key], reason: key);
    }
  });
  test('BoardStatus parsea contrato snake_case y serializa', () {
    final json = {'id': 1, 'name': 'Todo', 'order': 0, 'color': '#0a7ea4'};
    final result = BoardStatus.fromJson(Map<String, dynamic>.from(json));
    for (final key in json.keys) {
      expect(result.toJson()[key], json[key], reason: key);
    }
  });
  test('Sprint parsea contrato snake_case y serializa', () {
    final json = {
      'id': 1,
      'name': 'Sprint',
      'start_date': null,
      'end_date': null,
      'created': '2026-01-01',
      'modified': '2026-01-01',
    };
    final result = Sprint.fromJson(Map<String, dynamic>.from(json));
    for (final key in json.keys) {
      expect(result.toJson()[key], json[key], reason: key);
    }
  });
  test('Comment parsea contrato snake_case y serializa', () {
    final json = {
      'id': 1,
      'task_id': 2,
      'user_id': 7,
      'content': 'Comment',
      'created': '2026-01-01',
      'modified': '2026-01-01',
    };
    final result = Comment.fromJson(Map<String, dynamic>.from(json));
    for (final key in json.keys) {
      expect(result.toJson()[key], json[key], reason: key);
    }
  });
  test('User profile nullable es obligatorio en JSON', () {
    expect(
      () => User.fromJson({'id': 1, 'username': 'u', 'email': 'u@e.com'}),
      throwsA(isA<Exception>()),
    );
  });
  test('Membership rechaza rol desconocido', () {
    expect(
      () => BoardMembership.fromJson({
        'id': 1,
        'board_id': 2,
        'user': {'id': 7, 'username': 'u', 'email': 'u@e.com'},
        'role': 'admin',
        'created': 'now',
      }),
      throwsA(isA<Exception>()),
    );
  });
  test('Task rechaza status anidado mal formado', () {
    expect(
      () => Task.fromJson({
        'id': 1,
        'board_id': 2,
        'sprint': null,
        'status': {'id': 2},
        'user_id': 7,
        'assigned_to_id': null,
        'title': 'x',
        'description': '',
        'created': 'now',
        'modified': 'now',
      }),
      throwsA(isA<Exception>()),
    );
  });
  test('Adjunto conserva nombres camelCase locales', () {
    final json = const TaskAttachment(
      id: '1',
      taskId: 1,
      photoUri: 'image.jpg',
      latitude: null,
      longitude: null,
      createdAt: 'now',
    ).toJson();
    expect(json.containsKey('taskId'), true);
    expect(json.containsKey('task_id'), false);
    expect(TaskAttachment.fromJson(json).taskId, 1);
  });
}
