
import 'package:attendease/src/modules/customer/bindings/customer_binding.dart';
import 'package:attendease/src/modules/customer/views/customer_screen.dart';
import 'package:get/get.dart';
import '../modules/root/bindings/root_binding.dart';
import '../modules/root/views/root_screen.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_screen.dart';
import 'app_routes.dart';


class AppRoutePages  {

  AppRoutePages._();

  static const initial = AppRouteNames.initialRoute;

  static final routes = [
    GetPage(
      name: AppRouteNames.initialRoute,
      page: () => const SplashScreen(),
      bindings: [
        SplashBinding(),
      ],
    ),
    GetPage(
      name: AppRouteNames.rootRoute,
      page: () => const RootScreen(),
      bindings: [
        RootBinding(),
      ],
    ),

  ];
}
