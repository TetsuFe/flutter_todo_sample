import 'package:flutter_todo_sample/models/task.dart';
import 'package:flutter_todo_sample/repositories/i_task_repository.dart';

class InMemoryTaskRepository extends ITaskRepository {
  @override
  Task? createTask(String title) {
    if (title.isEmpty) {
      return null;
    }
    return Task(id: ++lastTaskId, title: title, isCompleted: false);
  }
}
