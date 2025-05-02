
import '../../../../../core/app_export.dart';

class GuestBookInfo extends StatelessWidget {
  const GuestBookInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 55.0.w),
        margin: EdgeInsets.symmetric(horizontal: 18.w,vertical: 24.h),
        decoration: const BoxDecoration(
          color: AppColor.white,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(12)
          )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppSpaces.verticalSectionSpaceM,
            SizedBox(
              width: 54.w,
              height: 54.w,
              child: SvgPicture.asset(
                AppIcon.guestBookIcon,
                width: 36.w,
                height: 45.h,
              ),
            ),
            AppSpaces.verticalSectionSpaceS,
            Text(
              'guest_book_lbl'.tr,
              style: AppTextStyle.title2,
            ),
            AppSpaces.verticalSectionSpaceS,
            Text(
              "guest_book_description".tr,
              textAlign: TextAlign.center,
              style: AppTextStyle.body.copyWith(
                color: AppColor.subtitle,
                fontSize: 16.sp
              ),
            ),
            AppSpaces.verticalSectionSpaceS,
          ],
        ),
      ),
    );
  }
}