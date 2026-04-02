import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todo_sample/views/task/components/create_task_modal.dart';
import 'package:flutter_todo_sample/views/task/components/task_list.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Flutter TODO Sample'),
      ),
      body: const TaskList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showCreateTaskModal(context),
        tooltip: 'Create Task',
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showCreateTaskModal(BuildContext context) async {
    await showDialog<String>(
      context: context,
      barrierDismissible: false,
      builder: (context) => const CreateTaskModal(),
    );
  }
}
