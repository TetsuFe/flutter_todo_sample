import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_todo_sample/views/task/states/pagenated_task_list_state.dart';
import 'package:flutter_todo_sample/models/task.dart';
import 'package:flutter_todo_sample/providers/task/providers.dart';
import 'package:flutter_todo_sample/views/task/components/create_task_modal.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mockito/mockito.dart';

import '../shared/mocks.mocks.dart';

void main() {
  testWidgets('新しいタスクのタイトルを入力し、追加ボタンをタップすると、タスク作成処理が実行される', (
    WidgetTester tester,
  ) async {
    final mockTaskRepository = MockITaskRepository();
    final newTask = const Task(id: 1, title: '新しいタスク', isCompleted: false);
    when(mockTaskRepository.createTask(any)).thenReturn(newTask);
    when(
      mockTaskRepository.fetchTasks(
        page: 1,
        perPage: null,
        sortOption: TaskSortOption.latest,
      ),
    ).thenReturn(([newTask], false));

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          taskRepositoryProvider.overrideWithValue(mockTaskRepository),
        ],
        child: const MaterialApp(home: Scaffold(body: CreateTaskModal())),
      ),
    );

    final textFieldFinder = find.byType(TextField);
    final addButtonFinder = find.widgetWithText(ElevatedButton, '追加');

    await tester.enterText(textFieldFinder, '新しいタスク');
    await tester.tap(addButtonFinder);
    await tester.pumpAndSettle();

    verify(mockTaskRepository.createTask('新しいタスク')).called(1);
  });
}
