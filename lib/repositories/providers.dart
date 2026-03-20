import 'package:flutter_todo_sample/repositories/i_task_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'in_memory_task_repository.dart';

part 'providers.g.dart';

@riverpod
ITaskRepository taskRepository(Ref ref) {
  return InMemoryTaskRepository();
}
