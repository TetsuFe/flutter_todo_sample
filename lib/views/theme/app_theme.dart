import 'package:flutter/material.dart';
import 'package:flutter_todo_sample/views/theme/app_colors.dart';

class AppTheme {
  AppTheme._();
  static ThemeData get light => ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.light.brandColor,
      brightness: Brightness.light,
    ),
    extensions: [AppColors.light],
  );

  static ThemeData get dark => ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.dark.brandColor,
      brightness: Brightness.dark,
    ),
    extensions: [AppColors.dark],
  );
}
