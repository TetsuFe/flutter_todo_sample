import 'package:flutter/material.dart';
import 'package:flutter_todo_sample/views/task/states/pagenated_task_list_state.dart'
    as model;
import 'package:flutter_todo_sample/views/task/components/task_list_item.dart';
import 'package:flutter_todo_sample/views/task/states/providers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TaskList extends ConsumerWidget {
  const TaskList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tasks = ref.watch(taskListProvider).tasks;
    final hasNextPage = ref.watch(taskListProvider).hasNextPage;
    final notifier = ref.watch(taskListProvider.notifier);

    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(children: [Spacer(), TaskListSortFilterButton()]),
          ),
        ),
        SliverList.builder(
          itemBuilder: (context, index) {
            if (index > tasks.length - 1 && hasNextPage) {
              Future.microtask(() => notifier.loadNextPage());
            }
            if (index > tasks.length - 1) {
              return null;
            }
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: TaskListItem(
                task: tasks[index],
                key: ValueKey(tasks[index].id),
              ),
            );
          },
        ),
      ],
    );
  }
}

class TaskListSortFilterButton extends HookConsumerWidget {
  const TaskListSortFilterButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sortOptionNotifier = ref.watch(taskSortOptionProvider.notifier);
    final sortOption = ref.watch(taskSortOptionProvider);
    final notifier = ref.watch(taskListProvider.notifier);

    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      onPressed: () {
        sortOptionNotifier.toggle();
        notifier.refresh();
      },
      child: Row(
        children: [
          const Icon(Icons.sort),
          const SizedBox(width: 8),
          sortOption == model.TaskSortOption.latest
              ? const Text('新しい順')
              : const Text('古い順'),
        ],
      ),
    );
  }
}
