import '../../../../../core/app_export.dart';

class GuestReviewSection extends StatelessWidget {
  const GuestReviewSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            padding: AppPaddings.tabPadding,
            child: Text('ONLINE REVIEWS'.toUpperCase(),
                style: AppTextStyle.body.copyWith(
                    fontWeight: FontWeight.w600, color: AppColor.paragraph))),
        Container(
          height: 220.h,
          padding: EdgeInsets.symmetric(vertical: 20.h),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16.r),
              border: Border.all(color: AppColor.borderGrey)),
          child: ListView(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            padding:  EdgeInsets.symmetric(horizontal: 20.w),
            children: const [
              ReviewCard(
                platformLogo: AppIcon.googleIcon,
                rating: 4,
                review:
                    'The food was absolutely delicious and served with great presentation. The staff were friendly and attentive.',
              ),
              ReviewCard(
                platformLogo: AppIcon.yelpIcon,
                rating: 3,
                review:
                    'The service was prompt and attentive, making our evening enjoyable. Highly recommend this gem.',
              ),
              ReviewCard(
                platformLogo: AppIcon.foursquareIcon,
                rating: 2,
                review:
                    'I highly recommend trying their Japan Chicken. It was bursting with flavor.',
              ),
              ReviewCard(
                platformLogo: AppIcon.googleIcon,
                rating: 4,
                review:
                'The food was absolutely delicious and served with great presentation. The staff were friendly and attentive.',
              ),
              ReviewCard(
                platformLogo: AppIcon.yelpIcon,
                rating: 3,
                review:
                'The service was prompt and attentive, making our evening enjoyable. Highly recommend this gem.',
              ),
              ReviewCard(
                platformLogo: AppIcon.foursquareIcon,
                rating: 2,
                review:
                'I highly recommend trying their Japan Chicken. It was bursting with flavor.',
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ReviewCard extends StatelessWidget {
  final String platformLogo;
  final int rating;
  final String review;

  const ReviewCard({
    super.key,
    required this.platformLogo,
    required this.rating,
    required this.review,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 240.w,
      margin: EdgeInsets.only(right: 20.w),
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            margin: EdgeInsets.only(top: 20.h),
            padding: AppPaddings.cardPadding,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(color: AppColor.borderGrey)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppSpaces.verticalSectionSpaceXS,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(5, (index) {
                    return Icon(
                      index < rating ? Icons.star : Icons.star_border,
                      color: Colors.orangeAccent,
                      size: 20.sp,
                    );
                  }),
                ),
                AppSpaces.verticalSectionSpaceXXS,
                Expanded(
                  child: Text(
                    review,
                    textAlign: TextAlign.center,
                    style: AppTextStyle.body,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 48.w,
            height: 48.w,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
                border: Border.all(color: AppColor.borderGrey)),
          ),
          Container(
            width: 48.w,
            height: 24.w,
            margin: EdgeInsets.only(top: 21.h),
            padding: AppPaddings.cardPadding,
            decoration: BoxDecoration(
                color: Colors.white,),
          ),
          Container(
            width: 48.w,
            height: 48.w,
            padding: EdgeInsets.all(4),
            child: Image.asset(platformLogo),
          ),
        ],
      ),
    );
  }
}
