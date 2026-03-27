import 'package:flutter/material.dart';
import 'package:flutter_todo_sample/models/task.dart';
import 'package:flutter_todo_sample/repositories/task/providers.dart';
import 'package:flutter_todo_sample/views/task/providers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TaskListItem extends HookConsumerWidget {
  const TaskListItem({super.key, required this.task});
  final Task task;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final taskRepository = ref.watch(taskRepositoryProvider);
    final taskListNotifier = ref.watch(taskListProvider.notifier);

    return ListTile(
      title: Text(task.title),
      trailing: Checkbox(
        value: task.isCompleted,
        onChanged: (value) {
          if (value ?? false) {
            try {
              final updatedTask = taskRepository.completeTask(task.id);
              taskListNotifier.refreshTask(updatedTask);
            } catch (e) {
              // 何もしない
            }
          } else {
            try {
              final updatedTask = taskRepository.uncompleteTask(task.id);
              taskListNotifier.refreshTask(updatedTask);
            } catch (e) {
              // 何もしない
            }
          }
        },
      ),
    );
  }
}
