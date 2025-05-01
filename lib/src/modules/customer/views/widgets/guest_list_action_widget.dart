
import '../../../../core/app_export.dart';
import '../../controllers/customer_controller.dart';

class GuestListActionWidget extends GetView<CustomerController>{
  const GuestListActionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                flex: 1,
                  child: _actionIcon(AppIcon.addIcon, AppColor.black)),
              Flexible(child: SizedBox(width: 15.w,)),
              Expanded(
                  flex:1,
                  child: _actionIcon(AppIcon.uploadIcon, AppColor.grey)),
            ],
          ),
        ),
        const Spacer(flex: 7,),
        Expanded(
            flex: 1,
            child: _actionIcon(AppIcon.filterIcon, AppColor.greyLight, isSvg: false)),
      ],
    );
  }
  Widget _actionIcon(String icon, Color bg, {bool isSvg = true}) {
    return Container(
      padding: EdgeInsets.all(7.w),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(6.w),
      ),
      child: isSvg
          ? SvgPicture.asset(icon, width: 15.w, height: 15.h)
          : Image.asset(icon, width: 15.w, height: 15.h),
    );
  }
}