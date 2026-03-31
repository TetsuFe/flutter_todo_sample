import 'package:flutter_todo_sample/views/task/states/pagenated_task_list_state.dart'
    as model;
import 'package:flutter_todo_sample/models/task.dart';
import 'package:flutter_todo_sample/providers/task/providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'providers.g.dart';

@riverpod
class TaskList extends _$TaskList {
  final firstPage = 1;

  @override
  model.PagenatedTaskListState build() {
    final repository = ref.watch(taskRepositoryProvider);
    final sortOption = ref.watch(taskSortOptionProvider);
    final (tasks, hasNextPage) = repository.fetchTasks(
      page: firstPage,
      sortOption: sortOption,
    );
    return model.PagenatedTaskListState(
      tasks: tasks,
      currentPage: firstPage,
      hasNextPage: hasNextPage,
    );
  }

  void loadNextPage() {
    final repository = ref.watch(taskRepositoryProvider);
    final sortOption = ref.watch(taskSortOptionProvider);
    final nextPage = state.currentPage + 1;
    final (nextTasks, hasNextPage) = repository.fetchTasks(
      page: nextPage,
      sortOption: sortOption,
    );
    state = state.copyWith(
      tasks: [...state.tasks, ...nextTasks],
      currentPage: nextPage,
      hasNextPage: hasNextPage,
    );
  }

  void refresh() {
    final repository = ref.watch(taskRepositoryProvider);
    final sortOption = ref.watch(taskSortOptionProvider);
    final (tasks, hasNextPage) = repository.fetchTasks(
      page: firstPage,
      sortOption: sortOption,
    );
    state = model.PagenatedTaskListState(
      tasks: tasks,
      currentPage: firstPage,
      hasNextPage: hasNextPage,
    );
  }

  void refreshTask(Task updatedTask) {
    state = state.copyWith(
      tasks: state.tasks.map((task) {
        if (task.id == updatedTask.id) {
          return updatedTask;
        } else {
          return task;
        }
      }).toList(),
    );
  }

  void toggleTaskStatus(Task task) {
    final repository = ref.watch(taskRepositoryProvider);
    if (task.isCompleted) {
      try {
        final updatedTask = repository.uncompleteTask(task.id);
        refreshTask(updatedTask);
      } catch (e) {
        // 何もしない
      }
    } else {
      try {
        final updatedTask = repository.completeTask(task.id);
        refreshTask(updatedTask);
      } catch (e) {
        // 何もしない
      }
    }
  }
}

@riverpod
class TaskSortOption extends _$TaskSortOption {
  @override
  model.TaskSortOption build() {
    return model.TaskSortOption.latest;
  }

  void toggle() {
    state = state == model.TaskSortOption.latest
        ? model.TaskSortOption.oldest
        : model.TaskSortOption.latest;
  }
}

@riverpod
List<Task> filteredTaskList(Ref ref, model.TaskFilterOption filterOption) {
  final taskList = ref.watch(taskListProvider);
  return switch (filterOption) {
    model.TaskFilterOption.all => taskList.tasks,
    model.TaskFilterOption.completed =>
      taskList.tasks.where((task) => task.isCompleted).toList(),
    model.TaskFilterOption.uncompleted =>
      taskList.tasks.where((task) => !task.isCompleted).toList(),
  };
}
