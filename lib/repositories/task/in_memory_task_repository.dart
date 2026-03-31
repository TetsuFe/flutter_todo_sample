import 'package:flutter_todo_sample/views/task/states/pagenated_task_list_state.dart';
import 'package:flutter_todo_sample/models/task.dart';
import 'package:flutter_todo_sample/repositories/task/i_task_repository.dart';

class InMemoryTaskRepository extends ITaskRepository {
  static int lastTaskId = 0;
  static final List<Task> _tasks = [];
  List<Task> get tasks => List.unmodifiable(_tasks);

  @override
  Task createTask(String title) {
    if (title.isEmpty) {
      throw ArgumentError('タイトルは空にできません');
    }
    final task = Task(id: ++lastTaskId, title: title, isCompleted: false);
    _tasks.add(task);
    return task;
  }

  @override
  List<Task> createTasks(List<String> titles) {
    return titles.map((title) => createTask(title)).toList();
  }

  @override
  (List<Task>, bool) fetchTasks({
    int page = 1,
    int perPage = 20,
    TaskSortOption sortOption = TaskSortOption.latest,
  }) {
    final offset = (page - 1) * perPage;
    final copiedTasks = [..._tasks];
    copiedTasks.sort(
      (a, b) => sortOption == TaskSortOption.latest
          ? b.id.compareTo(a.id)
          : a.id.compareTo(b.id),
    );
    final tasks = copiedTasks.indexed
        .where((e) => e.$1 >= offset)
        .map((e) => e.$2)
        .take(perPage)
        .toList();
    final hasNextPage = copiedTasks.length > offset + perPage;
    return (tasks, hasNextPage);
  }

  @override
  Task completeTask(int id) {
    final targetTaskId = _tasks.indexWhere((task) => task.id == id);
    if (_tasks[targetTaskId].isCompleted) {
      throw Exception('タスクは既に完了しています');
    }
    _tasks[targetTaskId] = _tasks[targetTaskId].copyWith(isCompleted: true);
    return _tasks[targetTaskId];
  }

  @override
  Task uncompleteTask(int id) {
    final targetTaskId = _tasks.indexWhere((task) => task.id == id);
    if (!_tasks[targetTaskId].isCompleted) {
      throw Exception('タスクは既に未完了です');
    }
    _tasks[targetTaskId] = _tasks[targetTaskId].copyWith(isCompleted: false);
    return _tasks[targetTaskId];
  }

  static void reset() {
    lastTaskId = 0;
    _tasks.clear();
  }
}
