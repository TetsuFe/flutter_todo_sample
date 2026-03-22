// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(TaskRepository)
final taskRepositoryProvider = TaskRepositoryProvider._();

final class TaskRepositoryProvider
    extends $NotifierProvider<TaskRepository, ITaskRepository> {
  TaskRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'taskRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$taskRepositoryHash();

  @$internal
  @override
  TaskRepository create() => TaskRepository();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ITaskRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ITaskRepository>(value),
    );
  }
}

String _$taskRepositoryHash() => r'9b2886af7a7a7cbda0bdc7c7f80ef77cd7bcdc98';

abstract class _$TaskRepository extends $Notifier<ITaskRepository> {
  ITaskRepository build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<ITaskRepository, ITaskRepository>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ITaskRepository, ITaskRepository>,
              ITaskRepository,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
