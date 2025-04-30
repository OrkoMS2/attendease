import "../app_export.dart";


import 'dart:io';
import 'package:google_fonts/google_fonts.dart';


class SnackBarX{
  static showError({
    required String title,
    required String message,
    Color? backgroundColor,
    Color? textColor,
  }) {
    Get.closeCurrentSnackbar();
    Get.snackbar(
      title.tr,
      message.tr,
      duration: const Duration(milliseconds: 1800),
      backgroundColor: backgroundColor ?? const Color(0xFFFDE6D1),
      colorText: textColor ?? AppColor.title,
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      snackPosition: Platform.isIOS ? SnackPosition.TOP : SnackPosition.BOTTOM,
      titleText: Text(
        title.tr,
        style: TextStyle(
          fontFamily: GoogleFonts.inter().fontFamily,
          color: Colors.red,
          fontWeight: FontWeight.w800,
          fontSize: 18
        ),
      ),
      messageText:  Text(
        message.tr,
        style: TextStyle(
          fontFamily: GoogleFonts.inter().fontFamily,
          color:AppColor.title,
          fontSize: 14
        ),
      ),
    );
  }


  static showWarning({required String title,required String message,Color? backgroundColor,Color? textColor}){
    Get.closeCurrentSnackbar();
    Get.snackbar(title.tr, message.tr,
        backgroundColor:backgroundColor?? const Color(0xFFF5F5F5),
        colorText:textColor?? AppColor.subtitle,
        icon: const Icon(Icons.warning_rounded,color: Color(0xFFE0680C),),
        shouldIconPulse: true,
        margin: const EdgeInsets.symmetric(horizontal: 8,vertical: 8),
        snackPosition: Platform.isIOS?SnackPosition.TOP:SnackPosition.BOTTOM,
        duration: const Duration(milliseconds: 1800),
      titleText: Text(
        title.tr,
        style: TextStyle(
            fontFamily: GoogleFonts.inter().fontFamily,
            color: AppColor.subtitle,
            fontWeight: FontWeight.w800,
            fontSize: 18
        ),
      ),
      messageText:  Text(
        message.tr,
        style: TextStyle(
            fontFamily: GoogleFonts.inter().fontFamily,
            color:AppColor.subtitle,
            fontSize: 14
        ),
      ),
    );
  }
  static showSuccess({required String title,required String message,Color? backgroundColor,Color? textColor}){
    Get.closeCurrentSnackbar();
    Get.snackbar(title.tr, message.tr,
        backgroundColor:backgroundColor?? const Color(0xFFE0FBD3),
        colorText:textColor?? AppColor.title,
        // icon: const Icon(Icons.check,color: AppColor.gradientPrimary,),
        margin: const EdgeInsets.symmetric(horizontal: 8,vertical: 8),
        snackPosition: Platform.isIOS?SnackPosition.TOP:SnackPosition.BOTTOM,
        duration: const Duration(milliseconds: 1200),
      titleText: Text(
        title.tr,
        style: TextStyle(
            fontFamily: GoogleFonts.inter().fontFamily,
            color: AppColor.title,
            fontWeight: FontWeight.w800,
            fontSize: 18
        ),
      ),
      messageText:  Text(
        message.tr,
        style: TextStyle(
            fontFamily: GoogleFonts.inter().fontFamily,
            color:AppColor.title,
            fontSize: 14
        ),
      ),
    );
  }
  static showMessage({required String title,required String message,Color? backgroundColor,Color? textColor}){
    Get.closeCurrentSnackbar();
    Get.snackbar(title.tr, message.tr,
        colorText:textColor?? AppColor.black,
        margin: const EdgeInsets.symmetric(horizontal: 8,vertical: 8),
        snackPosition: Platform.isIOS?SnackPosition.TOP:SnackPosition.BOTTOM,
    );
  }
  static showActionMessage({required String title,required String message,required Function() action,Color? backgroundColor,Color? textColor}){
    Get.closeCurrentSnackbar();
    Get.snackbar(title.tr, message.tr,
        backgroundColor:backgroundColor?? AppColor.black.withOpacity(0.8),
        colorText:textColor?? AppColor.white,
        margin: const EdgeInsets.symmetric(horizontal: 8,vertical: 8),
        snackPosition: Platform.isIOS?SnackPosition.TOP:SnackPosition.BOTTOM,
        mainButton: TextButton(
            onPressed:action,
            child: const Text(
          "UNDO",
          style: TextStyle(
            decoration: TextDecoration.none,
            color: Colors.amber,
          ),
        )),
        duration: const Duration(milliseconds: 4500)
    );
  }
  static featureUnderDev({Color? backgroundColor,Color? textColor}){
    Get.closeCurrentSnackbar();
    Get.snackbar("Feature Under Development".tr, "This feature is under development Please contact the dev team for further information.".tr,
      colorText:textColor?? AppColor.black,
      margin: const EdgeInsets.symmetric(horizontal: 8,vertical: 8),
      snackPosition: Platform.isIOS?SnackPosition.TOP:SnackPosition.BOTTOM,
    );
  }
}

class SnackBarXMessages{
  static featureUnderDev({Color? backgroundColor,Color? textColor}){
    Get.closeCurrentSnackbar();
    Get.snackbar("Feature Under Development".tr, "This feature is under development. Please contact the dev team for further information.".tr,
      colorText:textColor?? AppColor.black,
      margin: const EdgeInsets.symmetric(horizontal: 8,vertical: 8),
      snackPosition: Platform.isIOS?SnackPosition.TOP:SnackPosition.BOTTOM,
    );
  }
}