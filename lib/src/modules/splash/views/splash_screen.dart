import '../controllers/splash_controller.dart';
import "../../../core/app_export.dart";

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [AppColor.white, AppColor.offWhite],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppSpaces.verticalSectionSpaceXXXL,
            SizedBox(
                width: 120.w,
                height: 60.h,
                child: Image.asset(
                    AppImage.logo,
                    color: AppColor.primary,
                    fit: BoxFit.cover,
                )
            ),
            Text(
              'AttendEase',
              style: AppTextStyle.headlineLarge.copyWith(color: AppColor.title),
            ),

            const Spacer(),

            const CircularProgressIndicator(color: AppColor.primary),
            AppSpaces.verticalSectionSpaceXL,
          ],
        ),
      ),
    );
  }
}
