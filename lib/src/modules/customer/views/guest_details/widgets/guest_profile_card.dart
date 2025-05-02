import 'package:attendease/src/modules/customer/controllers/customer_controller.dart';
import '../../../../../core/app_export.dart';

class GuestProfileCard extends GetView<CustomerController> {
  const GuestProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      margin: EdgeInsets.symmetric(horizontal: 18.w, vertical: 24.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildGuestInfo(),
          Obx(() => controller.isGuestListVisible.value
              ? AppSpaces.horizontalSectionSpaceXXSS
              : AppSpaces.horizontalSectionSpaceM),
          VerticalDivider(thickness: 2.w, color: AppColor.grey, width: 2.w),
          AppSpaces.horizontalSectionSpaceM5,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildMetricsRow(),
                AppSpaces.verticalSectionSpaceS,
                Row(
                  children: [
                    Expanded(child: _infoSection()),
                    AppSpaces.horizontalSectionSpaceM5,
                    Expanded(child: _loyaltySection()),
                    AppSpaces.horizontalSectionSpaceM5,
                    Expanded(child: _visitSection()),
                  ],
                ),
                Obx(() => controller.isGuestListVisible.value
                    ? _buildOrderVehicleRow()
                    : const SizedBox.shrink()),
              ],
            ),
          ),
          Obx(() => controller.isGuestListVisible.value
              ? const SizedBox.shrink()
              : _buildSidePanels()),
        ],
      ),
    );
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
        Text('lia.thomas516@reddit.com', style: AppTextStyle.caption),
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
            child: Text('Add Tags', style: AppTextStyle.subtitle.copyWith(fontSize: 12.sp, color: AppColor.white)),
          ),
        ),
      ],
    );
  }

  Widget _buildMetricsRow() {
    return Container(
      height: 86,
      padding: AppPaddings.cardPadding,
      decoration: BoxDecoration(
        color: AppColor.offWhite,
        borderRadius: BorderRadius.circular(10.w),
      ),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _metricTile('-- -- --', 'Last Visit'),
          const VerticalDivider(width: 1, color: AppColor.borderGrey, thickness: 1),
          _metricTile('\$0.00', 'Average Spend'),
          const VerticalDivider(width: 1, color: AppColor.borderGrey, thickness: 1),
          _metricTile('\$0.00', 'Lifetime Spend'),
          const VerticalDivider(width: 1, color: AppColor.borderGrey, thickness: 1),
          _metricTile('0', 'Total Orders'),
          const VerticalDivider(width: 1, color: AppColor.borderGrey, thickness: 1),
          _metricTile('\$0.00', 'Average Tip'),
        ],
      ),
    );
  }

  Widget _buildOrderVehicleRow() {
    return Column(
      children: [
        AppSpaces.verticalSectionSpaceS,
        Row(
          children: [
            Expanded(child: _iconTextPanel(AppIcon.orderItemIcon, 'No Ordered Items')),
            AppSpaces.horizontalSectionSpaceM5,
            Expanded(child: _iconTextPanel(AppIcon.vehicleIcon, 'No recent vehicle to show')),
          ],
        ),
      ],
    );
  }

  Widget _buildSidePanels() {
    return Row(
      children: [
        AppSpaces.horizontalSectionSpaceM5,
        Column(
          children: [
            _iconTextPanel(AppIcon.orderItemIcon, 'No Ordered Items', width: 275.w, height: 186),
            AppSpaces.verticalSectionSpaceS,
            _iconTextPanel(AppIcon.vehicleIcon, 'No recent vehicle to show', width: 275.w, height: 50),
          ],
        ),
      ],
    );
  }

  Widget _iconTextPanel(String iconPath, String text, {double? width, double? height}) {
    return Container(
      width: width,
      height: height ?? 53.h,
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
              text,
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
          Text(label, style: AppTextStyle.subtitle.copyWith(fontSize: 12.sp)),
        ],
      ),
    );
  }

  Widget _infoSection() {
    return Container(
      height: 150,
      padding: AppPaddings.cardPadding,
      decoration: BoxDecoration(
        color: AppColor.offWhite,
        borderRadius: BorderRadius.circular(10.w),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _infoRow('Loyalty No', 'RF|', boldRight: true),
          const Divider(height: 1, color: AppColor.borderGrey),
          _infoRow('Customer Since', 'Enter'),
          const Divider(height: 1, color: AppColor.borderGrey),
          _infoRow('Birthday', 'Enter'),
          const Divider(height: 1, color: AppColor.borderGrey),
          _infoRow('Anniversary', 'Enter'),
        ],
      ),
    );
  }


  Widget _loyaltySection() {
    return Container(
      height: 150,
      padding: AppPaddings.cardPadding,
      decoration: BoxDecoration(
        color: AppColor.offWhite,
        borderRadius: BorderRadius.circular(10.w),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('LOYALTY', style: AppTextStyle.subtitle),
          AppSpaces.verticalSectionSpaceXS,
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _statItem("0","Earned"),
                VerticalDivider(width: 1,thickness: 1,color: AppColor.borderGrey,),
                AppSpaces.horizontalSectionSpaceXS,
                _statItem("0","Redeemed"),
              ]
            ),
          ),
          AppSpaces.verticalSectionSpaceXS,
          Expanded(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _statItem("0","Available"),
                  VerticalDivider(width: 1,thickness: 1,color: AppColor.borderGrey,),
                  AppSpaces.horizontalSectionSpaceXS,
                  _statItem("\$ 00.00", "Amount"),
                ]
            ),
          ),
        ],
      ),
    );
  }

  Widget _visitSection() {
    return Container(
      height: 150,
      padding: AppPaddings.cardPadding,
      decoration: BoxDecoration(
        color: AppColor.offWhite,
        borderRadius: BorderRadius.circular(10.w),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('VISITS', style: AppTextStyle.subtitle),
          AppSpaces.verticalSectionSpaceXS,
          Expanded(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _statItem("0","Total Visits"),
                  VerticalDivider(width: 1,thickness: 1,color: AppColor.borderGrey,),
                  AppSpaces.horizontalSectionSpaceXS,
                  _statItem("0","Upcoming"),
                ]
            ),
          ),
          AppSpaces.verticalSectionSpaceXS,
          Expanded(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _statItem("0","Canceled"),
                  VerticalDivider(width: 1,thickness: 1,color: AppColor.borderGrey,),
                  AppSpaces.horizontalSectionSpaceXS,
                  _statItem("0", "No Shows"),
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
          Flexible(child: Text(value, style: AppTextStyle.title2)),
          Flexible(
            child: Text(
              label,
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
      padding: EdgeInsets.symmetric(vertical: 4.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            child: Text(
              label,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyle.body.copyWith(fontWeight: FontWeight.w600),
            ),
          ),
          Text(
            value,
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
