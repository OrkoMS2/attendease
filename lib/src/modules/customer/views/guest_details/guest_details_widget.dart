

import 'package:attendease/src/modules/customer/views/guest_details/widgets/guest_book_info.dart';

import '../../../../core/app_export.dart';
import '../../controllers/customer_controller.dart';
import 'widgets/guest_more_info.dart';
import 'widgets/guest_profile_card.dart';
import 'widgets/guest_review_section.dart';
import 'widgets/tab_bar_widget.dart';

class GuestDetailsWidget extends GetView<CustomerController>{
  const GuestDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      padding: AppPaddings.noPadding,
      physics: const BouncingScrollPhysics(),
      children: [
        AppSpaces.verticalSectionSpaceXXS,
        Obx(() {
          return controller.isGuestListVisible.value?const SizedBox.shrink():
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
        }),
        const GuestBookInfo(),
        const TabBarWidget(),
        const GuestProfileCard(),
        const GuestMoreInfo(),

      ],
    );
  }

}