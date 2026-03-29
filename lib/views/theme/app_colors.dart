import 'package:flutter/material.dart';

@immutable
class AppColors extends ThemeExtension<AppColors> {
  const AppColors({required this.brandColor});
  final Color brandColor;

  @override
  AppColors copyWith({Color? brandColor}) {
    return AppColors(brandColor: brandColor ?? this.brandColor);
  }

  @override
  AppColors lerp(ThemeExtension<AppColors>? other, double t) {
    if (other is! AppColors) {
      return this;
    }
    return AppColors(brandColor: Color.lerp(brandColor, other.brandColor, t)!);
  }

  static const light = AppColors(brandColor: Colors.deepPurple);
  static const dark = AppColors(brandColor: Colors.purple);
}
