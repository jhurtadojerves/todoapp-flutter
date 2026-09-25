import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:todoapp_flutter/domain/models/models.dart';
import 'package:todoapp_flutter/domain/repositories/board_repository.dart';
import 'package:todoapp_flutter/presentation/providers/dependencies.dart';
import 'package:todoapp_flutter/presentation/viewmodels/form_viewmodels.dart';

class MockBoards extends Mock implements BoardRepository {}

void main() {
  late MockBoards repository;
  late ProviderContainer container;
  setUp(() {
    repository = MockBoards();
    container = ProviderContainer(
      overrides: [boardRepositoryProvider.overrideWithValue(repository)],
    );
  });
  tearDown(() => container.dispose());
  test('nombre vacío impide enviar formulario', () async {
    final sub = container.listen(boardFormProvider(null), (_, _) {});
    addTearDown(sub.close);
    final notifier = container.read(boardFormProvider(null).notifier);
    notifier.update(const BoardInput(name: '   ', description: ''));
    expect(await notifier.submit(), false);
    expect(
      container.read(boardFormProvider(null)).fieldErrors,
      contains('name'),
    );
    verifyZeroInteractions(repository);
  });
  test('envío doble se bloquea y valores se recortan', () async {
    const input = BoardInput(name: 'Board', description: 'Description');
    final pending = Completer<Board>();
    when(() => repository.createBoard(input)).thenAnswer((_) => pending.future);
    final sub = container.listen(boardFormProvider(null), (_, _) {});
    addTearDown(sub.close);
    final notifier = container.read(boardFormProvider(null).notifier);
    notifier.update(
      const BoardInput(name: ' Board ', description: ' Description '),
    );
    final first = notifier.submit();
    expect(container.read(boardFormProvider(null)).isSubmitting, true);
    expect(await notifier.submit(), false);
    pending.complete(
      const Board(
        id: 1,
        name: 'Board',
        description: 'Description',
        userId: 1,
        created: 'now',
        modified: 'now',
      ),
    );
    expect(await first, true);
    verify(() => repository.createBoard(input)).called(1);
    expect(container.read(boardFormProvider(null)).isSubmitting, false);
  });
  test('error de API conserva campos para reintentar', () async {
    const input = BoardInput(name: 'Board', description: 'Description');
    when(() => repository.createBoard(input)).thenThrow(Exception('Offline'));
    final sub = container.listen(boardFormProvider(null), (_, _) {});
    addTearDown(sub.close);
    final notifier = container.read(boardFormProvider(null).notifier);
    notifier.update(input);
    expect(await notifier.submit(), false);
    final state = container.read(boardFormProvider(null));
    expect(state.input, input);
    expect(state.error, contains('Offline'));
    expect(state.isSubmitting, false);
  });
}
