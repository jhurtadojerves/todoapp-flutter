// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'form_viewmodels.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(BoardForm)
final boardFormProvider = BoardFormFamily._();

final class BoardFormProvider
    extends $NotifierProvider<BoardForm, FormViewState<BoardInput>> {
  BoardFormProvider._({
    required BoardFormFamily super.from,
    required int? super.argument,
  }) : super(
         retry: null,
         name: r'boardFormProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$boardFormHash();

  @override
  String toString() {
    return r'boardFormProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  BoardForm create() => BoardForm();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FormViewState<BoardInput> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<FormViewState<BoardInput>>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is BoardFormProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$boardFormHash() => r'8a4c2987318ba2fe3484cb60f36f2ed32ab2d4c1';

final class BoardFormFamily extends $Family
    with
        $ClassFamilyOverride<
          BoardForm,
          FormViewState<BoardInput>,
          FormViewState<BoardInput>,
          FormViewState<BoardInput>,
          int?
        > {
  BoardFormFamily._()
    : super(
        retry: null,
        name: r'boardFormProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  BoardFormProvider call(int? id) =>
      BoardFormProvider._(argument: id, from: this);

  @override
  String toString() => r'boardFormProvider';
}

abstract class _$BoardForm extends $Notifier<FormViewState<BoardInput>> {
  late final _$args = ref.$arg as int?;
  int? get id => _$args;

  FormViewState<BoardInput> build(int? id);
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref =
        this.ref as $Ref<FormViewState<BoardInput>, FormViewState<BoardInput>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<FormViewState<BoardInput>, FormViewState<BoardInput>>,
              FormViewState<BoardInput>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, () => build(_$args));
  }
}

@ProviderFor(TaskForm)
final taskFormProvider = TaskFormFamily._();

final class TaskFormProvider
    extends $NotifierProvider<TaskForm, FormViewState<TaskInput>> {
  TaskFormProvider._({
    required TaskFormFamily super.from,
    required (int, int?) super.argument,
  }) : super(
         retry: null,
         name: r'taskFormProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$taskFormHash();

  @override
  String toString() {
    return r'taskFormProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  TaskForm create() => TaskForm();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FormViewState<TaskInput> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<FormViewState<TaskInput>>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is TaskFormProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$taskFormHash() => r'8e4619d8a43e5c514d5620b8168cff2f26557089';

final class TaskFormFamily extends $Family
    with
        $ClassFamilyOverride<
          TaskForm,
          FormViewState<TaskInput>,
          FormViewState<TaskInput>,
          FormViewState<TaskInput>,
          (int, int?)
        > {
  TaskFormFamily._()
    : super(
        retry: null,
        name: r'taskFormProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  TaskFormProvider call(int boardId, int? taskId) =>
      TaskFormProvider._(argument: (boardId, taskId), from: this);

  @override
  String toString() => r'taskFormProvider';
}

abstract class _$TaskForm extends $Notifier<FormViewState<TaskInput>> {
  late final _$args = ref.$arg as (int, int?);
  int get boardId => _$args.$1;
  int? get taskId => _$args.$2;

  FormViewState<TaskInput> build(int boardId, int? taskId);
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref =
        this.ref as $Ref<FormViewState<TaskInput>, FormViewState<TaskInput>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<FormViewState<TaskInput>, FormViewState<TaskInput>>,
              FormViewState<TaskInput>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, () => build(_$args.$1, _$args.$2));
  }
}
