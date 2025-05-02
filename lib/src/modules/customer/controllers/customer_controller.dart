

import 'package:attendease/src/core/app_export.dart';
import '../../../data/data_source/local/guest_list_data.dart';
import '../../../data/models/local_response/guest_item_model.dart';

class CustomerController extends GetxController {
  final RxBool isGuestListVisible = true.obs;
  final List<GuestItemModel> guestLists = guestListData;
  TextEditingController searchTextController = TextEditingController();
  RxInt selectedGuestIndex = 0.obs;
  var selectedIndex = 0.obs;

  final List<String> tabs = [
    'profile_tab_lbl',
    'reservation_tab_lbl',
    'payment_tab_lbl',
    'feedback_tab_lbl',
    'order_history_tab_lbl',
  ];
  final List<Map<String, String>> noteItems = const [
    {"icon": AppIcon.generalIcon, "title": "general_note_lbl"},
    {"icon": AppIcon.spRelationIcon, "title": "sp_relation_note_lbl"},
    {"icon": AppIcon.seatingIcon, "title": "seating_note_lbl"},
    {"icon": AppIcon.spNoteIcon, "title": "sp_note_lbl"},
    {"icon": AppIcon.allergiesIcon, "title": "allergies_note_lbl"},
  ];
  void selectTab(int index) {
    selectedIndex.value = index;
  }


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