import 'package:flutter/material.dart';
import 'package:flutter_todo_sample/views/theme/app_colors.dart';

extension ThemeDataExtension on ThemeData {
  AppColors get appColors => extension<AppColors>()!;
}
