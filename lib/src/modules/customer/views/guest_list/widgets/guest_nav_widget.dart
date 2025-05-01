

import '../../../../../core/app_export.dart';
import '../../../controllers/customer_controller.dart';

class GuestNavWidget extends GetView<CustomerController>{
  const GuestNavWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: controller.showGuestList,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
                flex: 1,
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Icon(Icons.arrow_back_ios_rounded, size: 17.sp))),
            Expanded(
              flex: 11,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "setting_lbl".tr,
                  textAlign: TextAlign.start,
                  style: AppTextStyle.largeCaption,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        )
    );
  }

}