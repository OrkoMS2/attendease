import '../../../../core/app_export.dart';
import '../../controllers/root_controller.dart';

class LeftNavigationBar extends GetView<RootController> {
  const LeftNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        color: AppColor.black,
        width: controller.isFullDrawerVisible.value ? 210.w : 60.w,
        child: ListView.builder(
          shrinkWrap: true,
          padding: AppPaddings.noPadding,
          itemCount: controller.navItems.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                controller.updateSelectedIndex(index);
              },
              child: Container(
                height: 146.h,
                decoration: const BoxDecoration(
                  color: AppColor.black,
                  border: Border(
                    top: BorderSide(color: AppColor.blackPitch, width: 0.5),
                    bottom: BorderSide(color: AppColor.blackPitch, width: 0.5),
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      width: controller.isFullDrawerVisible.value ? 18.w : 10.w,
                    ),
                    Flexible(
                      child: SizedBox(
                        width: 40.w,
                        height: 146.h,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Flexible(
                              child: SvgPicture.asset(
                                controller.navItems[index].icon,
                                semanticsLabel: controller.navItems[index]
                                    .semanticsLabel,
                              ),
                            ),
                            if ((index == controller.navItems.length - 1) &&
                                !controller.isFullDrawerVisible.value )
                              Flexible(
                                child: Text("Ver 4.9\nFL 3.3.6",
                                  style: AppTextStyle.title.copyWith(
                                      color: AppColor.white,
                                      fontSize: 10.sp
                                  ),),
                              )
                          ],
                        ),
                      ),
                    ),
                    if (controller.isFullDrawerVisible.value) ...[
                      SizedBox(width: 12.w),
                      Expanded(
                        child: Text(
                          controller.navItems[index].semanticsLabel
                              .split(" ")
                              .first,
                          style: AppTextStyle.subtitle
                              .copyWith(color: AppColor.white),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            );
          },
        ),
      );
    });
  }
}
