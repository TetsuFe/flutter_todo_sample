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
    extends $NotifierProvider<TaskList, PagenatedTaskListState> {
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
  Override overrideWithValue(PagenatedTaskListState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PagenatedTaskListState>(value),
    );
  }
}

String _$taskListHash() => r'c47c6c9eab3b24deb963364bb7b446eb9d1f3359';

abstract class _$TaskList extends $Notifier<PagenatedTaskListState> {
  PagenatedTaskListState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<PagenatedTaskListState, PagenatedTaskListState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<PagenatedTaskListState, PagenatedTaskListState>,
              PagenatedTaskListState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
