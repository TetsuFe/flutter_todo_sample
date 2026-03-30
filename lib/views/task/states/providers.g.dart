// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(TaskList)
final taskListProvider = TaskListFamily._();

final class TaskListProvider
    extends $NotifierProvider<TaskList, model.PagenatedTaskListState> {
  TaskListProvider._({
    required TaskListFamily super.from,
    required model.TaskFilterOption super.argument,
  }) : super(
         retry: null,
         name: r'taskListProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$taskListHash();

  @override
  String toString() {
    return r'taskListProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  TaskList create() => TaskList();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(model.PagenatedTaskListState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<model.PagenatedTaskListState>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is TaskListProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$taskListHash() => r'74f347ec5fa47d09d8fc721645ef0dff9da99825';

final class TaskListFamily extends $Family
    with
        $ClassFamilyOverride<
          TaskList,
          model.PagenatedTaskListState,
          model.PagenatedTaskListState,
          model.PagenatedTaskListState,
          model.TaskFilterOption
        > {
  TaskListFamily._()
    : super(
        retry: null,
        name: r'taskListProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  TaskListProvider call(model.TaskFilterOption filterOption) =>
      TaskListProvider._(argument: filterOption, from: this);

  @override
  String toString() => r'taskListProvider';
}

abstract class _$TaskList extends $Notifier<model.PagenatedTaskListState> {
  late final _$args = ref.$arg as model.TaskFilterOption;
  model.TaskFilterOption get filterOption => _$args;

  model.PagenatedTaskListState build(model.TaskFilterOption filterOption);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref
            as $Ref<model.PagenatedTaskListState, model.PagenatedTaskListState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                model.PagenatedTaskListState,
                model.PagenatedTaskListState
              >,
              model.PagenatedTaskListState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}

@ProviderFor(TaskSortOption)
final taskSortOptionProvider = TaskSortOptionProvider._();

final class TaskSortOptionProvider
    extends $NotifierProvider<TaskSortOption, model.TaskSortOption> {
  TaskSortOptionProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'taskSortOptionProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$taskSortOptionHash();

  @$internal
  @override
  TaskSortOption create() => TaskSortOption();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(model.TaskSortOption value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<model.TaskSortOption>(value),
    );
  }
}

String _$taskSortOptionHash() => r'c3f1befe046252c4f2621a8c872cab4847fe78a1';

abstract class _$TaskSortOption extends $Notifier<model.TaskSortOption> {
  model.TaskSortOption build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<model.TaskSortOption, model.TaskSortOption>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<model.TaskSortOption, model.TaskSortOption>,
              model.TaskSortOption,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
