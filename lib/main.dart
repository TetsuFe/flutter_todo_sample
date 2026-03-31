import 'package:flutter/material.dart';
import 'package:flutter_todo_sample/views/screens/home_screen.dart';
import 'package:flutter_todo_sample/views/theme/app_theme.dart';
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
      title: 'Flutter Todo Sample',
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.system,
      home: const HomeScreen(title: 'TODOリスト'),
    );
  }
}
