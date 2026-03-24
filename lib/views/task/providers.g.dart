// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(TaskList)
final taskListProvider = TaskListProvider._();

final class TaskListProvider
    extends $NotifierProvider<TaskList, model.PagenatedTaskListState> {
  TaskListProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'taskListProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$taskListHash();

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
}

String _$taskListHash() => r'27c6c87f5722261f435a4854cf82249cf1566320';

abstract class _$TaskList extends $Notifier<model.PagenatedTaskListState> {
  model.PagenatedTaskListState build();
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
    element.handleCreate(ref, build);
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
