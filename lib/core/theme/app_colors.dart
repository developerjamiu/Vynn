part of 'app_theme.dart';

abstract class AppColors extends ThemeExtension<AppColors> {
  Color get black;
  Color get white;
  Color get primary;
  Color get eggShell;
  Color get peach;
  Color get tangerine;
  Color get main200;
  Color get rust;
  Color get brown;
  Color get red;
  MaterialColor get grey;
}

class _AppColorsLight extends AppColors {
  @override
  Color get black => ColorsLight.black;

  @override
  Color get white => ColorsLight.white;

  @override
  Color get primary => ColorsLight.primary;

  @override
  Color get eggShell => ColorsLight.eggShell;

  @override
  Color get peach => ColorsLight.peach;

  @override
  Color get tangerine => ColorsLight.tangerine;

  @override
  Color get main200 => ColorsLight.main200;

  @override
  Color get rust => ColorsLight.rust;

  @override
  Color get brown => ColorsLight.brown;

  @override
  Color get red => ColorsLight.red;

  @override
  MaterialColor get grey => ColorsLight.grey;

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
  static Color black = const Color(0xFF000000);

  static Color white = const Color(0xFFFFFFFF);

  static Color primary = const Color(0xFF042B53);

  static Color eggShell = const Color(0xFFFFF5EF);

  static Color peach = const Color(0xFFFDC0A0);

  static Color tangerine = const Color(0xFFF35806);

  static Color main200 = const Color(0xFFF3BF08);

  static Color rust = const Color(0xFFA33B04);

  static Color brown = const Color(0xFF541E02);

  static Color red = const Color(0xFFFF3B30);

  static MaterialColor grey = const MaterialColor(
    0xFFADACB5,
    {
      100: Color(0xFFF9F9FB),
      200: Color(0xFFF4F3F6),
      300: Color(0xFFDFDFE4),
      400: Color(0xFFADACB5),
      500: Color(0xFF888897),
      600: Color(0xFF6C6B81),
      700: Color(0xFF48485C),
      800: Color(0xFF2B2B3B),
    },
  );
}

extension AppColorsX on BuildContext {
  AppColors get colors => Theme.of(this).extension<AppColors>() ?? _AppColorsLight();
}
