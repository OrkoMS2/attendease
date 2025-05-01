

import '../../../../core/app_export.dart';
import '../../controllers/customer_controller.dart';

class GuestSearchWidget extends GetView<CustomerController>{
  const GuestSearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColor.greyLight,
      ),
      child: TextFormField(
        controller: controller.searchTextController,
        cursorColor: Colors.black,
        style: AppTextStyle.title.copyWith(fontSize: 17.sp),
        decoration: InputDecoration(
            hintText: "Search",
            hintStyle: AppTextStyle.subtitle,
            focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide.none),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none),
            fillColor: AppColor.greyLight,
            prefixIcon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(AppIcon.searchIcon,
                  width: 20.w, height: 20.h),
            ),
            suffixIconConstraints:
            BoxConstraints(maxWidth: 50.w, minWidth: 50.w),
            prefixIconConstraints:
            BoxConstraints(maxWidth: 50.w, minWidth: 50.w),
            suffixIcon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(AppIcon.micIcon,
                  width: 20.w, height: 20.h),
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 10.w)),
      ),
    );
  }

}