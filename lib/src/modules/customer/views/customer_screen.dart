import '../../../core/app_export.dart';
import '../controllers/customer_controller.dart';

class CustomerScreen extends GetView<CustomerController> {
  const CustomerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              margin: EdgeInsets.only(top: 56.h),
              child: Row(
                children: [
                  const _CustomerMenu(),
                  Obx(() =>
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        width: controller.isGuestListVisible.value ? 388.w : 0,
                        child: controller.isGuestListVisible.value
                            ? const _CustomerGuestList()
                            : const SizedBox.shrink(),
                      )),
                  Expanded(
                    child: GestureDetector(
                      onTap: controller.hideGuestList,
                      child: Container(
                        color: Colors.amber,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: controller.showGuestList,
                              child: Container(
                                color: Colors.grey,
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(Icons.arrow_back_ios_rounded,
                                      size: 17.sp,),
                                    Text("Guest Book",
                                      style: AppTextStyle.largeCaption,),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 56.h,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: AppColor.black,
                  boxShadow: AppShadow.topAppBarBarShadow),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      controller.isFullDrawerVisible.value =
                      !controller.isFullDrawerVisible.value;
                    },
                    child: Container(
                        width: 56.w,
                        height: 56.h,
                        alignment: Alignment.center,
                        child: Icon(
                          Icons.menu,
                          color: AppColor.white,
                        )),
                  ),
                  Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 56.w,
                                height: 56.h,
                                alignment: Alignment.center,
                                child: SvgPicture.asset(
                                  AppIcon.switchIcon,
                                  semanticsLabel: 'switch',
                                  width: 30.w,
                                  height: 23.h,
                                ),
                              ),
                              AppSpaces.horizontalSectionSpaceM2,
                              Container(
                                width: 40.w,
                                height: 40.w,
                                // Keep it square to ensure a perfect circle
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColor
                                      .grey, // Optional fallback background
                                ),
                                child: ClipOval(
                                  child: Image.asset(
                                    AppImage.userProfile,
                                    width: 40.w,
                                    height: 40.w,
                                    fit: BoxFit.cover,
                                    errorBuilder: (context, error,
                                        stackTrace) =>
                                        Icon(
                                          Icons.person,
                                          size: 24.sp,
                                          color: AppColor.greyDark,
                                        ),
                                  ),
                                ),
                              ),

                              AppSpaces.horizontalSectionSpaceXS,
                              Text(
                                "Johnson Francisco",
                                style: AppTextStyle.title.copyWith(
                                    fontSize: 21.sp, color: AppColor.white),
                              ),
                              AppSpaces.horizontalSectionSpaceXS,
                              Text(
                                "Clocked in at 09 : 33 AM",
                                style: AppTextStyle.title.copyWith(
                                    fontSize: 21.sp, color: AppColor.white),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "10 : 20 AM",
                                style: AppTextStyle.title.copyWith(
                                    fontSize: 21.sp, color: AppColor.white),
                              ),
                              AppSpaces.horizontalSectionSpaceL2,
                              Container(
                                width: 56.w,
                                height: 56.h,
                                alignment: Alignment.center,
                                child: SvgPicture.asset(
                                  AppIcon.wifiIcon,
                                  semanticsLabel: 'wifi',
                                  width: 37.w,
                                  height: 26.h,
                                ),
                              ),
                              AppSpaces.horizontalSectionSpaceL2,
                              Container(
                                width: 56.w,
                                height: 56.h,
                                alignment: Alignment.center,
                                child: Stack(
                                  alignment: Alignment.topRight,
                                  children: [
                                    SvgPicture.asset(
                                      AppIcon.notificationIcon,
                                      semanticsLabel: 'notification',
                                      width: 27.w,
                                      height: 33.h,
                                    ),
                                    Container(
                                      width: 15.w,
                                      height: 15.w,
                                      decoration: BoxDecoration(
                                          color: AppColor.primary,
                                          shape: BoxShape.circle
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              AppSpaces.horizontalSectionSpaceM3,
                            ],
                          )
                        ],
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CustomerMenu extends GetView<CustomerController> {
  const _CustomerMenu();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        color: AppColor.black,
        width: controller.isFullDrawerVisible.value ? 200.w : 60.w,
        child: ListView(
          shrinkWrap: true,
          padding: AppPaddings.noPadding,
          children: [
            Container(
              width: 60.w,
              height: 90.h,
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              alignment: Alignment.center,
              child: SvgPicture.asset(
                AppIcon.customerMenuIcon,
                semanticsLabel: 'switch',
              ),
            ),
            Divider(height: 1,color: AppColor.blackPitch,thickness: 1,),
            Container(
              width: 60.w,
              height: 90.h,
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              alignment: Alignment.center,
              child: SvgPicture.asset(
                AppIcon.orderMenuIcon,
                semanticsLabel: 'switch',
              ),
            ),
            Divider(height: 1,color: AppColor.blackPitch,thickness: 1,),
            Container(
              width: 60.w,
              height: 90.h,
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: SvgPicture.asset(
                AppIcon.tableMenuIcon,
                semanticsLabel: 'switch',
              ),
            ),
            Divider(height: 1,color: AppColor.blackPitch,thickness: 1,),
            Container(
              width: 60.w,
              height: 90.h,
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              alignment: Alignment.center,
              child: SvgPicture.asset(
                AppIcon.ticketMenuIcon,
                semanticsLabel: 'switch',
              ),
            ),
            Divider(height: 1,color: AppColor.blackPitch,thickness: 1,),
            Container(
              width: 60.w,
              height: 90.h,
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              alignment: Alignment.center,
              child: SvgPicture.asset(
                AppIcon.osMenuIcon,
                semanticsLabel: 'switch',
              ),
            ),
            Divider(height: 1,color: AppColor.blackPitch,thickness: 1,),
            Container(
              width: 60.w,
              height: 90.h,
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              alignment: Alignment.center,
              child: SvgPicture.asset(
                AppIcon.statMenuIcon,
                semanticsLabel: 'switch',
              ),
            ),
            Divider(height: 1,color: AppColor.blackPitch,thickness: 1,),
            Container(
              width: 60.w,
              height: 90.h,
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              alignment: Alignment.center,
              child: SvgPicture.asset(
                AppIcon.aboutMenuIcon,
                semanticsLabel: 'switch',
              ),
            ),


          ],
        )
        ,
      );
    });
  }
}

class _CustomerGuestList extends StatelessWidget {
  const _CustomerGuestList();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFFAFAFA),
      padding: EdgeInsets.symmetric(vertical: 16.h),
      child: ListView.builder(
        shrinkWrap: true,
        padding: AppPaddings.noPadding,
        physics: BouncingScrollPhysics(),
        itemCount: 15,
        itemBuilder: (_, index) =>
            Row(
              children: [
                Flexible(
                  child: Container(
                    width: 60.w,
                    height: 60.w,
                    // Keep it square to ensure a perfect circle
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColor.grey, // Optional fallback background
                    ),
                    child: ClipOval(
                      child: Image.asset(
                        AppImage.userProfile,
                        width: 60.w,
                        height: 60.w,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) =>
                            Icon(
                              Icons.person,
                              size: 24.sp,
                              color: AppColor.greyDark,
                            ),
                      ),
                    ),
                  ),),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Guest ${index + 1}',
                          style: TextStyle(fontSize: 16.sp)),
                      Text('guest${index + 1}@domain.com',
                          style: TextStyle(fontSize: 12.sp)),
                    ],
                  ),
                )
              ],
            ),
      ),
    );
  }
}

