import '../../../../../core/app_export.dart';
import '../../../controllers/customer_controller.dart';
import 'guest_review_section.dart';

class GuestMoreInfo extends GetView<CustomerController> {
  const GuestMoreInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Obx(() {
          return
            Container(
              margin: EdgeInsets.symmetric(horizontal: 18.w),
              child: controller.isGuestListVisible.value ?
              _SectionColumn(
                leftChild: _InfoCard(
                  iconPath: AppIcon.allergyIcon,
                  text: 'No Allergies',
                  title: 'Allergies',
                  buttonText: 'Add',
                  onPressed: () {},
                ),
                rightChild: _InfoCard(
                  iconPath: AppIcon.visitIcon,
                  title: "Upcoming Visits",
                  text: 'No Upcoming Visits',
                  buttonText: 'Book A Visit',
                  onPressed: () {},
                ),
              ) :
              _SectionRow(
                leftChild: _InfoCard(
                  iconPath: AppIcon.allergyIcon,
                  text: 'No Allergies',
                  title: 'Allergies',
                  buttonText: 'Add',
                  onPressed: () {},
                ),
                rightChild: _InfoCard(
                  iconPath: AppIcon.visitIcon,
                  title: "Upcoming Visits",
                  text: 'No Upcoming Visits',
                  buttonText: 'Book A Visit',
                  onPressed: () {},
                ),
              ),
            );
        }),
        _NoteSection(),
        AppSpaces.verticalSectionSpaceM2,
        Container(
          margin: EdgeInsets.symmetric(horizontal: 18.w),
          child: Column(
            children: [
              _InfoCard(
                iconPath: AppIcon.noOrderIcon,
                title: "RECENT ORDERS",
                text: 'No Recent Orders to Show',
                buttonText: '',
                showButton: false,
                onPressed: () {},
              ),
              AppSpaces.verticalSectionSpaceM2,
              Obx(() {
                return controller.selectedGuestIndex.value==1?
                const GuestReviewSection():_InfoCard(
                  iconPath: AppIcon.noReviewIcon,
                  title: "Online reviews",
                  text: 'No Online Review to Show',
                  buttonText: '',
                  showButton: false,
                  onPressed: () {},
                );
              }),
            ],
          ),
        ),
        AppSpaces.verticalSectionSpaceM2,
      ],
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String title;

  const _SectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: AppPaddings.tabPadding,
        child: Text(title.toUpperCase(), style: AppTextStyle.body.copyWith(
            fontWeight: FontWeight.w600, color: AppColor.paragraph)));
  }
}

class _SectionRow extends StatelessWidget {
  final Widget leftChild;
  final Widget rightChild;

  const _SectionRow({required this.leftChild, required this.rightChild});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.h),
      child: Row(
        children: [
          Expanded(child: leftChild),
          AppSpaces.horizontalSectionSpaceM5,
          Expanded(child: rightChild),
        ],
      ),
    );
  }
}

class _SectionColumn extends StatelessWidget {
  final Widget leftChild;
  final Widget rightChild;

  const _SectionColumn({required this.leftChild, required this.rightChild});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.h),
      child: Column(
        children: [
          leftChild,
          AppSpaces.verticalSectionSpaceS,
          rightChild,
        ],
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  final String iconPath;
  final String text;
  final String title;
  final String buttonText;
  final bool showButton;
  final VoidCallback onPressed;

  const _InfoCard({
    required this.iconPath,
    required this.text,
    required this.title,
    required this.buttonText,
    required this.onPressed,
    this.showButton = true
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            padding: AppPaddings.tabPadding,
            child: Text(title.toUpperCase(), style: AppTextStyle.body.copyWith(
                fontWeight: FontWeight.w600, color: AppColor.paragraph))),
        Container(
          height: 60.h,
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          decoration: BoxDecoration(
            color: AppColor.white,
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SvgPicture.asset(iconPath, width: 24.w, height: 24.h),
                  AppSpaces.horizontalSectionSpaceXXSS,
                  Container(
                      margin: EdgeInsets.symmetric(vertical: 8.h),
                      child: const VerticalDivider(
                        width: 1, thickness: 1, color: AppColor.borderGrey,)),
                  AppSpaces.horizontalSectionSpaceXXSS,
                  Text(text,
                      style: AppTextStyle.title2.copyWith(fontSize: 14.sp)),
                ],
              ),
              showButton ? GestureDetector(
                onTap: onPressed,
                child: Container(
                  padding: AppPaddings.buttonSmallPadding,
                  decoration: BoxDecoration(
                    color: AppColor.black,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Text(buttonText, style: AppTextStyle.subtitle.copyWith(
                      fontSize: 12.sp, color: AppColor.white)),
                ),
              ) : SizedBox.shrink(),
            ],
          ),
        ),
      ],
    );
  }
}

class _NoteSection extends GetView<CustomerController> {


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 18.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _SectionTitle(title: 'NOTES'),
          Container(
            decoration: BoxDecoration(
              color: AppColor.white,
              borderRadius: BorderRadius.circular(12.w),
            ),
            child: ListView.separated(
              itemCount: controller.noteItems.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              separatorBuilder: (context, index) =>
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 12.w),
                    child: Divider(
                      height: 15.h,
                      color: AppColor.borderGrey,
                    ),
                  ),
              itemBuilder: (context, index) {
                final item = controller.noteItems[index];
                return _NoteTile(
                  icon: item["icon"]!,
                  title: item["title"]!,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _NoteTile extends StatelessWidget {
  final String icon;
  final String title;

  const _NoteTile({required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppPaddings.tabPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SizedBox(
                width: 18.w,
                height: 18.w,
                child: SvgPicture.asset(
                  icon,
                  width: 18.w,
                  height: 18.h,
                ),
              ),
              AppSpaces.horizontalSectionSpaceXXS,
              Text(title, style: AppTextStyle.title2),
            ],
          ),
          Text('Add notes', style: AppTextStyle.caption),
        ],
      ),
    );
  }
}


class _EmptyInfoCard extends StatelessWidget {
  final String icon;
  final String text;

  const _EmptyInfoCard({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      height: 60.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          SvgPicture.asset(icon, width: 24.w, height: 24.h),
          SizedBox(width: 10.w),
          Text(text, style: TextStyle(fontSize: 14.sp)),
        ],
      ),
    );
  }
}
