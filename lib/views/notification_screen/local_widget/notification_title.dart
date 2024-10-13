import 'package:emergency_time/constants/app_assets/app_assets.dart';
import 'package:emergency_time/utils/libraries/app_libraries.dart';
import 'package:emergency_time/widgets/common_textstyle/common_text_style.dart';

class NotificationTitle extends StatelessWidget {
  final String notificationTitle;
  final String image;
  final String discription;
  final String time;
  final List<String> imageList;

  const NotificationTitle(
      {super.key,
      required this.notificationTitle,
      required this.image,
      required this.discription,
      required this.time,
      required this.imageList});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2.0, vertical: 4.0),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          child: Image.asset(image),
        ),
        title: Text(
          notificationTitle,
          style: CommonTextStyle.titleHeading,
        ),
        subtitle: Text(
          discription,
          maxLines: 2,
          style: CommonTextStyle.titleSubheading,
        ),
        trailing: Text(
          time,
          style: CommonTextStyle.titleSubheading,
        ),
      ),
    );
  }
}
