import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:todoapp_flutter/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  testWidgets('Arranque nativo y acceso a registro sin sesión', (tester) async {
    app.main();
    await tester.pumpAndSettle();
    expect(find.text('Bienvenido a TodoApp'), findsOneWidget);
    await tester.tap(find.text('Boards'));
    await tester.pumpAndSettle();
    expect(find.widgetWithText(FilledButton, 'Acceder'), findsOneWidget);
    await tester.tap(find.text('Crear cuenta'));
    await tester.pumpAndSettle();
    expect(
      find.widgetWithText(TextFormField, 'Nombre de usuario'),
      findsOneWidget,
    );
    await tester.tap(find.byTooltip('Atrás'));
    await tester.pumpAndSettle();
    expect(find.widgetWithText(FilledButton, 'Acceder'), findsOneWidget);
  });
}
