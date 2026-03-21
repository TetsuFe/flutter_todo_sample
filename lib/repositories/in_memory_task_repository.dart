import 'package:flutter_todo_sample/models/task.dart';
import 'package:flutter_todo_sample/repositories/i_task_repository.dart';

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
}
