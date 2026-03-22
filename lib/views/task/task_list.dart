import 'package:flutter/material.dart';
import 'package:flutter_todo_sample/views/task/providers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TaskList extends ConsumerWidget {
  const TaskList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tasks = ref.watch(taskListProvider).tasks;
    final hasNextPage = ref.watch(taskListProvider).hasNextPage;
    final notifier = ref.watch(taskListProvider.notifier);
    return ListView.builder(
      itemBuilder: (context, index) {
        if (index > tasks.length - 1 && hasNextPage) {
          Future.microtask(() => notifier.loadNextPage());
        }
        if (index > tasks.length - 1) {
          return null;
        }
        return ListTile(
          title: Text(tasks[index].title),
          key: ValueKey(tasks[index].id),
        );
      },
    );
  }
}
