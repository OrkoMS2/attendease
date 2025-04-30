import '../../../core/app_export.dart';
import '../../../routes/app_routes.dart';
import '../../../theme/controller/theme_controller.dart';

class SplashController extends GetxController {
  final ThemeController _themeController = Get.find();

  @override
  void onReady() {
    super.onReady();
    _initialize();
  }

  Future<void> _initialize() async {
    final locale = await _themeController.getLocale();
    Get.updateLocale(locale);

    await Future.delayed(const Duration(milliseconds: 100));
    Get.offAllNamed(AppRouteNames.customerRoute);
  }
}
