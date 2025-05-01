



import '../../../core/app_export.dart';
import '../../../data/data_source/local/nav_item_list_data.dart';
import '../../../data/models/local_response/nav_item_model.dart';
import '../../customer/views/customer_screen.dart';
import '../../order/views/order_screen.dart';

class RootController extends GetxController{
  final RxBool isFullDrawerVisible = false.obs;
  RxInt selectedModuleIndex =0.obs;
  List<NavItemModel> navItems = navItemsData;

  final List<Widget> modules = const [
    CustomerScreen(),
    OrderScreen(),
    CustomerScreen(),
    CustomerScreen(),
    CustomerScreen(),
    CustomerScreen(),
    CustomerScreen(),
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

}