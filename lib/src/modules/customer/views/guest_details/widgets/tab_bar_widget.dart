
import '../../../../../core/app_export.dart';
import '../../../controllers/customer_controller.dart';

class TabBarWidget extends GetView<CustomerController> {
  const TabBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 44.h,
          padding:  EdgeInsets.all(6.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Obx(() {
            return Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: List.generate(controller.tabs.length, (index) {
                final isSelected = controller.selectedIndex.value == index;

                return GestureDetector(
                  onTap: () => controller.selectTab(index),
                  child: Container(
                    padding: AppPaddings.tabPadding,
                    margin:  EdgeInsets.symmetric(horizontal: 4.w),
                    decoration: BoxDecoration(
                      color: isSelected ? Colors.grey[700] : Colors.transparent,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Text(
                      controller.tabs[index],
                      style: AppTextStyle.subtitle.copyWith(
                        fontWeight: isSelected?FontWeight.w600:AppTextStyle.subtitle.fontWeight,
                        color: isSelected?AppColor.white:AppTextStyle.subtitle.color
                      ),
                    ),
                  ),
                );
              }),
            );
          }),
        ),
      ],
    );
  }
}
