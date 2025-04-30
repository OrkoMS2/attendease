import 'package:attendease/src/core/app_export.dart';
import 'package:attendease/src/modules/splash/bindings/splash_binding.dart';
import 'package:attendease/src/routes/app_pages.dart';
import 'package:flutter/services.dart';
import 'src/localization/app_localization.dart';
import 'src/theme/controller/theme_controller.dart';
import 'src/theme/theme_data/theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initialize();
}

Future<void> initialize() async {
  await Hive.initFlutter();
  await Hive.openBox(AppSharedKey.settings);
  final themeController = Get.put(ThemeController());
  final Locale locale = await themeController.getLocale();
  SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeRight])
      .then((_) =>
      runApp(AttendEase(
          themeController: themeController,
          locale: locale)
      )
  );
}


class AttendEase extends StatelessWidget {
  final ThemeController themeController;
  final Locale locale;

  const AttendEase({
    super.key,
    required this.themeController,
    required this.locale,
  });

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(1440, 1024),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'app_name'.tr,
          theme: ThemeX.lightTheme,
          darkTheme: ThemeX.darkTheme,
          themeMode: themeController.themeStateFromHiveSettingBox,
          initialRoute: AppRoutePages.initial,
          getPages: AppRoutePages.routes,
          locale: locale,
          fallbackLocale: const Locale('en', 'US'),
          translations: AppLocalization(),
        );
      },
    );
  }
}
