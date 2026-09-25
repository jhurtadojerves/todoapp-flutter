import '../viewmodels/task_options_provider.dart';
import '../providers/usecase_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/models/models.dart';
import '../providers/session_provider.dart';
import '../viewmodels/resource_providers.dart';
import 'common.dart';

class BoardSections extends ConsumerWidget {
  const BoardSections({super.key, required this.board});
  final Board board;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final owner = board.userId == ref.watch(userIdProvider);
    final id = board.id;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text('Miembros', style: Theme.of(context).textTheme.titleLarge),
        PagedList<BoardMembership>(
          value: ref.watch(membersProvider(id)),
          retry: () => ref.invalidate(membersProvider(id)),
          more: () => ref.read(membersProvider(id).notifier).loadMore(),
          item: (m) => ListTile(
            title: Text(m.user.email),
            subtitle: Text(m.role.name),
            trailing: owner && m.role != BoardRole.owner
                ? IconButton(
                    tooltip: 'Quitar miembro',
                    icon: const Icon(Icons.person_remove),
                    onPressed: () async {
                      if (!await confirmDelete(context)) return;
                      try {
                        await ref.read(removeMemberProvider)(id, m.id);
                        ref.invalidate(membersProvider(id));
                        ref.invalidate(taskOptionsProvider(id));
                      } catch (e) {
                        if (context.mounted) showError(context, e);
                      }
                    },
                  )
                : null,
          ),
        ),
        if (owner)
          InlineEditor(
            label: 'Invitar miembro',
            labels: const ['Correo electrónico'],
            validators: [emailValidator],
            save: (values) async {
              await ref.read(addMemberProvider)(
                id,
                BoardMembershipInput(email: values[0], role: BoardRole.member),
              );
              ref.invalidate(membersProvider(id));
              ref.invalidate(taskOptionsProvider(id));
            },
          ),
        Text('Estados', style: Theme.of(context).textTheme.titleLarge),
        PagedList<BoardStatus>(
          value: ref.watch(statusesProvider(id)),
          retry: () => ref.invalidate(statusesProvider(id)),
          more: () => ref.read(statusesProvider(id).notifier).loadMore(),
          item: (s) => ResourceRow(
            key: ValueKey(s.id),
            title: s.name,
            editor: InlineEditor(
              label: 'Editar estado',
              labels: const ['Nombre', 'Color'],
              initial: [s.name, s.color],
              validators: [requiredText, requiredText],
              save: (v) async {
                await ref.read(updateStatusProvider)(
                  id,
                  s.id,
                  BoardStatusInput(name: v[0], color: v[1], order: s.order),
                );
                ref.invalidate(statusesProvider(id));
                ref.invalidate(taskOptionsProvider(id));
                ref.invalidate(tasksProvider);
                ref.invalidate(taskDetailProvider);
              },
            ),
            remove: () async {
              await ref.read(deleteStatusProvider)(id, s.id);
              ref.invalidate(statusesProvider(id));
              ref.invalidate(taskOptionsProvider(id));
              ref.invalidate(tasksProvider);
              ref.invalidate(taskDetailProvider);
              ref.invalidate(tasksProvider);
            },
          ),
        ),
        InlineEditor(
          label: 'Crear estado',
          labels: const ['Nombre'],
          validators: [requiredText],
          save: (v) async {
            // Count the complete collection, not just the currently loaded first page.
            final count = (await ref.read(getStatusesProvider)(id, 1)).count;
            await ref.read(createStatusProvider)(
              id,
              BoardStatusInput(name: v[0], color: '#0a7ea4', order: count),
            );
            ref.invalidate(statusesProvider(id));
            ref.invalidate(taskOptionsProvider(id));
            ref.invalidate(tasksProvider);
            ref.invalidate(taskDetailProvider);
          },
        ),
        Text('Sprints', style: Theme.of(context).textTheme.titleLarge),
        PagedList<Sprint>(
          value: ref.watch(sprintsProvider(id)),
          retry: () => ref.invalidate(sprintsProvider(id)),
          more: () => ref.read(sprintsProvider(id).notifier).loadMore(),
          item: (s) => ResourceRow(
            key: ValueKey(s.id),
            title: s.name,
            editor: InlineEditor(
              label: 'Editar sprint',
              labels: const ['Nombre', 'Fecha de inicio', 'Fecha de fin'],
              initial: [s.name, s.startDate ?? '', s.endDate ?? ''],
              validators: [requiredText, dateValidator, dateValidator],
              save: (v) async {
                await ref.read(updateSprintProvider)(
                  id,
                  s.id,
                  SprintInput(
                    name: v[0],
                    startDate: v[1].isEmpty ? null : v[1],
                    endDate: v[2].isEmpty ? null : v[2],
                  ),
                );
                ref.invalidate(sprintsProvider(id));
                ref.invalidate(taskOptionsProvider(id));
                ref.invalidate(tasksProvider);
                ref.invalidate(taskDetailProvider);
              },
            ),
            remove: () async {
              await ref.read(deleteSprintProvider)(id, s.id);
              ref.invalidate(sprintsProvider(id));
              ref.invalidate(taskOptionsProvider(id));
              ref.invalidate(tasksProvider);
              ref.invalidate(taskDetailProvider);
              ref.invalidate(tasksProvider);
            },
          ),
        ),
        InlineEditor(
          label: 'Crear sprint',
          labels: const ['Nombre', 'Fecha de inicio', 'Fecha de fin'],
          validators: [requiredText, dateValidator, dateValidator],
          save: (v) async {
            await ref.read(createSprintProvider)(
              id,
              SprintInput(
                name: v[0],
                startDate: v[1].isEmpty ? null : v[1],
                endDate: v[2].isEmpty ? null : v[2],
              ),
            );
            ref.invalidate(sprintsProvider(id));
            ref.invalidate(taskOptionsProvider(id));
            ref.invalidate(tasksProvider);
            ref.invalidate(taskDetailProvider);
          },
        ),
      ],
    );
  }
}

