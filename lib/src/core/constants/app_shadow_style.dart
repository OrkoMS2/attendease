

import "../app_export.dart";

class AppShadow{
  static List<BoxShadow> appShadowX=[
    BoxShadow(
      color: AppColor.grey.withOpacity(0.10),
      spreadRadius: 5.r,
      blurRadius: 16.r,
      offset: const Offset(0, 1),
    )
  ];
  static List<BoxShadow> topAppBarBarShadow = [
    BoxShadow(
      color: AppColor.blackPitch,
      spreadRadius: 0.r,
      blurRadius: 10.r,
      offset: const Offset(0, 2),
    ),
  ];
  static List<BoxShadow> softShadow = [
    BoxShadow(
      color: AppColor.black.withOpacity(0.05),
      spreadRadius: 2.r,
      blurRadius: 10.r,
      offset: const Offset(0, 4),
    ),
  ];
}