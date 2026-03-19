import 'package:flutter_todo_sample/repositories/in_memory_task_repository.dart';
import 'package:test/test.dart';

void main() {
  test('タスクを2つ作成した時、IDが1から始まる連番で割り当てられる', () {
    final repository = InMemoryTaskRepository();
    final firstTask = repository.createTask('First Task');
    final secondTask = repository.createTask('Second Task');
    expect(firstTask!.id, 1);
    expect(secondTask!.id, 2);
  });
}
