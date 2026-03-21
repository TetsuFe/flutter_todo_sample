import 'package:flutter_todo_sample/models/task.dart';

int lastTaskId = 0;

abstract class ITaskRepository {
  Task createTask(String title);
}
