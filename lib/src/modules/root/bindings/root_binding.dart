

import 'package:attendease/src/modules/customer/bindings/customer_binding.dart';
import 'package:get/get.dart';

import '../../customer/controllers/customer_controller.dart';
import '../../order/controllers/order_controller.dart';
import '../controllers/root_controller.dart';

class RootBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RootController());
    Get.lazyPut(() => CustomerController());
    Get.lazyPut(() => OrderController());

  }
}
