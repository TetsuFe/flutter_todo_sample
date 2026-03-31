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

String _$taskListHash() => r'7f5c3cfe709d281acd670037c120599b6ff230fe';

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

@ProviderFor(filteredTaskList)
final filteredTaskListProvider = FilteredTaskListFamily._();

final class FilteredTaskListProvider
    extends $FunctionalProvider<List<Task>, List<Task>, List<Task>>
    with $Provider<List<Task>> {
  FilteredTaskListProvider._({
    required FilteredTaskListFamily super.from,
    required model.TaskFilterOption super.argument,
  }) : super(
         retry: null,
         name: r'filteredTaskListProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$filteredTaskListHash();

  @override
  String toString() {
    return r'filteredTaskListProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<List<Task>> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  List<Task> create(Ref ref) {
    final argument = this.argument as model.TaskFilterOption;
    return filteredTaskList(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<Task> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<Task>>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is FilteredTaskListProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$filteredTaskListHash() => r'3bcf2fbf34da32c02a86e528480f21724f06761a';

final class FilteredTaskListFamily extends $Family
    with $FunctionalFamilyOverride<List<Task>, model.TaskFilterOption> {
  FilteredTaskListFamily._()
    : super(
        retry: null,
        name: r'filteredTaskListProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  FilteredTaskListProvider call(model.TaskFilterOption filterOption) =>
      FilteredTaskListProvider._(argument: filterOption, from: this);

  @override
  String toString() => r'filteredTaskListProvider';
}
