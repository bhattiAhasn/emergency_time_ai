

import '../../../utils/libraries/app_libraries.dart';
import '../../../widgets/common_textstyle/common_text_style.dart';

class DoctorProfile extends StatelessWidget {


  final String doctorName;
  final String image;
  final String specialization;
  final String details;
  final String fee;
  final String rate;
  final String reviews;
  final String hospitals;

  DoctorProfile({
    Key? key,
    required this.doctorName,
    required this.image,
    required this.specialization,
    required this.details,
    required this.rate,
    required this.reviews, required this.fee, required this.hospitals,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    doctorName,
                    style: CommonTextStyle.titleHeading.copyWith(fontSize: 20),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8,),
                  Text(
                    specialization,
                    style: CommonTextStyle.titleSubheading.copyWith(fontSize: 12),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    details,
                    style: CommonTextStyle.titleSubheading.copyWith(fontSize: 12),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    hospitals,
                    style: CommonTextStyle.titleSubheading.copyWith(fontSize: 12),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 12,),
                  Text(
                    fee,
                    style: CommonTextStyle.titleBlack12Subheading.copyWith(fontSize: 14),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            Column(
              children: [
                SizedBox(
                  width: 80,
                  height: 80,
                  child: Image.asset(image, fit: BoxFit.cover),
                ),
                const SizedBox(height: 8,),
                Row(
                  children: [
                    Text(
                      rate,
                      style: CommonTextStyle.titleHeading.copyWith(fontSize: 14),
                    ),
                    const SizedBox(width: 4),
                    const Icon(
                      Icons.star,
                      color: AppColors.rateGreen,
                      size: 16,
                    ),
                  ],
                ),
                Text(
                  reviews,
                  style: CommonTextStyle.titleReviews.copyWith(fontSize: 11),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ],
        ),
    );
  }
}
