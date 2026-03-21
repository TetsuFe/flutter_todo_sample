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
  });
}
