import 'package:flutter_todo_sample/models/pagenated_task_list_state.dart';
import 'package:flutter_todo_sample/repositories/providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'providers.g.dart';

@riverpod
class TaskList extends _$TaskList {
  final firstPage = 1;

  @override
  PagenatedTaskListState build() {
    final repository = ref.watch(taskRepositoryProvider);
    final (tasks, hasNextPage) = repository.fetchTasks(page: firstPage);
    return PagenatedTaskListState(
      tasks: tasks,
      currentPage: firstPage,
      hasNextPage: hasNextPage,
    );
  }

  void loadNextPage() {
    final repository = ref.watch(taskRepositoryProvider);
    final nextPage = state.currentPage + 1;
    final (nextTasks, hasNextPage) = repository.fetchTasks(page: nextPage);
    state = state.copyWith(
      tasks: [...state.tasks, ...nextTasks],
      currentPage: nextPage,
      hasNextPage: hasNextPage,
    );
  }
}
