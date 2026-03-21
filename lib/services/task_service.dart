import 'package:flutter_todo_sample/models/task.dart';
import 'package:flutter_todo_sample/repositories/i_task_repository.dart';

class TaskService {
  final ITaskRepository _repository;

  TaskService(this._repository);

  List<Task> createSeedTasks(int count) {
    final titles = List.generate(count, (index) => 'Task ${index + 1}');
    return _repository.createTasks(titles);
  }
}
