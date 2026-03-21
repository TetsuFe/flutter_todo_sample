import 'package:flutter_todo_sample/repositories/in_memory_task_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  tearDown(() {
    InMemoryTaskRepository.reset();
  });

  group('InMemoryTaskRepository', () {
    test('タスクを2つ作成した時、IDが1から始まる連番で割り当てられ、インメモリに保存される', () {
      final repository = InMemoryTaskRepository();
      final firstTask = repository.createTask('First Task');
      final secondTask = repository.createTask('Second Task');

      expect(firstTask.id, 1);
      expect(secondTask.id, 2);
      expect(repository.tasks[0].id, 1);
      expect(repository.tasks[1].id, 2);
    });

    test('空のタイトルでタスクを作成しようとすると、ArgumentErrorがスローされる', () {
      final repository = InMemoryTaskRepository();

      expect(() => repository.createTask(''), throwsArgumentError);
    });

    test('複数のタスクを一度に作成できる', () {
      final repository = InMemoryTaskRepository();
      final titles = ['Task 1', 'Task 2', 'Task 3'];
      final tasks = repository.createTasks(titles);

      expect(tasks[0].title, 'Task 1');
      expect(tasks[1].title, 'Task 2');
      expect(tasks[2].title, 'Task 3');
      expect(repository.tasks.length, 3);
    });

    test('開始IDと最大取得件数を指定して、idの昇順に並んだタスクを一覧取得できる', () {
      final repository = InMemoryTaskRepository();
      for (int i = 1; i <= 30; i++) {
        repository.createTask('Task $i');
      }

      final (firstPageTasks, _) = repository.fetchTasks(page: 1, perPage: 20);
      final (secondPageTasks, _) = repository.fetchTasks(page: 2, perPage: 20);

      expect(firstPageTasks.length, 20);
      expect(secondPageTasks.length, 10);
      expect(firstPageTasks.first.id, 1);
      expect(firstPageTasks.last.id, 20);
      expect(secondPageTasks.first.id, 21);
      expect(secondPageTasks.last.id, 30);
    });
  });
}
