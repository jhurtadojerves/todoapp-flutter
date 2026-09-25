import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/models/models.dart';
import '../providers/usecase_providers.dart';
import 'resource_providers.dart';
part 'form_viewmodels.g.dart';

class FormViewState<T> {
  const FormViewState(
    this.input, {
    this.fieldErrors = const {},
    this.isSubmitting = false,
    this.error,
  });
  final T input;
  final Map<String, String> fieldErrors;
  final bool isSubmitting;
  final String? error;
  bool get canSubmit => !isSubmitting && fieldErrors.isEmpty;
}

@riverpod
class BoardForm extends _$BoardForm {
  @override
  FormViewState<BoardInput> build(int? id) => const FormViewState(
    BoardInput(name: '', description: ''),
    fieldErrors: {'name': 'Este campo es obligatorio.'},
  );
  void update(BoardInput input) {
    if (state.isSubmitting) return;
    state = FormViewState(
      input,
      fieldErrors: input.name.trim().isEmpty
          ? {'name': 'Este campo es obligatorio.'}
          : {},
    );
  }

  Future<bool> submit() async {
    if (!state.canSubmit) return false;
    final input = state.input.copyWith(
      name: state.input.name.trim(),
      description: state.input.description.trim(),
    );
    state = FormViewState(input, isSubmitting: true);
    try {
      if (id == null) {
        await ref.read(createBoardProvider)(input);
      } else {
        await ref.read(updateBoardProvider)(id!, input);
      }
      if (!ref.mounted) return false;
      ref.invalidate(boardsProvider);
      if (id != null) ref.invalidate(boardDetailProvider(id!));
      state = FormViewState(input);
      return true;
    } catch (e) {
      if (ref.mounted) state = FormViewState(input, error: e.toString());
      return false;
    }
  }
}

@riverpod
class TaskForm extends _$TaskForm {
  @override
  FormViewState<TaskInput> build(int boardId, int? taskId) =>
      const FormViewState(
        TaskInput(
          title: '',
          description: '',
          statusId: null,
          sprintId: null,
          assignedToId: null,
        ),
        fieldErrors: {'title': 'Este campo es obligatorio.'},
      );
  void update(TaskInput input) {
    if (state.isSubmitting) return;
    state = FormViewState(
      input,
      fieldErrors: input.title.trim().isEmpty
          ? {'title': 'Este campo es obligatorio.'}
          : {},
    );
  }

  Future<bool> submit() async {
    if (!state.canSubmit) return false;
    final input = state.input.copyWith(
      title: state.input.title.trim(),
      description: state.input.description.trim(),
    );
    state = FormViewState(input, isSubmitting: true);
    try {
      if (taskId == null) {
        await ref.read(createTaskProvider)(boardId, input);
      } else {
        await ref.read(updateTaskProvider)(taskId!, input);
      }
      if (!ref.mounted) return false;
      ref.invalidate(tasksProvider);
      if (taskId != null) ref.invalidate(taskDetailProvider(taskId!));
      state = FormViewState(input);
      return true;
    } catch (e) {
      if (ref.mounted) state = FormViewState(input, error: e.toString());
      return false;
    }
  }
}
