import '../../core/app_export.dart';

class ThemeController extends GetxController {
  late bool isDarkTheme;

  final Box<dynamic> settingsHiveBox = Hive.box(AppSharedKey.settings);

  static const String _keyIsDarkMode = 'isDarkMode';
  static const String _keyCurrentLocale = 'currentLocal';

  ThemeMode get themeStateFromHiveSettingBox =>
      getThemeFromHiveBox() ? ThemeMode.dark : ThemeMode.light;

  @override
  void onInit() {
    isDarkTheme = getThemeFromHiveBox();
    super.onInit();
  }

  bool getThemeFromHiveBox() {
    return settingsHiveBox.get(_keyIsDarkMode, defaultValue: Get.isDarkMode);
  }

  void _updateHiveThemeSetting(bool value) {
    settingsHiveBox.put(_keyIsDarkMode, value);
  }

  void changeTheme({
    required RxBool isDarkMode,
    required RxString modeName,
  }) {
    final bool switchToDark = !Get.isDarkMode;

    modeName.value = switchToDark ? 'dark' : 'light';
    isDarkMode.value = switchToDark;
    isDarkTheme = switchToDark;

    _updateHiveThemeSetting(switchToDark);
    _changeThemeMode(switchToDark ? ThemeMode.dark : ThemeMode.light);
  }

  void _changeThemeMode(ThemeMode themeMode) {
    Get.changeThemeMode(themeMode);
  }

  Future<void> setLocale(Locale locale) async {
    final String formatted = "${locale.languageCode}_${locale.countryCode}";
    await settingsHiveBox.put(_keyCurrentLocale, formatted);
  }

  Future<Locale> getLocale() async {
    final String languageCode = settingsHiveBox.get(_keyCurrentLocale, defaultValue: "en_US");
    final parts = languageCode.split("_");
    return Locale(parts[0], parts[1]);
  }
}
