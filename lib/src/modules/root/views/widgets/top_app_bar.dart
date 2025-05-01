
import '../../../../core/app_export.dart';
import '../../controllers/root_controller.dart';

class TopAppBar extends GetView<RootController>{
  const TopAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 64.h,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: 56.h,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: AppColor.black,
                  boxShadow: AppShadow.topAppBarBarShadow),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: controller.toggleMenu,
                    child: Container(
                        width: 56.w,
                        height: 56.h,
                        alignment: Alignment.center,
                        color: AppColor.black,
                        child: const Icon(
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
                                decoration: const BoxDecoration(
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
                              AppSpaces.horizontalSectionSpaceM3,
                              Container(
                                width: 56.w,
                                height: 56.h,
                                alignment: Alignment.center,
                                child: SvgPicture.asset(
                                  AppIcon.wifiIcon,
                                  semanticsLabel: 'wifi',
                                  width: 22.w,
                                  height: 22.h,
                                ),
                              ),
                              AppSpaces.horizontalSectionSpaceXXSS,
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
                                      height: 27.h,
                                    ),
                                    Container(
                                      width: 15.w,
                                      height: 15.w,
                                      decoration: const BoxDecoration(
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
          ),
          Container(
            height: 30.h,
            width: 200.w,
            alignment: Alignment.topCenter,
            decoration: BoxDecoration(
              color: AppColor.black,
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(10.w)
              )
            ),
            child: SvgPicture.asset(
              AppIcon.expandIcon,
              semanticsLabel: 'notification',
              width: 14.w,
              height: 14.h,
            ),
          )
        ],
      ),
    );
  }

}