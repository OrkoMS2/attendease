import 'dart:io';

import "../../../core/app_export.dart";
import 'package:hive_flutter/hive_flutter.dart';
import '../../../theme/controller/theme_controller.dart';


class SplashController extends GetxController {
  final ThemeController _themeController = Get.find();



  Future getLocaleData()async{
    Locale locale=await _themeController.getLocale();
    Get.updateLocale( locale);
  }

  @override
  void onReady() {
    super.onReady();
    getLocaleData().then((value){
      Future.delayed(const Duration(milliseconds: 1500), () {
      });
    });

  }

}
