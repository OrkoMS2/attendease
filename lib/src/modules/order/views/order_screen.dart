

import 'package:attendease/src/core/app_export.dart';
import 'package:attendease/src/modules/order/controllers/order_controller.dart';

class OrderScreen extends GetView<OrderController>{
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Order View", style: AppTextStyle.title,)
      ],
    );
  }
}