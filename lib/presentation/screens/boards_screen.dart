import '../viewmodels/form_viewmodels.dart';
import '../providers/usecase_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../domain/models/models.dart';
import '../providers/session_provider.dart';
import '../viewmodels/resource_providers.dart';
import '../widgets/common.dart';
import '../widgets/board_sections.dart';

class BoardsScreen extends ConsumerWidget {
  const BoardsScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) => AppScaffold(
    title: 'Mis tableros',
    actions: [
      TextButton(
        onPressed: () => context.push('/board/new'),
        child: const Text('Nuevo'),
      ),
    ],
    child: ListView(
      padding: const EdgeInsets.all(16),
      children: [
        PagedList<Board>(
          value: ref.watch(boardsProvider),
          retry: () => ref.invalidate(boardsProvider),
          more: () => ref.read(boardsProvider.notifier).loadMore(),
          item: (b) => Card(
            child: ListTile(
              title: Text(b.name),
              subtitle: Text(b.description),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => context.push('/board/${b.id}'),
            ),
          ),
        ),
      ],
    ),
  );
}

class BoardFormScreen extends ConsumerStatefulWidget {
  const BoardFormScreen({super.key, this.id});
  final int? id;
  @override
  ConsumerState<BoardFormScreen> createState() => _BoardFormScreenState();
}

class _BoardFormScreenState extends ConsumerState<BoardFormScreen> {
  final form = GlobalKey<FormState>();
  final name = TextEditingController(), description = TextEditingController();
  bool initialized = false;
  bool get busy => ref.watch(boardFormProvider(widget.id)).isSubmitting;
  String? get error => ref.watch(boardFormProvider(widget.id)).error;
  @override
  void dispose() {
    name.dispose();
    description.dispose();
    super.dispose();
  }

  Future<void> submit() async {
    if (!form.currentState!.validate()) return;
    final notifier = ref.read(boardFormProvider(widget.id).notifier);
    notifier.update(BoardInput(name: name.text, description: description.text));
    final saved = await notifier.submit();
    if (saved && mounted) {
      context.go(widget.id == null ? '/boards' : '/board/${widget.id}');
    }
  }

  Widget fields() => Form(
    key: form,
    child: ListView(
      padding: const EdgeInsets.all(20),
      children: [
        AppInput(label: 'Nombre', controller: name, validator: requiredText),
        AppInput(label: 'Descripción', controller: description, lines: 3),
        if (error != null) Text(error!),
        AppButton(
          widget.id == null ? 'Crear tablero' : 'Guardar cambios',
          busy: busy,
          onPressed: submit,
        ),
      ],
    ),
  );
  @override
  Widget build(BuildContext context) => AppScaffold(
    title: widget.id == null ? 'Nuevo tablero' : 'Editar tablero',
    fallback: widget.id == null ? '/boards' : '/board/${widget.id}',
    child: widget.id == null
        ? fields()
        : AsyncContent(
            value: ref.watch(boardDetailProvider(widget.id!)),
            retry: () => ref.invalidate(boardDetailProvider(widget.id!)),
            builder: (board) {
              if (board.userId != ref.watch(userIdProvider)) {
                return const Center(
                  child: Text('No tienes permiso para editar este tablero.'),
                );
              }
              if (!initialized) {
                name.text = board.name;
                description.text = board.description;
                initialized = true;
              }
              return fields();
            },
          ),
  );
}

class BoardDetailScreen extends ConsumerStatefulWidget {
  const BoardDetailScreen({super.key, required this.id});
  final int id;
  @override
  ConsumerState<BoardDetailScreen> createState() => _BoardDetailScreenState();
}

class _BoardDetailScreenState extends ConsumerState<BoardDetailScreen> {
  bool deleting = false;
  Future<void> remove() async {
    if (!await confirmDelete(context) || !mounted) return;
    setState(() => deleting = true);
    try {
      await ref.read(deleteBoardProvider)(widget.id);
      ref.invalidate(boardsProvider);
      ref.invalidate(boardDetailProvider(widget.id));
      if (mounted) context.go('/boards');
    } catch (e) {
      if (mounted) showError(context, e);
    } finally {
      if (mounted) setState(() => deleting = false);
    }
  }

  @override
  Widget build(BuildContext context) => AppScaffold(
    title: 'Detalle de tablero',
    fallback: '/boards',
    child: AsyncContent(
      value: ref.watch(boardDetailProvider(widget.id)),
      retry: () => ref.invalidate(boardDetailProvider(widget.id)),
      builder: (board) => ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Text(board.name, style: Theme.of(context).textTheme.headlineSmall),
          Text(board.description),
          AppButton(
            'Ver tareas',
            onPressed: () => context.push('/board/${board.id}/tasks'),
          ),
          if (board.userId == ref.watch(userIdProvider)) ...[
            AppButton(
              'Editar tablero',
              onPressed: () => context.push('/board/${board.id}/edit'),
            ),
            AppButton('Eliminar tablero', busy: deleting, onPressed: remove),
          ],
          BoardSections(board: board),
        ],
      ),
    ),
  );
}
