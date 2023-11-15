part of 'core.dart';

class AppTheme {
  // Light theme
  static ThemeData light() {
    final baseTheme = ThemeData(
      brightness: Brightness.light,
      useMaterial3: true,
      colorSchemeSeed: AppColors.light().primary,
      scaffoldBackgroundColor: AppColors.light().background,
    );

    return baseTheme.copyWith(
      textTheme: GoogleFonts.beVietnamProTextTheme(baseTheme.textTheme),
    );
  }

  // Dark theme
  static ThemeData dark() {
    final baseTheme = ThemeData(
      brightness: Brightness.dark,
      useMaterial3: true,
      colorSchemeSeed: AppColors.light().primary,
      scaffoldBackgroundColor: AppColors.light().background,
    );

    return baseTheme.copyWith(
      textTheme: GoogleFonts.beVietnamProTextTheme(baseTheme.textTheme),
    );
  }

  final AppThemeMode themeMode;

  const AppTheme(this.themeMode);

  AppColors get colors {
    switch (themeMode) {
      case AppThemeMode.light:
        return AppColors.light();
      case AppThemeMode.dark:
        return AppColors.light();
    }
  }
}
