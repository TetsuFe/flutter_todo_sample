import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_todo_sample/views/task/states/pagenated_task_list_state.dart';
import 'package:flutter_todo_sample/views/task/states/providers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_todo_sample/providers/task/providers.dart';

class CreateTaskModal extends HookConsumerWidget {
  const CreateTaskModal({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textController = useTextEditingController();
    final taskRepository = ref.watch(taskRepositoryProvider);
    final taskListNotifier = ref.watch(
      taskListProvider(TaskFilterOption.all).notifier,
    );

    return AlertDialog(
      title: const Text('タスクを追加'),
      content: TextField(
        controller: textController,
        decoration: const InputDecoration(hintText: 'タスクのタイトルを入力'),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('キャンセル'),
        ),
        ElevatedButton(
          onPressed: () {
            final title = textController.text;
            taskRepository.createTask(title);
            taskListNotifier.refresh();
            Navigator.of(context).pop();
          },
          child: const Text('追加'),
        ),
      ],
    );
  }
}
