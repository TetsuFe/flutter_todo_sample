import 'package:flutter_todo_sample/models/pagenated_task_list_state.dart';
import 'package:flutter_todo_sample/models/task.dart';

abstract class ITaskRepository {
  Task createTask(String title);
  List<Task> createTasks(List<String> titles);
  (List<Task>, bool) fetchTasks({
    int page,
    int perPage,
    TaskSortOption sortOption,
  });
}
