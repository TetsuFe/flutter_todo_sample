import 'package:flutter_todo_sample/repositories/i_task_repository.dart';
import 'package:flutter_todo_sample/services/task_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'in_memory_task_repository.dart';

part 'providers.g.dart';

@Riverpod(keepAlive: true)
class TaskRepository extends _$TaskRepository {
  @override
  ITaskRepository build() {
    final repository = InMemoryTaskRepository();
    TaskService(repository).createSeedTasks(50);
    return repository;
  }
}
