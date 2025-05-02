



import 'package:attendease/src/modules/about/views/about_screen.dart';
import 'package:attendease/src/modules/os/views/os_screen.dart';
import 'package:attendease/src/modules/statistic/views/statistic_screen.dart';
import 'package:attendease/src/modules/table/views/table_screen.dart';
import 'package:attendease/src/modules/ticket/views/ticket_screen.dart';
import 'package:flutter/cupertino.dart';

import '../../../core/app_export.dart';
import '../../../data/data_source/local/nav_item_list_data.dart';
import '../../../data/models/local_response/nav_item_model.dart';
import '../../customer/views/customer_screen.dart';
import '../../order/views/order_screen.dart';

class RootController extends GetxController{
  final RxBool isFullDrawerVisible = false.obs;
  RxInt selectedModuleIndex =0.obs;
  List<NavItemModel> navItems = navItemsData;

  final List<Widget> modules =  [
    const CustomerScreen(),
    const OrderScreen(),
    const TableScreen(),
    const TicketScreen(),
    const OsScreen(),
    const StatisticScreen(),
    const AboutScreen(),
  ];

  void toggleMenu()async{
    await Future.delayed(const Duration(milliseconds: 300));
    isFullDrawerVisible.toggle();
  }
  void hideFullDrawer() => isFullDrawerVisible.value = false;
  void showFullDrawer() => isFullDrawerVisible.value = true;

  void updateSelectedIndex(int index){
    selectedModuleIndex.value=index;
    hideFullDrawer();
  }

  String getCurrentFormattedTime() {
    final now = DateTime.now();
    final hour = now.hour % 12 == 0 ? 12 : now.hour % 12;
    final minute = now.minute.toString().padLeft(2, '0');
    final period = now.hour >= 12 ? 'PM' : 'AM';
    return '${hour.toString().padLeft(2, '0')} : $minute $period';
  }

}