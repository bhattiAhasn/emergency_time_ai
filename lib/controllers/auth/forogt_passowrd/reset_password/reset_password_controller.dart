import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../../constants/app_assets/app_assets.dart';
import '../../../../constants/app_strings/app_strings.dart';
import '../../../../utils/api/apis_url.dart';
import '../../../../utils/libraries/app_libraries.dart';
import '../../../../views/auth/login/login_screen.dart';
import '../../../../widgets/common_buttons/common_button.dart';
import '../../../../widgets/common_spaces/common_spaces.dart';
import '../../../../widgets/common_textstyle/common_text_style.dart';
import '../../../../widgets/common_toast/common_toast.dart';

class ResetPasswordController extends GetxController {
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  RxBool isLoading = false.obs;
  String tokenKey = '';

  Future<void> resetPassword() async {
    print("================================${password.text}");
    isLoading.value = true;
    update();

    try {
      Uri url = Uri.parse(ApiData.resetPassword);
      if (kDebugMode) {
        print("reset password request------------$url");
      }
      var headers = <String, String>{
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      };

      var body = jsonEncode({
        "token": tokenKey,
        "new_password": password.text,
        "confirm_password": password.text
      });

      print("body-----------------$body");

      var res = await http
          .post(
            url,
            headers: headers,
            body: body,
          )
          .timeout(const Duration(seconds: 20));

      print("response of verify code==============${res.statusCode}");
      print("response of verify code==============${res.body}");

      if (res.statusCode == 200) {
        resetDialog();
        // CommonToast.showToast(AppStrings.passwordChangeSuccess);
        isLoading.value = false;
        resetDialog();
      }
    } on TimeoutException catch (e) {
      // Handle timeout exception
      CommonToast.showToast(AppStrings.unableToConnect);
      isLoading.value = false;
      update();
      print("Request timed out: $e");
    } on http.ClientException catch (e) {
      CommonToast.showToast(AppStrings.connectionNotStable);
      // Handle client-side exceptions (e.g., internet connection issues)
      print("Client-side error occurred: $e");
      isLoading.value = false;
      update();
    } catch (e) {
      print("Error occurred during request: $e");
      isLoading.value = false;
      update();
    }
  }

  void resetDialog() {
    Get.dialog(
      AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(10), // Adjust the border radius as needed
        ),
        contentPadding: EdgeInsets.zero,
        content: SizedBox(
            height: Get.height / 3,
            width: Get.width / 1.6,
            child: Column(
              children: [
                CommonSpaces.spaceVertical10,
                Text(
                  'Password Reset',
                  style: CommonTextStyle.EditProfileFont,
                ),
                CommonSpaces.spaceVertical10,
                // Image.asset(
                //   AppAssets.splashScreen,
                //   height: 45,
                // ),
                CommonSpaces.spaceVertical20,
                Text(
                  'Congratulations!',
                  style: CommonTextStyle.EditProfileFont,
                ),
                CommonSpaces.spaceVertical10,
                Text(
                  'Your password has been changed',
                  style: CommonTextStyle.font12weightNormal342f,
                ),
                const SizedBox(
                  height: 20,
                ),
                CommonButton(
                  height: 45,
                  width: Get.width / 2,
                  text: 'Login',
                  textStyle: CommonTextStyle.signupColor,
                  onPressed: () {
                    Get.offAll(() => LoginScreen());
                  },
                  fillColor: Colors.red,
                  textColor: AppColors.color7C7979,
                )
              ],
            )),
      ),
      barrierDismissible: false,
    );
  }

  @override
  void onInit() {
    print('arguments<<<${Get.arguments}');
    if (Get.arguments != null) {
      tokenKey = Get.arguments['token'];
    }

    // TODO: implement onInit
    super.onInit();
  }
}
