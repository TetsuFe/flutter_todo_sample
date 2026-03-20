import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'in_memory_task_repository.dart';

part 'providers.g.dart';

@riverpod
InMemoryTaskRepository taskRepository(Ref ref) {
  return InMemoryTaskRepository();
}
