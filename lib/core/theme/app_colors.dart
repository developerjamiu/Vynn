part of 'app_theme.dart';

abstract class AppColors extends ThemeExtension<AppColors> {
  Color get main100;
  Color get main110;
  Color get main200;
  Color get main300;
  Color get main310;
  Color get main320;
  Color get danger100;
  Color get danger110;
  Color get success100;
  Color get success110;
  Color get black;
  Color get white;
  MaterialColor get grey;
}

class _AppColorsLight extends AppColors {
  @override
  Color get main100 => ColorsLight.main100;

  @override
  Color get main110 => ColorsLight.main110;

  @override
  Color get main200 => ColorsLight.main200;

  @override
  Color get main300 => ColorsLight.main300;

  @override
  Color get main310 => ColorsLight.main310;

  @override
  Color get main320 => ColorsLight.main320;

  @override
  Color get danger100 => ColorsLight.danger100;

  @override
  Color get danger110 => ColorsLight.danger110;

  @override
  Color get success100 => ColorsLight.success100;

  @override
  Color get success110 => ColorsLight.success110;

  @override
  Color get black => ColorsLight.black;

  @override
  Color get white => ColorsLight.white;

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

class ColorsLight {
  static const Color main100 = Color(0xFFE5631A);

  static const Color main110 = Color(0xFFFFF5EF);

  static const Color main200 = Color(0xFFF3BF08);

  static const Color main300 = Color(0xFF042B53);

  static const Color main310 = Color(0xFF193A62);

  static const Color main320 = Color(0xFF688098);

  static const Color danger100 = Color(0xFFFFE0E0);

  static const Color danger110 = Color(0xFFB92C2C);

  static const Color success100 = Color(0xFFE5FFE0);

  static const Color success110 = Color(0xFF49B423);

  static const Color black = Color(0xFF000000);

  static const Color white = Color(0xFFFFFFFF);

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
  AppColors get colors =>
      Theme.of(this).extension<AppColors>() ?? _AppColorsLight();
}
