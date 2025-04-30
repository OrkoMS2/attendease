
import '../../core/app_export.dart';
import 'theme.dart';


ThemeData lightThemeData() {
  return ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColor.white,
    primaryColor: AppColor.primary,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColor.white,
      elevation: 0,
      iconTheme: const IconThemeData(color: AppColor.black),
      titleTextStyle: GoogleFonts.poppins(
        color: AppColor.black,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
    ),
    textTheme: ThemeX.buildTextTheme(Brightness.light),
    inputDecorationTheme:ThemeX.inputDecorationTheme(AppColor.textFieldBackground),
    iconTheme: const IconThemeData(color: AppColor.black),
    dividerColor: AppColor.borderGrey,
    colorScheme: const ColorScheme.light().copyWith(
      primary: AppColor.primary,
      secondary: AppColor.secondary,
    ),
  );
}
