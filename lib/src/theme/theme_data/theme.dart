

import 'dark_theme.dart';
import 'light_theme.dart';
import 'package:attendease/src/core/app_export.dart';

class ThemeX {
  static final lightTheme = lightThemeData();
  static final darkTheme = darkThemeData();

  static TextTheme buildTextTheme(Brightness brightness) {
    final isDark = brightness == Brightness.dark;
    final baseColor = isDark ? AppColor.textWhite : AppColor.black;

    return GoogleFonts.poppinsTextTheme().copyWith(
      headlineLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: baseColor),
      headlineMedium: TextStyle(fontSize: 24, fontWeight: FontWeight.w600, color: baseColor),
      titleLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: baseColor),
      bodyLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: baseColor),
      bodyMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: baseColor),
      labelLarge: TextStyle(fontSize: 12, color: isDark ? AppColor.grey : AppColor.paragraphBody),
    );
  }
  static InputDecorationTheme inputDecorationTheme(Color fillColor) {
    return InputDecorationTheme(
      filled: true,
      fillColor: fillColor,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColor.borderGrey),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColor.borderGrey),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColor.primary, width: 2),
      ),
      hintStyle: TextStyle(color: AppColor.lightText),
    );
  }
}

