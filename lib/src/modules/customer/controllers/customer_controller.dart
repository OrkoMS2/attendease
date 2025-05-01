

import 'package:attendease/src/core/app_export.dart';
import 'package:get/get.dart';

import '../../../data/data_source/local/guest_list_data.dart';
import '../../../data/models/local_response/guest_item_model.dart';

class CustomerController extends GetxController {
  final RxBool isGuestListVisible = true.obs;
  final List<GuestItemModel> guestLists = guestListData;
  TextEditingController searchTextController = TextEditingController();
  RxInt selectedGuestIndex = 0.obs;
  void toggleGuestList() async{
    await Future.delayed(const Duration(milliseconds: 300));
    isGuestListVisible.toggle();
  }
  void hideGuestList() => isGuestListVisible.value = false;
  void showGuestList() => isGuestListVisible.value = true;

  String getInitials(String name) {
    final parts = name.trim().split(' ');
    if (parts.length == 1) return parts[0][0];
    return parts[0][0] + parts[1][0];
  }
}