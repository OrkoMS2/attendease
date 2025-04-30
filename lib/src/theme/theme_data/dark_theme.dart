

import '../../core/app_export.dart';
import 'theme.dart';

ThemeData darkThemeData() {
  return  ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColor.blackPitch,
    primaryColor: AppColor.primary,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColor.blackShade,
      elevation: 0,
      iconTheme: const IconThemeData(color: AppColor.textWhite),
      titleTextStyle: GoogleFonts.montserrat(
        color: AppColor.textWhite,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
    ),
    textTheme: ThemeX.buildTextTheme(Brightness.dark),
    inputDecorationTheme: ThemeX.inputDecorationTheme(AppColor.blackShade),
    iconTheme: const IconThemeData(color: AppColor.textWhite),
    dividerColor: AppColor.grey,
    colorScheme: const ColorScheme.dark().copyWith(
      primary: AppColor.primary,
      secondary: AppColor.secondary,
    ),
  );
}
