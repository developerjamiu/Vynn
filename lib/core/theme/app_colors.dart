part of 'app_theme.dart';

abstract class AppColors extends ThemeExtension<AppColors> {
  Color get eggShell;
  Color get peach;
  Color get tangerine;
  Color get rust;
  Color get brown;
}

class _AppColorsLight extends AppColors {
  @override
  Color get eggShell => ColorsLight.eggShell;

  @override
  Color get peach => ColorsLight.peach;

  @override
  Color get tangerine => ColorsLight.tangerine;

  @override
  Color get rust => ColorsLight.rust;

  @override
  Color get brown => ColorsLight.brown;

  @override
  ThemeExtension<AppColors> copyWith() => this;

  @override
  ThemeExtension<AppColors> lerp(
    covariant ThemeExtension<AppColors>? other,
    double t,
  ) =>
      this;
}

@visibleForTesting
class ColorsLight {
  static Color eggShell = const Color(0xFFFFF5EF);

  static Color peach = const Color(0xFFFDC0A0);

  static Color tangerine = const Color(0xFFF35806);

  static Color rust = const Color(0xFFA33B04);

  static Color brown = const Color(0xFF541E02);
}

extension AppColorsX on BuildContext {
  AppColors get colors =>
      Theme.of(this).extension<AppColors>() ?? _AppColorsLight();
}
