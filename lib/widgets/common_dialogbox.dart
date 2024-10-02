import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants/app_assets/app_assets.dart';
import '../constants/app_colors/app_colors.dart';
import 'common_buttons/common_button.dart';
import 'common_spaces/common_spaces.dart';
import 'common_textstyle/common_text_style.dart';

class DialogHelper {
  static Future<void> showCommonDialog(
    BuildContext context, {
    required VoidCallback,
    required String? textMessage,
    required String? buttonMessage,
  }) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          contentPadding: EdgeInsets.zero,
          content: Container(
              height: Get.height / 4,
              width: Get.width / 1,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                children: [
                  CommonSpaces.spaceVertical10,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(),
                      SizedBox(
                          width: 50,
                          height: 50,
                          child: Image.asset(
                            AppAssets.logo,
                          )).marginOnly(left: 35),
                      // Pushes the Icon to the end of the row
                      InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: const Icon(
                          Icons.cancel_outlined,
                          size: 29,
                          color: Colors.black,
                        ).marginOnly(right: 10),
                      )
                    ],
                  ),
                  Center(
                    child: Text(
                      'Alert',
                      style: CommonTextStyle.profileName,
                    ).marginOnly(right: 5),
                  ),
                  Center(
                    child: Text(
                      textMessage!,
                      style: CommonTextStyle.dialogBoxText,
                    ),
                  ),
                  CommonSpaces.spaceVertical20,
                  CommonButton(
                    height: 45,
                    width: Get.width,
                    text: buttonMessage!,
                    textStyle: CommonTextStyle.signupColor,
                    onPressed: VoidCallback,
                    fillColor: Colors.red,
                    textColor: Colors.white,
                  ).marginOnly(left: 15, right: 15)
                ],
              )),
        );
      },
    );
  }
}
