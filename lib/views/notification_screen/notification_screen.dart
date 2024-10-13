import 'package:emergency_time/constants/app_assets/app_assets.dart';
import 'package:emergency_time/utils/libraries/app_libraries.dart';
import 'package:emergency_time/views/notification_screen/local_widget/notification_title.dart';

import '../../../constants/app_assets/app_icon.dart';
import '../../../widgets/common_textstyle/common_text_style.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          child: Image.asset(
            AppIcons.backIcon,
          ),
          onTap: () {
            Get.back();
          },
        ),
        title: Text(
          "Notifications",
          style: CommonTextStyle.appBarTitle,
        ),
      ),
      body: Stack(
        children:[
            ListView(
              children: [
                Container(
                  height: 32.0, // Set the height to 32px
                  color: AppColors.backgroundTextColor, // Set background color
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "today".toUpperCase(),
                      style: CommonTextStyle.greyText, // Your custom text style
                    ),
                  ),
                ),
                const NotificationTitle(
                    notificationTitle: "Sherlin + 3 more people",
                    image: AppAssets.visitDr1,
                    discription: "Liked your comment in the photograph of Statue of Liberty",
                    time: "3 min ago",
                  imageList: [AppAssets.aIDashboard, AppAssets.bmiCalculator],),
                const NotificationTitle(
                    notificationTitle: "Mike Smith",
                    image: AppAssets.visitDr1,
                    discription: "Liked your comment in the photograph of Statue of Liberty",
                    time: "13 min ago", imageList: [],),
                Container(
                  height: 32.0, // Set the height to 32px
                  color: AppColors.backgroundTextColor, // Set background color
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "yesterday".toUpperCase(),
                      style: CommonTextStyle.greyText, // Your custom text style
                    ),
                  ),
                ),
                const NotificationTitle(
                    notificationTitle: "Sherlin + 3 more people",
                    image: AppAssets.visitDr1,
                    discription: "Liked your comment in the photograph of Statue of Liberty",
                    time: "3 min ago", imageList: [],),
                const NotificationTitle(
                    notificationTitle: "Mike Smith",
                    image: AppAssets.visitDr1,
                    discription: "Liked your comment in the photograph of Statue of Liberty",
                    time: "13 min ago", imageList: [
                  AppAssets.aIDashboard, AppAssets.bmiCalculator, AppAssets.aIDashboard
                ],),
        
              ],
            ),
          // In case of NO NOTIFICATION show this image
          Visibility(
            visible: false,
            child: Center(
              child: Image.asset(AppAssets.noNotificationsImage),
            ),
          ),
          ],
      ),
    );
  }
}
