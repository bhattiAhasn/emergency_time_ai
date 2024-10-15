import 'package:emergency_time/constants/app_colors/app_colors.dart';
import 'package:emergency_time/utils/libraries/app_libraries.dart';
import 'package:emergency_time/widgets/text_widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/app_assets/app_assets.dart';
import '../../routes/app_routes.dart';
import '../../widgets/common_buttons/common_button.dart';
import '../../widgets/common_textstyle/common_text_style.dart';
import 'get_started_controller.dart';

class GetStartedScreen extends StatefulWidget {
  const GetStartedScreen({super.key});

  @override
  GetStartedScreenState createState() => GetStartedScreenState();
}

class GetStartedScreenState extends State<GetStartedScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<GetStartedController>(
      init: GetStartedController(),
      builder: (_) {
        return Scaffold(
          backgroundColor: AppColors.redSplashColor,
          body: Stack(
            children: [
              PageView(
                controller: _.pageController,
                onPageChanged: (index) {
                  _.currentPage = index;
                  _.update();
                },
                children: [
                  // First Page
                  buildPageContent(
                      image: AppAssets.onBoarding1,
                      title: "Find your Specialist",
                      subtitle:
                          "Now it's easy to make an appointment with your doctor."),
                  // Second Page
                  buildPageContent(
                      image: AppAssets.onBoarding2, // Replace with actual asset
                      title: "Search Pharmacy",
                      subtitle:
                          "Get medicines delivered at doorstep with 24 hours"),
                  // Third Page
                  buildPageContent(
                      image: AppAssets.onBoarding3, // Replace with actual asset
                      title: "Get Connected",
                      subtitle: "Consult to your specialist doctor online"),
                ],
              ),
              Positioned(
                bottom: 100,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(3, (index) => buildDot(index, _)),
                ),
              ),
              // Skip button
              Positioned(
                top: 40,
                right: 20,
                child: GestureDetector(
                  onTap: () {
                    _.isSkip = true;
                    _.update();
                    GetStorage().write('isSkip', _.isSkip);
                    Get.toNamed(Routes.loginScreen);
                  },
                  child: const MyText(
                    "Skip",
                    color: AppColors.white,
                    fontSize: 16,
                  ),
                ),
              ),
              // Page Indicator

              // Get Started Button
              Positioned(
                bottom: 40,
                left: 14,
                right: 14,
                child: CommonButton(
                  height: 45,
                  width: Get.width,
                  text: _.currentPage == 2 ? 'Get Started' : 'Next',
                  textStyle: CommonTextStyle.authEmailNormalText,
                  onPressed: () {
                    if (_.currentPage == 2) {
                      _.isSkip = true;
                      _.update();
                      GetStorage().write('isSkip', _.isSkip);
                      Get.toNamed(Routes.loginScreen);
                    } else {
                      _.isSkip = true;
                      _.update();
                      GetStorage().write('isSkip', _.isSkip);
                      _.pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    }
                  },
                  fillColor: Colors.blue,
                  textColor: Colors.white,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget buildPageContent(
      {required String image,
      required String title,
      required String subtitle}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(image).marginAll(20),
          MyText(
            title,
            fontWeight: FontWeight.w400,
            fontSize: 28,
            color: AppColors.white,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          MyText(
            subtitle,
            fontWeight: FontWeight.w400,
            fontSize: 16,
            color: AppColors.white,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget buildDot(int index, GetStartedController _) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.only(right: 8),
      height: 8,
      width: _.currentPage == index ? 16 : 8,
      decoration: BoxDecoration(
        color: _.currentPage == index ? Colors.white : Colors.white54,
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}
