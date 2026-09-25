import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../providers/session_provider.dart';
import '../viewmodels/paginated_notifier.dart';

class AppScaffold extends ConsumerWidget {
  const AppScaffold({
    super.key,
    required this.title,
    required this.child,
    this.fallback,
    this.actions = const [],
  });
  final String title;
  final Widget child;
  final String? fallback;
  final List<Widget> actions;
  @override
  Widget build(BuildContext context, WidgetRef ref) => Scaffold(
    appBar: AppBar(
      title: Text(title),
      leading: fallback == null
          ? null
          : IconButton(
              tooltip: 'Atrás',
              icon: const Icon(Icons.arrow_back),
              onPressed: () => goBackOr(context, fallback!),
            ),
      actions: [
        ...actions,
        PopupMenuButton<String>(
          tooltip: '≡',
          onSelected: (value) async {
            if (value == 'logout') {
              await ref.read(sessionProvider.notifier).logout();
              if (context.mounted) context.go('/home');
            } else {
              context.go('/boards');
            }
          },
          itemBuilder: (_) => [
            PopupMenuItem(
              value: ref.watch(sessionProvider).value == null
                  ? 'login'
                  : 'logout',
              child: Text(
                ref.watch(sessionProvider).value == null
                    ? 'Iniciar sesión'
                    : 'Cerrar sesión',
              ),
            ),
          ],
        ),
      ],
    ),
    body: SafeArea(child: child),
  );
}

void goBackOr(BuildContext context, String fallback) =>
    context.canPop() ? context.pop() : context.go(fallback);

class AppInput extends StatelessWidget {
  const AppInput({
    super.key,
    required this.label,
    required this.controller,
    this.obscure = false,
    this.validator,
    this.onChanged,
    this.lines = 1,
    this.keyboardType,
  });
  final String label;
  final TextEditingController controller;
  final bool obscure;
  final String? Function(String?)? validator;
  final ValueChanged<String>? onChanged;
  final int lines;
  final TextInputType? keyboardType;
  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 8),
    child: TextFormField(
      controller: controller,
      decoration: InputDecoration(labelText: label),
      obscureText: obscure,
      validator: validator,
      onChanged: onChanged,
      maxLines: lines,
      keyboardType: keyboardType,
      autovalidateMode: AutovalidateMode.onUserInteraction,
    ),
  );
}

class AppButton extends StatelessWidget {
  const AppButton(this.label, {super.key, this.onPressed, this.busy = false});
  final String label;
  final VoidCallback? onPressed;
  final bool busy;
  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 8),
    child: FilledButton(
      onPressed: busy ? null : onPressed,
      child: busy
          ? const SizedBox(
              width: 24,
              height: 24,
              child: CircularProgressIndicator(strokeWidth: 2),
            )
          : Text(label),
    ),
  );
}

String? requiredText(String? value) =>
    value == null || value.trim().isEmpty ? 'Este campo es obligatorio.' : null;
String? emailValidator(String? value) =>
    value != null &&
        RegExp(r'^[^\s@]+@[^\s@]+\.[^\s@]+$').hasMatch(value.trim())
    ? null
    : 'Introduce un correo electrónico válido.';
String? dateValidator(String? value) {
  if (value == null || value.trim().isEmpty) return null;
  final date = DateTime.tryParse(value);
  return RegExp(r'^\d{4}-\d{2}-\d{2}$').hasMatch(value) &&
          date != null &&
          date.toIso8601String().startsWith(value)
      ? null
      : 'Usa una fecha válida YYYY-MM-DD.';
}

Future<bool> confirmDelete(BuildContext context) async =>
    await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Confirmar eliminación'),
        content: const Text('¿Quieres eliminar este elemento?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancelar'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Eliminar'),
          ),
        ],
      ),
    ) ??
    false;
void showError(BuildContext context, Object error) => ScaffoldMessenger.of(
  context,
).showSnackBar(SnackBar(content: Text(error.toString())));

class AsyncContent<T> extends StatelessWidget {
  const AsyncContent({
    super.key,
    required this.value,
    required this.builder,
    required this.retry,
  });
  final AsyncValue<T> value;
  final Widget Function(T) builder;
  final VoidCallback retry;
  @override
  Widget build(BuildContext context) => value.when(
    data: builder,
    error: (e, _) => Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(e.toString()),
        AppButton('Reintentar', onPressed: retry),
      ],
    ),
    loading: () => const Center(child: CircularProgressIndicator()),
  );
}

class PagedList<T> extends StatelessWidget {
  const PagedList({
    super.key,
    required this.value,
    required this.item,
    required this.retry,
    required this.more,
  });
  final AsyncValue<PageState<T>> value;
  final Widget Function(T) item;
  final VoidCallback retry;
  final VoidCallback more;
  @override
  Widget build(BuildContext context) => AsyncContent(
    value: value,
    retry: retry,
    builder: (page) => Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (page.items.isEmpty)
          const Padding(
            padding: EdgeInsets.all(16),
            child: Text('No hay elementos.'),
          ),
        ...page.items.map(item),
        if (page.moreError != null) Text(page.moreError.toString()),
        if (page.hasMore)
          AppButton('Cargar más', busy: page.isLoadingMore, onPressed: more),
      ],
    ),
  );
}

class ChipPicker extends StatelessWidget {
  const ChipPicker({
    super.key,
    required this.label,
    required this.options,
    required this.value,
    required this.onChanged,
  });
  final String label;
  final Map<int, String> options;
  final int? value;
  final ValueChanged<int?> onChanged;
  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 8),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        Wrap(
          spacing: 8,
          children: [
            ChoiceChip(
              label: const Text('Sin asignar'),
              selected: value == null,
              onSelected: (_) => onChanged(null),
            ),
            ...options.entries.map(
              (e) => ChoiceChip(
                label: Text(e.value),
                selected: value == e.key,
                onSelected: (_) => onChanged(e.key),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
