import 'package:flutter/material.dart';
import 'package:flutter_todo_sample/models/task.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TaskListItem extends ConsumerWidget {
  const TaskListItem({super.key, required this.task});
  final Task task;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(title: Text(task.title), key: ValueKey(task.id));
  }
}
