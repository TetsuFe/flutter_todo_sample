import 'package:flutter_todo_sample/models/task.dart';

abstract class ITaskRepository {
  Task createTask(String title);
  List<Task> createTasks(List<String> titles);
  List<Task> fetchTasks({int cursorId, int perPage});
}
