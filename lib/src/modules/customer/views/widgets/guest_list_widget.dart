import 'package:attendease/src/modules/customer/views/widgets/guest_list_view.dart';

import '../../../../core/app_export.dart';
import '../../controllers/customer_controller.dart';
import 'guest_list_action_widget.dart';
import 'guest_nav_widget.dart';
import 'guest_search_widget.dart';

class GuestListWidget extends GetView<CustomerController> {
  const GuestListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return
    Container(
      padding: AppPaddings.guestListPadding,
      decoration: const BoxDecoration(
        color: AppColor.offWhite,
        border: Border(
          right: BorderSide(color: AppColor.blackPitch, width: 0.5),
        ),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const GuestNavWidget(),
        AppSpaces.verticalSectionSpaceL4,
        const GuestSearchWidget(),
        AppSpaces.verticalSectionSpaceM3,
        const GuestListActionWidget(),
        AppSpaces.verticalSectionSpaceM3,
        const Expanded(
          child: GuestListView(),
        ),
      ]),
    );
  }



}
