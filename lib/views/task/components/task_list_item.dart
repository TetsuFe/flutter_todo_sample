import 'package:flutter/material.dart';
import 'package:flutter_todo_sample/models/task.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TaskListItem extends HookConsumerWidget {
  const TaskListItem({
    super.key,
    required this.task,
    required this.onTaskStatusChanged,
  });
  final Task task;
  final VoidCallback onTaskStatusChanged;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      title: Text(task.title),
      trailing: Checkbox(
        value: task.isCompleted,
        onChanged: (_) {
          onTaskStatusChanged();
        },
      ),
    );
  }
}
