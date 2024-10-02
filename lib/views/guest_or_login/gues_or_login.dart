import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/app_assets/app_assets.dart';
import '../../constants/app_strings/app_strings.dart';
import '../../routes/app_routes.dart';
import '../../widgets/common_buttons/common_button.dart';
import '../../widgets/common_scaffold/common_scaffold.dart';
import '../../widgets/common_spaces/common_spaces.dart';
import '../../widgets/common_textstyle/common_text_style.dart';
import '../auth/login/login_screen.dart';
import '../auth/signup/signup_screen.dart';

class GuestOrLogin extends StatelessWidget {
  const GuestOrLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CommonSpaces.spaceVertical10,
            Image.asset(
              AppAssets.logo,
              height: Get.height / 2.8,
            ).marginOnly(left: 25, right: 25),

            Text(
              AppStrings.welcomeAPP,
              style: CommonTextStyle.style7font16weight700black,
            ).marginOnly(left: 2, right: 2),
            CommonSpaces.spaceVertical10,
            Text(
              'Sign in to explore law and interact with your \n'
              '                       representative',
              style: CommonTextStyle.font16greycolor,
            ).marginOnly(left: 2, right: 2),
            CommonSpaces.spaceVertical20,
            GestureDetector(
              onTap: () {
                Get.to(() => LoginScreen());
              },
              child: Container(
                height: 45,
                width: Get.width,

                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 12),
                // Adjust padding to fit your design
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xff2ECEC2), width: 1),

                  color: Colors.white,
                  borderRadius: BorderRadius.circular(
                      30), // Adjust border radius to fit your design
                ),
                child: const Center(
                  child: Text(
                    "Sign In",
                    style: TextStyle(
                      fontFamily: 'Nexa',
                      color: const Color(0xff2ECEC2),
                      fontSize: 16, // Adjust font size to fit your design
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ).marginOnly(left: 14, right: 14),
            CommonSpaces.spaceVertical10,
            GestureDetector(
              onTap: () {
                Get.to(() => SignUpScreen());
              },
              child: Container(
                height: 45,
                width: Get.width,

                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 12),
                // Adjust padding to fit your design
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xff2ECEC2), width: 1),

                  color: Colors.white,
                  borderRadius: BorderRadius.circular(
                      30), // Adjust border radius to fit your design
                ),
                child: const Center(
                  child: Text(
                    "Register",
                    style: TextStyle(
                      fontFamily: 'Nexa',
                      color: const Color(0xff2ECEC2),
                      fontSize: 16, // Adjust font size to fit your design
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ).marginOnly(left: 14, right: 14),
            CommonSpaces.spaceVertical20,
            // Image.asset(
            //   AppAssets.orImage,
            //   height: 17,
            // ).marginOnly(left: 16, right: 16),
            CommonSpaces.spaceVertical20,
            CommonButton(
              height: 45,
              width: Get.width,
              text: 'Continue as Guest',
              textStyle: CommonTextStyle.authEmailNormalText,
              onPressed: () {
                // Get.to(() => LawShowingScreen());
                // Get.toNamed(Routes.dashboardScreen);
              },
              fillColor: Colors.blue,
              textColor: Colors.white,
            ).marginOnly(left: 14, right: 14)

            // const SizedBox(
            //   height: 20,
            // ),
          ],
        ));
  }
}
