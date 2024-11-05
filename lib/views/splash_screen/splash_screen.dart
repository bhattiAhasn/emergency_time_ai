import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/app_colors/app_colors.dart';
import '../../constants/app_assets/app_assets.dart';
import 'splash_screen_controller.dart';
import '../../widgets/text_widget/text_widget.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashScreenController>(
      init: SplashScreenController(),
      builder: (_) {
        return Scaffold(
          backgroundColor: AppColors.redSplashColor,
          body: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Image.asset(
                    AppAssets.logo,
                    height: 200,
                  ),
                ),
                const SizedBox(height: 20),
                const MyText(
                  'Powered By Artificial Intelligence',
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: AppColors.white,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