class InlineEditor extends StatefulWidget {
  const InlineEditor({
    super.key,
    required this.label,
    required this.labels,
    required this.validators,
    required this.save,
    this.initial,
  });
  final String label;
  final List<String> labels;
  final List<String>? initial;
  final List<String? Function(String?)> validators;
  final Future<void> Function(List<String>) save;
  @override
  State<InlineEditor> createState() => _InlineEditorState();
}

class _InlineEditorState extends State<InlineEditor> {
  late final controllers = List.generate(
    widget.labels.length,
    (i) => TextEditingController(text: widget.initial?[i] ?? ''),
  );
  final form = GlobalKey<FormState>();
  bool open = false, busy = false;
  String? error;
  @override
  void dispose() {
    for (final c in controllers) {
      c.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      TextButton(
        onPressed: busy ? null : () => setState(() => open = !open),
        child: Text(open ? 'Cancelar' : widget.label),
      ),
      if (open)
        Form(
          key: form,
          child: Column(
            children: [
              ...List.generate(
                controllers.length,
                (i) => AppInput(
                  label: widget.labels[i],
                  controller: controllers[i],
                  validator: widget.validators[i],
                ),
              ),
              if (error != null) Text(error!),
              AppButton(
                'Guardar',
                busy: busy,
                onPressed: () async {
                  if (!form.currentState!.validate()) return;
                  setState(() {
                    busy = true;
                    error = null;
                  });
                  try {
                    await widget.save(
                      controllers.map((c) => c.text.trim()).toList(),
                    );
                    if (mounted) {
                      setState(() {
                        open = false;
                        if (widget.initial == null) {
                          for (final c in controllers) {
                            c.clear();
                          }
                        }
                      });
                    }
                  } catch (e) {
                    if (mounted) setState(() => error = e.toString());
                  } finally {
                    if (mounted) setState(() => busy = false);
                  }
                },
              ),
            ],
          ),
        ),
    ],
  );
}

class ResourceRow extends StatefulWidget {
  const ResourceRow({
    super.key,
    required this.title,
    required this.editor,
    required this.remove,
  });
  final String title;
  final Widget editor;
  final Future<void> Function() remove;
  @override
  State<ResourceRow> createState() => _ResourceRowState();
}

class _ResourceRowState extends State<ResourceRow> {
  bool busy = false;
  @override
  Widget build(BuildContext context) => Card(
    child: Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(widget.title),
          widget.editor,
          TextButton(
            onPressed: busy
                ? null
                : () async {
                    if (!await confirmDelete(context) || !mounted) return;
                    setState(() => busy = true);
                    try {
                      await widget.remove();
                    } catch (e) {
                      if (context.mounted) showError(context, e);
                    } finally {
                      if (mounted) setState(() => busy = false);
                    }
                  },
            child: const Text('Eliminar'),
          ),
        ],
      ),
    ),
  );
}
