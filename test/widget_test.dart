import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todoapp_flutter/main.dart';
import 'package:todoapp_flutter/core/storage/secure_storage.dart';
import 'package:todoapp_flutter/presentation/providers/session_provider.dart';

class MemoryTokens implements TokenStorage {
  ({String access, String refresh})? pair;
  @override
  Future<({String access, String refresh})?> read() async => pair;
  @override
  Future<void> write(String access, String refresh) async {
    pair = (access: access, refresh: refresh);
  }

  @override
  Future<void> clear() async {
    pair = null;
  }
}

void main() {
  testWidgets('Home y pestaña protegida sin sesión', (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [tokenStorageProvider.overrideWithValue(MemoryTokens())],
        child: const TodoApp(),
      ),
    );
    await tester.pumpAndSettle();
    expect(find.text('Bienvenido a TodoApp'), findsOneWidget);
    await tester.tap(find.text('Boards'));
    await tester.pumpAndSettle();
    expect(find.widgetWithText(FilledButton, 'Acceder'), findsOneWidget);
    expect(find.text('Mis tableros'), findsNothing);
  });
}
