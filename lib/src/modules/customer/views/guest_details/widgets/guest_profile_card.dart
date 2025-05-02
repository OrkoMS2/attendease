import 'package:attendease/src/modules/customer/controllers/customer_controller.dart';
import '../../../../../core/app_export.dart';

class GuestProfileCard extends GetView<CustomerController> {
  const GuestProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Container(
        height: controller.isGuestListVisible.value ? 325 : 275,
        padding: EdgeInsets.all(16.w),
        margin: EdgeInsets.symmetric(horizontal: 18.w, vertical: 24.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
                flex: 2,
                child: _buildGuestInfo()),
            AppSpaces.horizontalSectionSpaceS,
            VerticalDivider(
                thickness: 2.w, color: AppColor.borderGrey, width: 2.w),
            AppSpaces.horizontalSectionSpaceM5,
            Expanded(
              flex: 9,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                      flex: 3,
                      child: _buildMetricsRow()),
                  AppSpaces.verticalSectionSpaceS,
                  Expanded(
                    flex: 6,
                    child: Row(
                      children: [
                        Expanded(child: _infoSection()),
                        AppSpaces.horizontalSectionSpaceM5,
                        Expanded(child: _loyaltySection()),
                        AppSpaces.horizontalSectionSpaceM5,
                        Expanded(child: _visitSection()),
                      ],
                    ),
                  ),
                  controller.isGuestListVisible.value
                      ? Expanded(
                      flex: 2,
                      child: _buildOrderVehicleRow())
                      : const SizedBox.shrink()
                ],
              ),
            ),
            controller.isGuestListVisible.value
                ? const SizedBox.shrink()
                : Expanded(
                flex: 3,
                child: _buildOrderVehicleColumn()),
          ],
        ),
      );
    });
  }

  Widget _buildGuestInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AppSpaces.verticalSectionSpaceM2,
        CircleAvatar(
          radius: 36.r,
          backgroundImage: const AssetImage('assets/images/guest1.png'),
        ),
        AppSpaces.verticalSectionSpaceM2,
        Text('Lia Thomas', style: AppTextStyle.title2),
        SizedBox(height: 8.h),
        Text('lia.thomas516@reddit.com',
            textAlign: TextAlign.center,
            style: AppTextStyle.caption),
        SizedBox(height: 8.h),
        Text('+1 212-450-7890', style: AppTextStyle.caption),
        SizedBox(height: 10.h),
        GestureDetector(
          onTap: () {},
          child: Container(
            padding: AppPaddings.buttonSmallPadding,
            decoration: BoxDecoration(
              color: AppColor.black,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Text('add_tags'.tr, style: AppTextStyle.subtitle.copyWith(
                fontSize: 12.sp, color: AppColor.white)),
          ),
        ),
      ],
    );
  }

  Widget _buildMetricsRow() {
    return Container(
      // height: 86,
      padding: AppPaddings.cardPadding2,
      decoration: BoxDecoration(
        color: AppColor.offWhite,
        borderRadius: BorderRadius.circular(10.w),
      ),
      child: Row(
        children: [
          _metricTile('-- -- --', 'last_visit_lbl'),
          const VerticalDivider(
              width: 1, color: AppColor.borderGrey, thickness: 1),
          _metricTile('\$0.00', 'average_spend_lbl'),
          const VerticalDivider(
              width: 1, color: AppColor.borderGrey, thickness: 1),
          _metricTile('\$0.00', 'lifetime_spend_lbl'),
          const VerticalDivider(
              width: 1, color: AppColor.borderGrey, thickness: 1),
          _metricTile('0', 'total_order_lbl'),
          const VerticalDivider(
              width: 1, color: AppColor.borderGrey, thickness: 1),
          _metricTile('\$0.00', 'average_tip_lbl'),
        ],
      ),
    );
  }

  Widget _buildOrderVehicleRow() {
    return Column(
      children: [
        AppSpaces.verticalSectionSpaceS,
        Expanded(
          child: Row(
            children: [
              Expanded(child: _iconTextPanel(
                  AppIcon.orderItemIcon, 'no_order_item_lbl')),
              AppSpaces.horizontalSectionSpaceM5,
              Expanded(child: _iconTextPanel(
                  AppIcon.vehicleIcon, 'no_recent_vehicle_lbl')),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildOrderVehicleColumn() {
    return Row(
      children: [
        AppSpaces.horizontalSectionSpaceM5,
        Expanded(
          child: Column(
            children: [
              Expanded(
                flex: 7,
                child: _iconTextPanel(
                    AppIcon.orderItemIcon, 'no_order_item_lbl',),
              ),
              AppSpaces.verticalSectionSpaceS,
              Flexible(
                flex: 2,
                child: _iconTextPanel(
                    AppIcon.vehicleIcon, 'no_recent_vehicle_lbl',),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _iconTextPanel(String iconPath, String text) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.offWhite,
        borderRadius: BorderRadius.circular(10.r),
      ),
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(iconPath, width: 20.w, height: 20.h),
          AppSpaces.horizontalSectionSpaceXXS,
          Flexible(
            child: Text(
              text.tr,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyle.title2.copyWith(fontSize: 14.sp),
            ),
          ),
        ],
      ),
    );
  }

  Widget _metricTile(String value, String label) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(value, style: AppTextStyle.title2),
          AppSpaces.verticalSectionSpaceXXXXS,
          Text(label.tr, style: AppTextStyle.subtitle.copyWith(fontSize: 12.sp)),
        ],
      ),
    );
  }

  Widget _infoSection() {
    return Container(
      padding: AppPaddings.cardPadding,
      decoration: BoxDecoration(
        color: AppColor.offWhite,
        borderRadius: BorderRadius.circular(10.w),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _infoRow('loyalty_no_lbl', 'RF|', boldRight: true),
          const Divider(height: 1, color: AppColor.borderGrey),
          _infoRow('customer_since_lbl', 'enter_lbl'),
          const Divider(height: 1, color: AppColor.borderGrey),
          _infoRow('birthday_lbl', 'enter_lbl'),
          const Divider(height: 1, color: AppColor.borderGrey),
          _infoRow('anniversary_lbl', 'enter_lbl'),
        ],
      ),
    );
  }


  Widget _loyaltySection() {
    return Container(
      padding: AppPaddings.cardPadding,
      decoration: BoxDecoration(
        color: AppColor.offWhite,
        borderRadius: BorderRadius.circular(10.w),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('loyalty_lbl'.tr, style: AppTextStyle.subtitle),
          AppSpaces.verticalSectionSpaceXS,
          Expanded(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _statItem("0", "earned_lbl"),
                  const VerticalDivider(
                    width: 1, thickness: 1, color: AppColor.borderGrey,),
                  AppSpaces.horizontalSectionSpaceXS,
                  _statItem("0", "redeemed_lbl"),
                ]
            ),
          ),
          AppSpaces.verticalSectionSpaceXS,
          Expanded(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _statItem("0", "available_lbl"),
                  const VerticalDivider(
                    width: 1, thickness: 1, color: AppColor.borderGrey,),
                  AppSpaces.horizontalSectionSpaceXS,
                  _statItem("\$ 00.00", "amount_lbl"),
                ]
            ),
          ),
        ],
      ),
    );
  }

  Widget _visitSection() {
    return Container(
      padding: AppPaddings.cardPadding,
      decoration: BoxDecoration(
        color: AppColor.offWhite,
        borderRadius: BorderRadius.circular(10.w),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('visit_lbl'.tr, style: AppTextStyle.subtitle),
          AppSpaces.verticalSectionSpaceXS,
          Expanded(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _statItem("0", "total_visit_lbl"),
                  const VerticalDivider(
                    width: 1, thickness: 1, color: AppColor.borderGrey,),
                  AppSpaces.horizontalSectionSpaceXS,
                  _statItem("0", "Upcoming_lbl"),
                ]
            ),
          ),
          AppSpaces.verticalSectionSpaceXS,
          Expanded(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _statItem("0", "canceled_lbl"),
                  const VerticalDivider(
                    width: 1, thickness: 1, color: AppColor.borderGrey,),
                  AppSpaces.horizontalSectionSpaceXS,
                  _statItem("0", "no_show_lbl"),
                ]
            ),
          ),
        ],
      ),
    );
  }

  Widget _statItem(String value, String label) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(child: Text(value.tr, style: AppTextStyle.title2)),
          Flexible(
            child: Text(
              label.tr,
              style: AppTextStyle.caption.copyWith(
                color: AppColor.subtitle,
                fontSize: 10.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _infoRow(String label, String value, {bool boldRight = false}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            child: Text(
              label.tr,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyle.body.copyWith(fontWeight: FontWeight.w600),
            ),
          ),
          Text(
            value.tr,
            style: AppTextStyle.body.copyWith(
              fontWeight: boldRight ? FontWeight.w600 : FontWeight.w500,
              color: boldRight ? AppColor.black : AppColor.grey,
            ),
          ),
        ],
      ),
    );
  }
}
