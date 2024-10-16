import 'package:emergency_time/utils/libraries/app_libraries.dart';

import '../../../widgets/common_textstyle/common_text_style.dart';

class AppointmentTile extends StatefulWidget {

  final String doctorName;
  final String image;
  final String specialization;
  final String details;
  final String fee;
  final String rate;
  final String reviews;

  const AppointmentTile({super.key, required this.doctorName, required this.image, required this.specialization, required this.details, required this.fee, required this.rate, required this.reviews});

  @override
  State<AppointmentTile> createState() => _AppointmentTileState();
}

class _AppointmentTileState extends State<AppointmentTile> {


  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Stack(
        children: [
          CircleAvatar(
            radius: 30,
            child: SizedBox(
              child: Image.asset(widget.image, fit: BoxFit.cover),
            ),
          ),
          const Positioned(
            bottom: 1,
            right: 7,
            child: CircleAvatar(
              backgroundColor: AppColors.rateGreen,
              radius: 7,
            ),
          ),
        ],
      ),
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.doctorName,
                  style: CommonTextStyle.titleHeading,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  widget.specialization,
                  style: CommonTextStyle.titleSubheading,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  widget.details,
                  style: CommonTextStyle.titleSubheading,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  widget.fee,
                  style: CommonTextStyle.titleBlack12Subheading,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                children: [
                  Text(
                    widget.rate,
                    style: CommonTextStyle.titleHeading,
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
                widget.reviews,
                style: CommonTextStyle.titleReviews,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ],
      ),
    );
  }

}
