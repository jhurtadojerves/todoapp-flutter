import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'app/router.dart';
import 'app/theme.dart';
import 'core/config/api_config.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  ApiConfig.validate();
  runApp(const ProviderScope(child: TodoApp()));
}

class TodoApp extends ConsumerWidget {
  const TodoApp({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) => MaterialApp.router(
    title: 'TodoApp',
    debugShowCheckedModeBanner: false,
    theme: appTheme,
    routerConfig: ref.watch(routerProvider),
  );
}
