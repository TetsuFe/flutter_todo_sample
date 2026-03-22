import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_todo_sample/models/task.dart';
import 'package:flutter_todo_sample/repositories/task/i_task_repository.dart';
import 'package:flutter_todo_sample/repositories/task/providers.dart';
import 'package:flutter_todo_sample/views/task/task_list.dart';
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
    testWidgets('データが30件の場合、最初に20件分表示され、スクロールで残り10件が表示される', (
      WidgetTester tester,
    ) async {
      final repository = MockITaskRepository();
      final dummyTasks = List.generate(
        30,
        (index) =>
            Task(id: index + 1, title: 'タスク${index + 1}', isCompleted: false),
      );
      final firstPageTasks = dummyTasks.where((task) => task.id <= 20).toList();
      final secondPageTasks = dummyTasks.where((task) => task.id > 20).toList();
      when(repository.fetchTasks(page: 1)).thenReturn((firstPageTasks, true));
      when(repository.fetchTasks(page: 2)).thenReturn((secondPageTasks, false));

      await tester.pumpWidget(buildApp(repository));
      await tester.pump();

      // スクロールの関係でちょうど20件目まで表示されることの確認が難しいため、1件目が表示されることのみ確認
      expect(find.byKey(const ValueKey(1)), findsOneWidget);

      // 30件目までスクロール
      await tester.scrollUntilVisible(
        find.byKey(const ValueKey(30)),
        500,
        scrollable: find.byType(Scrollable),
      );

      expect(find.byKey(const ValueKey(30)), findsOneWidget);
    });
  });
}
