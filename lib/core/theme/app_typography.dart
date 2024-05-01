part of 'app_theme.dart';

class _Typography extends TextTheme {
  const _Typography._({
    required super.displayLarge,
    required super.displayMedium,
    required super.displaySmall,
    required super.headlineMedium,
    required super.headlineSmall,
    required super.titleLarge,
    required super.titleMedium,
    required super.titleSmall,
    required super.labelLarge,
    required super.labelSmall,
    required super.bodyLarge,
    required super.bodyMedium,
    required super.bodySmall,
  });

  factory _Typography.light() => const _Typography._(
        displayLarge: TextStyle(
          fontSize: 96,
          fontWeight: FontWeight.w300,
        ),
        displayMedium: TextStyle(
          fontSize: 60,
          fontWeight: FontWeight.w600,
        ),
        displaySmall: TextStyle(
          fontSize: 48,
          fontWeight: FontWeight.w400,
        ),
        headlineMedium: TextStyle(
          fontSize: 34,
          fontWeight: FontWeight.w400,
        ),
        headlineSmall: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w700,
        ),
        titleLarge: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
        titleMedium: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
        titleSmall: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
        bodyLarge: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w400,
        ),
        bodyMedium: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
        labelLarge: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
        bodySmall: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
        ),
        labelSmall: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      );
}

extension TypographyX on BuildContext {
  TextTheme get textTheme => GoogleFonts.montserratTextTheme(
        Theme.of(this).textTheme,
      );
}
