

import 'package:get/get.dart';

class CustomerController extends GetxController {
  final RxBool isGuestListVisible = true.obs;
  final RxBool isFullDrawerVisible = false.obs;

  void toggleGuestList() => isGuestListVisible.toggle();
  void hideGuestList() => isGuestListVisible.value = false;
  void showGuestList() => isGuestListVisible.value = true;
}