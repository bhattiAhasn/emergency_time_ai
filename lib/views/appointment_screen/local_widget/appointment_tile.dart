import 'package:emergency_time/constants/app_assets/app_assets.dart';
import 'package:emergency_time/utils/libraries/app_libraries.dart';
import 'package:emergency_time/widgets/common_textstyle/common_text_style.dart';

class AppointmentTile extends StatelessWidget {

  final String doctorName;
  final String image;
  final String specialization;
  final String details;
  final String time;
  final String rate;
  final String reviews;

  const AppointmentTile({super.key, required this.doctorName, required this.image, required this.specialization, required this.details, required this.time, required this.rate, required this.reviews});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Stack(
          children: [
            CircleAvatar(
              radius: 30,
              child: Image.asset(image),
            ),
            const Positioned(
              bottom: 1,
              right: 7,
              child: CircleAvatar(
                backgroundColor: AppColors.rateGreen,
                radius: 7,
              ),
            ),
          ]
      ) ,
      title: Expanded(
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text( doctorName,
                    style: CommonTextStyle.titleHeading,),
                  Text( specialization,
                    style: CommonTextStyle.titleSubheading,),
                  Text( details,
                    style: CommonTextStyle.titleSubheading,),
                  Text( time,
                    style: CommonTextStyle.settingTitleText,),
                ],
              ),
            ),
            Column(
              children: [
                Row(
                  children: [
                    Text(rate,  style: CommonTextStyle.titleHeading,),
                    const SizedBox(width: 4,),
                    const Icon(Icons.star, color: AppColors.rateGreen, size: 16,)
                  ],
                ),
                Text(reviews,  style: CommonTextStyle.titleReviews,),
              ],
            ),
          ],
        ),
      ),
      /*trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            children: [
              Text(rate,  style: CommonTextStyle.titleHeading,),
              Icon(Icons.star, color: AppColors.rateGreen, size: 15,)
            ],
          ),
          Text(reviews,  style: CommonTextStyle.titleReviews,),
        ],
      ),*/
    );

  }
}
