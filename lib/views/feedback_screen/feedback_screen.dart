import 'package:emergency_time/views/feedback_screen/feedback_controller.dart';
import 'package:emergency_time/widgets/common_spaces/common_spaces.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../constants/app_assets/app_icon.dart';
import '../../utils/libraries/app_libraries.dart';
import '../../widgets/common_buttons/common_button.dart';
import '../../widgets/common_textstyle/common_text_style.dart';
import 'local_widget/input_textfield.dart';

class FeedbackScreen extends StatelessWidget {
  const FeedbackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final FeedbackController feedbackController = Get.put(FeedbackController());

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
          "Feedback",
          style: CommonTextStyle.appBarTitle,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "How was your overall experience?",
                  style: CommonTextStyle.bold24Title,
                ),
                CommonSpaces.spaceVertical10,
                Text(
                  "It will help us to serve you better",
                  style: CommonTextStyle.bold16Text,
                ),
                CommonSpaces.spaceVertical40,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RatingBar(
                      initialRating: feedbackController.rating.value,
                      direction: Axis.horizontal,
                      allowHalfRating: false,
                      itemCount: 5,
                      ratingWidget: RatingWidget(
                        full: Image.asset(AppIcons.greenStartIcon),
                        empty: Image.asset(AppIcons.greyStartIcon),
                        half: Image.asset(AppIcons.greenStartIcon),
                      ),
                      itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                      onRatingUpdate: (rating) {
                        // print(rating);
                        feedbackController.updateRating(rating);
                      },
                    ),
                    Obx(() => Text(
                      feedbackController.rating.value.toString(),
                      style: CommonTextStyle.bold24Title,
                    )),
                  ],
                ),
                CommonSpaces.spaceVertical10,
                Obx(() => Text(
                  feedbackController.getFeedbackText(),
                  style: CommonTextStyle.settingTitleText,
                )),
                CommonSpaces.spaceVertical40,
                Text(
                  "Your message ( optional )",
                  style: CommonTextStyle.settingTitleText,
                ),
                CommonSpaces.spaceVertical10,
                InputTextfield(),
              ],
            )),
            Container(
              width: Get.width,
              height: 52,
              decoration: BoxDecoration(
                color: AppColors.redSplashColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Text("Submit",
                style: CommonTextStyle.white16Title,),
              ),
            ).marginOnly(bottom: 14),
          ],
        ),
      ),
    );
  }
}
