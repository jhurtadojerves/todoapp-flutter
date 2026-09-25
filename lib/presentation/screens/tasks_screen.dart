import '../viewmodels/task_options_provider.dart';
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
import '../widgets/task_attachments.dart';

class TasksScreen extends ConsumerStatefulWidget {
  const TasksScreen({super.key, required this.boardId});
  final int boardId;
  @override
  ConsumerState<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends ConsumerState<TasksScreen> {
  int? status;
  @override
  Widget build(BuildContext context) {
    final key = (boardId: widget.boardId, status: status);
    return AppScaffold(
      title: 'Tareas',
      fallback: '/board/${widget.boardId}',
      actions: [
        TextButton(
          onPressed: () => context.push('/board/${widget.boardId}/tasks/new'),
          child: const Text('Nueva'),
        ),
      ],
      child: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text('Todas las tareas de este tablero.'),
          AsyncContent(
            value: ref.watch(taskOptionsProvider(widget.boardId)),
            retry: () => ref.invalidate(taskOptionsProvider(widget.boardId)),
            builder: (options) => ChipPicker(
              label: 'Estado',
              options: {for (final s in options.statuses) s.id: s.name},
              value: status,
              onChanged: (value) => setState(() => status = value),
            ),
          ),
          PagedList<Task>(
            value: ref.watch(tasksProvider(key)),
            retry: () => ref.invalidate(tasksProvider(key)),
            more: () => ref.read(tasksProvider(key).notifier).loadMore(),
            item: (task) => Card(
              child: ListTile(
                title: Text(task.title),
                subtitle: Text(task.status?.name ?? 'Sin estado'),
                onTap: () =>
                    context.push('/board/${widget.boardId}/tasks/${task.id}'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TaskFormScreen extends ConsumerStatefulWidget {
  const TaskFormScreen({super.key, required this.boardId, this.taskId});
  final int boardId;
  final int? taskId;
  @override
  ConsumerState<TaskFormScreen> createState() => _TaskFormScreenState();
}

class _TaskFormScreenState extends ConsumerState<TaskFormScreen> {
  final form = GlobalKey<FormState>();
  final title = TextEditingController(), description = TextEditingController();
  int? statusId, sprintId, assignedToId;
  bool initialized = false;
  bool get busy =>
      ref.watch(taskFormProvider(widget.boardId, widget.taskId)).isSubmitting;
  String? get error =>
      ref.watch(taskFormProvider(widget.boardId, widget.taskId)).error;
  @override
  void dispose() {
    title.dispose();
    description.dispose();
    super.dispose();
  }

  Future<void> submit() async {
    if (!form.currentState!.validate()) return;
    final notifier = ref.read(
      taskFormProvider(widget.boardId, widget.taskId).notifier,
    );
    notifier.update(
      TaskInput(
        title: title.text,
        description: description.text,
        statusId: statusId,
        sprintId: sprintId,
        assignedToId: assignedToId,
      ),
    );
    final saved = await notifier.submit();
    if (saved && mounted) {
      context.go(
        widget.taskId == null
            ? '/board/${widget.boardId}/tasks'
            : '/board/${widget.boardId}/tasks/${widget.taskId}',
      );
    }
  }

  Widget fields() => AsyncContent(
    value: ref.watch(taskOptionsProvider(widget.boardId)),
    retry: () => ref.invalidate(taskOptionsProvider(widget.boardId)),
    builder: (options) => Form(
      key: form,
      child: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          AppInput(label: 'Título', controller: title, validator: requiredText),
          AppInput(label: 'Descripción', controller: description, lines: 3),
          ChipPicker(
            label: 'Estado',
            options: {for (final s in options.statuses) s.id: s.name},
            value: statusId,
            onChanged: (v) => setState(() => statusId = v),
          ),
          ChipPicker(
            label: 'Sprint',
            options: {for (final s in options.sprints) s.id: s.name},
            value: sprintId,
            onChanged: (v) => setState(() => sprintId = v),
          ),
          ChipPicker(
            label: 'Asignado',
            options: {for (final m in options.members) m.user.id: m.user.email},
            value: assignedToId,
            onChanged: (v) => setState(() => assignedToId = v),
          ),
          if (error != null) Text(error!),
          AppButton(
            widget.taskId == null ? 'Crear tarea' : 'Guardar cambios',
            busy: busy,
            onPressed: submit,
          ),
        ],
      ),
    ),
  );
  @override
  Widget build(BuildContext context) => AppScaffold(
    title: widget.taskId == null ? 'Nueva tarea' : 'Editar tarea',
    fallback: '/board/${widget.boardId}/tasks',
    child: widget.taskId == null
        ? fields()
        : AsyncContent(
            value: ref.watch(taskDetailProvider(widget.taskId!)),
            retry: () => ref.invalidate(taskDetailProvider(widget.taskId!)),
            builder: (task) {
              if (task.boardId != widget.boardId) {
                return const Text('La tarea no pertenece a este tablero.');
              }
              if (!initialized) {
                title.text = task.title;
                description.text = task.description;
                statusId = task.status?.id;
                sprintId = task.sprint?.id;
                assignedToId = task.assignedToId;
                initialized = true;
              }
              return fields();
            },
          ),
  );
}

class TaskDetailScreen extends ConsumerStatefulWidget {
  const TaskDetailScreen({
    super.key,
    required this.boardId,
    required this.taskId,
  });
  final int boardId, taskId;
  @override
  ConsumerState<TaskDetailScreen> createState() => _TaskDetailScreenState();
}

class _TaskDetailScreenState extends ConsumerState<TaskDetailScreen> {
  bool deleting = false;
  Future<void> remove() async {
    if (!await confirmDelete(context) || !mounted) return;
    setState(() => deleting = true);
    try {
      await ref.read(deleteTaskProvider)(widget.taskId);
      ref.invalidate(tasksProvider);
      ref.invalidate(taskDetailProvider(widget.taskId));
      if (mounted) context.go('/board/${widget.boardId}/tasks');
    } catch (e) {
      if (mounted) showError(context, e);
    } finally {
      if (mounted) setState(() => deleting = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final owner =
        ref.watch(boardDetailProvider(widget.boardId)).value?.userId ==
        ref.watch(userIdProvider);
    final userId = ref.watch(userIdProvider);
    final id = widget.taskId;
    return AppScaffold(
      title: 'Detalle de tarea',
      fallback: '/board/${widget.boardId}/tasks',
      child: AsyncContent(
        value: ref.watch(taskDetailProvider(id)),
        retry: () => ref.invalidate(taskDetailProvider(id)),
        builder: (task) {
          if (task.boardId != widget.boardId) {
            return const Text('La tarea no pertenece a este tablero.');
          }
          return ListView(
            padding: const EdgeInsets.all(20),
            children: [
              Text(
                task.title,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              Text(task.description),
              Text('Estado: ${task.status?.name ?? "Sin estado"}'),
              Text('Sprint: ${task.sprint?.name ?? "Sin sprint"}'),
              AppButton(
                'Editar tarea',
                onPressed: () =>
                    context.push('/board/${widget.boardId}/tasks/$id/edit'),
              ),
              AppButton('Eliminar tarea', busy: deleting, onPressed: remove),
              TaskAttachments(taskId: id),
              Text(
                'Comentarios',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              PagedList<Comment>(
                value: ref.watch(commentsProvider(id)),
                retry: () => ref.invalidate(commentsProvider(id)),
                more: () => ref.read(commentsProvider(id).notifier).loadMore(),
                item: (c) => owner || c.userId == userId
                    ? ResourceRow(
                        key: ValueKey(c.id),
                        title: c.content,
                        editor: InlineEditor(
                          label: 'Editar comentario',
                          labels: const ['Comentario'],
                          initial: [c.content],
                          validators: [requiredText],
                          save: (v) async {
                            await ref.read(updateCommentProvider)(
                              id,
                              c.id,
                              CommentInput(content: v[0]),
                            );
                            ref.invalidate(commentsProvider(id));
                          },
                        ),
                        remove: () async {
                          await ref.read(deleteCommentProvider)(id, c.id);
                          ref.invalidate(commentsProvider(id));
                        },
                      )
                    : ListTile(title: Text(c.content)),
              ),
              InlineEditor(
                label: 'Crear comentario',
                labels: const ['Comentario'],
                validators: [requiredText],
                save: (v) async {
                  await ref.read(createCommentProvider)(
                    id,
                    CommentInput(content: v[0]),
                  );
                  ref.invalidate(commentsProvider(id));
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
