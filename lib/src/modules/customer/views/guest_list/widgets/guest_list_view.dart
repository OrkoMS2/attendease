import '../../../../../core/app_export.dart';
import '../../../controllers/customer_controller.dart';

class GuestListView extends GetView<CustomerController> {
  const GuestListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: controller.guestLists.length,
      itemBuilder: (context, index) {
        final guest = controller.guestLists[index];
        return GestureDetector(
          onTap: () {
            controller.selectedGuestIndex.value = index;
          },
          child: Obx(() {
            return Container(
              width:
              double.infinity, // Ensures container matches screen width
              padding: AppPaddings.inputPadding,
              decoration: BoxDecoration(
                color: controller.selectedGuestIndex.value == index ? AppColor
                    .greyLight : AppColor.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(index == 0 ? 10 : 0),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 2,
                    child: guest.avatarUrl != null
                        ? Container(
                      width: 60.w,
                      height: 60.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage(guest.avatarUrl!),
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                        : Container(
                      width: 60.w,
                      height: 60.w,
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                        color: AppColor.grey,
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        controller.getInitials(guest.name),
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Flexible(child: SizedBox(width: 12.w)),
                  Expanded(
                    flex: 5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          guest.name,
                          style: AppTextStyle.largeCaption.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          guest.email,
                          style: AppTextStyle.body,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          guest.phone,
                          style: AppTextStyle.body,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }),
        );
      },
    );
  }

}