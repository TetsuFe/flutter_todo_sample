import 'package:flutter/material.dart';
import 'package:flutter_todo_sample/views/task/create_task_modal.dart';
import 'package:flutter_todo_sample/views/task/task_list.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  runApp(ProviderScope(child: const MyApp(), retry: (_, _) => null));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Todo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: const MyHomePage(title: 'ホーム'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
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
