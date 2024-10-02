import 'package:emergency_time/constants/app_colors/app_colors.dart';
import 'package:emergency_time/views/splash_screen/splash_screen_controller.dart';
import 'package:emergency_time/widgets/text_widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/app_assets/app_assets.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashScreenController>(
      init: SplashScreenController(),
      builder: (_) {
        return Scaffold(
            backgroundColor: AppColors.redSplashColor,
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                    child: Image.asset(
                  AppAssets.logo,
                  height: 200,
                )).marginOnly(left: 25, right: 25),
                const MyText(
                  'Powered By Artificial Intelligence',
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: AppColors.white,
                )
              ],
            ));
      },
    );
  }
}
