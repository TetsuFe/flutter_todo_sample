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

  group('「全て」タブのテスト', () {
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
        final firstPageTasks = dummyTasks
            .where((task) => task.id > 20)
            .toList();
        final secondPageTasks = dummyTasks
            .where((task) => task.id <= 20)
            .toList();
        when(
          repository.fetchTasks(page: 1, sortOption: TaskSortOption.latest),
        ).thenReturn((firstPageTasks, true));
        when(
          repository.fetchTasks(page: 2, sortOption: TaskSortOption.latest),
        ).thenReturn((secondPageTasks, false));

        await tester.pumpWidget(buildApp(repository));
        await tester.pump();

        // スクロールの関係でちょうど20件目まで表示されることの確認が難しいため、1件目が表示されることのみ確認
        final firstWidgetKey = const ValueKey('task-list-30');
        expect(find.byKey(firstWidgetKey), findsOneWidget);

        final list = find.byKey(
          PageStorageKey('task-list-${TaskFilterOption.all}'),
        );
        final scrollable = find.byWidgetPredicate((w) => w is Scrollable);
        final scrollableOfList = find.descendant(
          of: list,
          matching: scrollable,
        );
        final lastWidgetKey = const ValueKey('task-list-1');

        // 30件目までスクロール
        await tester.scrollUntilVisible(
          find.byKey(lastWidgetKey),
          500,
          scrollable: scrollableOfList,
        );

        expect(find.byKey(lastWidgetKey), findsOneWidget);
      });
    });

    group('タスクの完了・未完了の切り替え', () {
      testWidgets('タスクが未完了状態の時、チェックボックスをタップすると、タスクが完了状態になる', (
        WidgetTester tester,
      ) async {
        final repository = MockITaskRepository();
        final task = const Task(id: 1, title: 'タスク1', isCompleted: false);
        when(
          repository.fetchTasks(page: 1, sortOption: TaskSortOption.latest),
        ).thenReturn(([task], false));
        when(
          repository.completeTask(1),
        ).thenReturn(task.copyWith(isCompleted: true));

        await tester.pumpWidget(buildApp(repository));

        final targetListItem = find.byKey(const ValueKey('task-list-1'));
        final checkboxFinder = find.descendant(
          of: targetListItem,
          matching: find.byType(Checkbox),
        );
        final checkbox = tester.widget<Checkbox>(checkboxFinder);
        expect(checkbox.value, false);

        await tester.tap(checkboxFinder);
        await tester.pump();

        final updatedCheckbox = tester.widget<Checkbox>(checkboxFinder);
        verify(repository.completeTask(1)).called(1);
        expect(updatedCheckbox.value, true);
      });

      testWidgets('タスクが完了状態の時、チェックボックスをタップすると、タスクが未完了状態になる', (
        WidgetTester tester,
      ) async {
        final repository = MockITaskRepository();
        final task = const Task(id: 1, title: 'タスク1', isCompleted: true);
        when(
          repository.fetchTasks(page: 1, sortOption: TaskSortOption.latest),
        ).thenReturn(([task], false));
        when(
          repository.uncompleteTask(1),
        ).thenReturn(task.copyWith(isCompleted: false));

        await tester.pumpWidget(buildApp(repository));

        final targetListItem = find.byKey(const ValueKey('task-list-1'));
        final checkboxFinder = find.descendant(
          of: targetListItem,
          matching: find.byType(Checkbox),
        );
        final checkbox = tester.widget<Checkbox>(checkboxFinder);
        expect(checkbox.value, true);

        await tester.tap(checkboxFinder);
        await tester.pump();

        final updatedCheckbox = tester.widget<Checkbox>(checkboxFinder);
        verify(repository.uncompleteTask(1)).called(1);
        expect(updatedCheckbox.value, false);
      });
    });
  });

  group('タスクのステータスによる絞り込み', () {
    testWidgets('それぞれのフィルタ切り替えボタンをタップした際、対象のステータスのタスクが表示される', (
      WidgetTester tester,
    ) async {
      final repository = MockITaskRepository();
      when(
        repository.fetchTasks(page: 1, sortOption: TaskSortOption.latest),
      ).thenReturn((
        [
          const Task(id: 2, title: '完了済みタスク', isCompleted: true),
          const Task(id: 1, title: '未完了タスク', isCompleted: false),
        ],
        false,
      ));
      await tester.pumpWidget(buildApp(repository));

      final uncompletedTaskFinder = find.text('未完了タスク');
      final completedTaskFinder = find.text('完了済みタスク');

      expect(uncompletedTaskFinder, findsOneWidget);
      expect(completedTaskFinder, findsOneWidget);

      await tester.tap(find.text('完了'));
      await tester.pump();

      expect(uncompletedTaskFinder, findsNothing);
      expect(completedTaskFinder, findsOneWidget);

      await tester.tap(find.text('未完了'));
      await tester.pump();

      expect(uncompletedTaskFinder, findsOneWidget);
      expect(completedTaskFinder, findsNothing);

      await tester.tap(find.text('全て'));
      await tester.pump();

      expect(uncompletedTaskFinder, findsOneWidget);
      expect(completedTaskFinder, findsOneWidget);
    });

    testWidgets('完了のフィルタが有効になった時、完了のステータスのタスクが最低一つ見つかるまで、新たなページを取得する', (
      WidgetTester tester,
    ) async {
      final repository = MockITaskRepository();

      final completedTasks = List.generate(
        20,
        (index) => Task(
          id: index + 1,
          title: '完了済みタスク ${index + 1}',
          isCompleted: true,
        ),
      ).reversed.toList();
      final uncompletedTasks = List.generate(
        20,
        (index) => Task(
          id: index + 21,
          title: '未完了タスク ${index + 1}',
          isCompleted: false,
        ),
      ).reversed.toList();
      when(
        repository.fetchTasks(page: 1, sortOption: TaskSortOption.latest),
      ).thenReturn((uncompletedTasks, true));
      when(
        repository.fetchTasks(page: 2, sortOption: TaskSortOption.latest),
      ).thenReturn((completedTasks, false));

      await tester.pumpWidget(buildApp(repository));

      await tester.tap(find.text('完了'));
      await tester.pump();

      // 完了タブに遷移した際、最初のページ(20件)では完了タスクが見つからないため、次のページを取得する。
      // 取得の間、ローディングインジケーターが表示される
      verify(
        repository.fetchTasks(page: 2, sortOption: TaskSortOption.latest),
      ).called(1);
      expect(find.byType(CircularProgressIndicator), findsOneWidget);

      await tester.pump();

      final completedTaskFinder = find.text(completedTasks[0].title);
      expect(completedTaskFinder, findsOneWidget);
    });

    testWidgets('完了のフィルタが有効になった時、最後のページまで取得しても完了タスクが見つからない場合、完了タスクがない旨が表示される', (
      WidgetTester tester,
    ) async {
      final repository = MockITaskRepository();

      final uncompletedTasks = List.generate(
        20,
        (index) => Task(
          id: index + 1,
          title: '未完了タスク ${index + 1}',
          isCompleted: false,
        ),
      ).reversed.toList();
      final uncompletedTasks2 = List.generate(
        20,
        (index) => Task(
          id: index + 21,
          title: '未完了タスク ${index + 21}',
          isCompleted: false,
        ),
      ).reversed.toList();
      when(
        repository.fetchTasks(page: 1, sortOption: TaskSortOption.latest),
      ).thenReturn((uncompletedTasks2, true));
      when(
        repository.fetchTasks(page: 2, sortOption: TaskSortOption.latest),
      ).thenReturn((uncompletedTasks, false));

      await tester.pumpWidget(buildApp(repository));

      await tester.tap(find.text('完了'));
      await tester.pump();

      // 完了タブに遷移した際、最初のページ(20件)では完了タスクが見つからないため、次のページを取得する。
      // 取得の間、ローディングインジケーターが表示される
      verify(
        repository.fetchTasks(page: 2, sortOption: TaskSortOption.latest),
      ).called(1);
      expect(find.byType(CircularProgressIndicator), findsOneWidget);

      await tester.pump();

      final emptyViewFinder = find.text('完了したタスクはありません');
      expect(emptyViewFinder, findsOneWidget);
    });
  });
}
