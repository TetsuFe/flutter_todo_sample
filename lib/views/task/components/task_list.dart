import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_todo_sample/views/task/states/pagenated_task_list_state.dart'
    as model;
import 'package:flutter_todo_sample/views/task/components/task_list_item.dart';
import 'package:flutter_todo_sample/views/task/states/providers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TaskList extends HookConsumerWidget {
  const TaskList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageController = usePageController();
    final selectedTabIndex = useState(0);

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              _TabItem(
                title: '全て',
                isSelected: selectedTabIndex.value == 0,
                onTabSelected: () {
                  selectedTabIndex.value = 0;
                  pageController.jumpToPage(0);
                },
              ),
              _TabItem(
                title: '完了',
                isSelected: selectedTabIndex.value == 1,
                onTabSelected: () {
                  selectedTabIndex.value = 1;
                  pageController.jumpToPage(1);
                },
              ),
              _TabItem(
                title: '未完了',
                isSelected: selectedTabIndex.value == 2,
                onTabSelected: () {
                  selectedTabIndex.value = 2;
                  pageController.jumpToPage(2);
                },
              ),
              const Spacer(),
              const TaskListSortFilterButton(),
            ],
          ),
        ),
        Expanded(
          child: PageView(
            controller: pageController,
            onPageChanged: (value) => selectedTabIndex.value = value,
            children: const [
              _TaskListTabPage(filterOption: model.TaskFilterOption.all),
              _TaskListTabPage(filterOption: model.TaskFilterOption.completed),
              _TaskListTabPage(
                filterOption: model.TaskFilterOption.uncompleted,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _TabItem extends ConsumerWidget {
  const _TabItem({
    required this.title,
    required this.onTabSelected,
    required this.isSelected,
  });

  final String title;
  final VoidCallback onTabSelected;
  final bool isSelected;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        onTabSelected();
      },
      child: SizedBox(
        width: 60,
        child: Column(
          children: [
            Text(
              title,
              style: TextStyle(
                color: isSelected
                    ? Theme.of(context).colorScheme.primary
                    : null,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: Divider(
                color: isSelected
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context).dividerColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TaskListTabPage extends ConsumerWidget {
  const _TaskListTabPage({required this.filterOption});
  final model.TaskFilterOption filterOption;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final taskProvider = ref.watch(taskListProvider);
    final filteredTask = ref.watch(filteredTaskListProvider(filterOption));
    final hasNextPage = taskProvider.hasNextPage;
    final notifier = ref.watch(taskListProvider.notifier);

    return ListView.builder(
      key: PageStorageKey('task-list-$filterOption'),
      itemBuilder: (context, index) {
        if (index > filteredTask.length - 1 && hasNextPage) {
          Future.microtask(() => notifier.loadNextPage());
        }
        if (index > filteredTask.length - 1) {
          return null;
        }
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: TaskListItem(
            task: filteredTask[index],
            key: ValueKey('task-list-$filterOption-${filteredTask[index].id}'),
            onTaskStatusChanged: () {
              notifier.toggleTaskStatus(filteredTask[index]);
            },
          ),
        );
      },
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
