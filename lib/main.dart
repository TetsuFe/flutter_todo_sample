import 'package:flutter/material.dart';
import 'package:flutter_todo_sample/route/app_route.dart';
import 'package:flutter_todo_sample/views/theme/app_theme.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  runApp(ProviderScope(child: MyApp(), retry: (_, _) => null));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _router = AppRouter();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Todo Sample',
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.system,
      routerConfig: _router.config(),
    );
  }
}
