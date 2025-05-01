import 'package:attendease/src/modules/customer/views/guest_details/guest_details_widget.dart';
import 'package:attendease/src/modules/customer/views/guest_list/guest_list_widget.dart';

import '../../../core/app_export.dart';
import '../controllers/customer_controller.dart';

class CustomerScreen extends GetView<CustomerController> {
  const CustomerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Row(
        children: [
          Obx(() =>
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                width: controller.isGuestListVisible.value ? 388.w : 0,
                child: controller.isGuestListVisible.value
                    ? const GuestListWidget()
                    : const SizedBox.shrink(),
              )),
          Expanded(
            child: GestureDetector(
              onTap: controller.hideGuestList,
              child: Container(
                color: AppColor.offWhite,
                child: GuestDetailsWidget()
              ),
            ),
          ),
        ],
      ),
    );
  }
}



