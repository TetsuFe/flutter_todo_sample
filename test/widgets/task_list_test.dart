import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_todo_sample/views/task/states/pagenated_task_list_state.dart';
import 'package:flutter_todo_sample/models/task.dart';
import 'package:flutter_todo_sample/repositories/task/i_task_repository.dart';
import 'package:flutter_todo_sample/providers/task/providers.dart';
import 'package:flutter_todo_sample/views/task/components/task_list.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mockito/mockito.dart';

import '../shared/mocks.mocks.dart';

void main() {
  Widget buildApp(ITaskRepository repository) {
    return ProviderScope(
      overrides: [taskRepositoryProvider.overrideWithValue(repository)],
      child: const MaterialApp(home: Scaffold(body: TaskList())),
    );
  }

  group('TaskList infinite scroll', () {
    testWidgets('データが30件の場合、最初に最新の20件分が表示され、スクロールで残り10件が表示される', (
      WidgetTester tester,
    ) async {
      final repository = MockITaskRepository();

      // idの降順のタスク30件を用意し、それらを返すスタブを作成
      final dummyTasks = List.generate(
        30,
        (index) =>
            Task(id: index + 1, title: 'タスク${index + 1}', isCompleted: false),
      );
      dummyTasks.sort((a, b) => b.id.compareTo(a.id));
      final firstPageTasks = dummyTasks.where((task) => task.id > 20).toList();
      final secondPageTasks = dummyTasks
          .where((task) => task.id <= 20)
          .toList();
      when(
        repository.fetchTasks(
          page: 1,
          sortOption: TaskSortOption.latest,
          filterOption: TaskFilterOption.all,
        ),
      ).thenReturn((firstPageTasks, true));
      when(
        repository.fetchTasks(
          page: 2,
          sortOption: TaskSortOption.latest,
          filterOption: TaskFilterOption.all,
        ),
      ).thenReturn((secondPageTasks, false));

      await tester.pumpWidget(buildApp(repository));
      await tester.pump();

      // スクロールの関係でちょうど20件目まで表示されることの確認が難しいため、1件目が表示されることのみ確認
      expect(find.byKey(const ValueKey(30)), findsOneWidget);

      // 30件目までスクロール
      await tester.scrollUntilVisible(
        find.byKey(const ValueKey(1)),
        500,
        scrollable: find.byType(Scrollable),
      );

      expect(find.byKey(const ValueKey(1)), findsOneWidget);
    });
  });

  group('タスクの完了・未完了の切り替え', () {
    testWidgets('タスクが未完了状態の時、チェックボックスをタップすると、タスクが完了状態になる', (
      WidgetTester tester,
    ) async {
      final repository = MockITaskRepository();
      final task = const Task(id: 1, title: 'タスク1', isCompleted: false);
      when(
        repository.fetchTasks(
          page: 1,
          sortOption: TaskSortOption.latest,
          filterOption: TaskFilterOption.all,
        ),
      ).thenReturn(([task], false));
      when(
        repository.completeTask(1),
      ).thenReturn(task.copyWith(isCompleted: true));

      await tester.pumpWidget(buildApp(repository));

      final checkbox1 = tester.widget<Checkbox>(find.byType(Checkbox));
      expect(checkbox1.value, false);

      await tester.tap(find.byType(Checkbox));
      await tester.pump();

      final checkbox2 = tester.widget<Checkbox>(find.byType(Checkbox));
      verify(repository.completeTask(1)).called(1);
      expect(checkbox2.value, true);
    });

    testWidgets('タスクが完了状態の時、チェックボックスをタップすると、タスクが未完了状態になる', (
      WidgetTester tester,
    ) async {
      final repository = MockITaskRepository();
      final task = const Task(id: 1, title: 'タスク1', isCompleted: true);
      when(
        repository.fetchTasks(
          page: 1,
          sortOption: TaskSortOption.latest,
          filterOption: TaskFilterOption.all,
        ),
      ).thenReturn(([task], false));
      when(
        repository.uncompleteTask(1),
      ).thenReturn(task.copyWith(isCompleted: false));

      await tester.pumpWidget(buildApp(repository));

      final checkbox1 = tester.widget<Checkbox>(find.byType(Checkbox));
      expect(checkbox1.value, true);

      await tester.tap(find.byType(Checkbox));
      await tester.pump();

      final checkbox2 = tester.widget<Checkbox>(find.byType(Checkbox));
      verify(repository.uncompleteTask(1)).called(1);
      expect(checkbox2.value, false);
    });
  });
}
