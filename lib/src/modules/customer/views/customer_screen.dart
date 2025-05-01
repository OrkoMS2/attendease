import 'package:attendease/src/modules/customer/views/widgets/guest_list_widget.dart';

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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Obx(() {
                      return controller.isGuestListVisible.value?SizedBox.shrink():
                      GestureDetector(
                        onTap: controller.showGuestList,
                        child: Container(
                          color: AppColor.offWhite,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              AppSpaces.horizontalSectionSpaceXXS,
                              Icon(Icons.arrow_back_ios_rounded,
                                size: 17.sp,),
                              Text("guest_book_lbl".tr,
                                style: AppTextStyle.largeCaption,),
                            ],
                          ),
                        ),
                      );
                    })
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}



