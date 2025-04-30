import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'src/modules/splash/bindings/splash_binding.dart';
import 'src/routes/app_pages.dart';
import 'src/theme/theme_data/theme.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(1080, 1920), // You can adjust based on your base tablet design
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => GetMaterialApp(
        title: 'Guest Management',
        debugShowCheckedModeBanner: false,
        theme: ThemeX.lightTheme,
        darkTheme: ThemeX.darkTheme,
        themeMode: ThemeMode.system,
        initialBinding: SplashBinding(),
        initialRoute: AppRoutePages.initial,
        getPages: AppRoutePages.routes,
      ),
    );
  }
}
