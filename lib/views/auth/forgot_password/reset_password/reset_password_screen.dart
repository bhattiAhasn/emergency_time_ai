// ignore_for_file: must_be_immutable

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../../constants/app_colors/app_colors.dart';
import '../../../../constants/app_strings/app_strings.dart';
import '../../../../controllers/auth/forogt_passowrd/reset_password/reset_password_controller.dart';
import '../../../../mixin_classes/keys_variables_abstract.dart';
import '../../../../mixin_classes/validate_email/validate_email.dart';
import '../../../../widgets/common_buttons/common_button.dart';
import '../../../../widgets/common_scaffold/common_scaffold.dart';
import '../../../../widgets/common_spaces/common_spaces.dart';
import '../../../../widgets/common_textfields/commn_textfield.dart';
import '../../../../widgets/common_textstyle/common_text_style.dart';
import '../../../../widgets/common_toast/common_toast.dart';

class ResetPassword extends StatelessWidget
    with CommonVariables, ValidateUserEmail {
  ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      isAppbarShow: true,
      body: bodyData(context),
    );
  }

  bodyData(BuildContext context) {
    ResetPasswordController controller = Get.put(ResetPasswordController());
    return SizedBox(
      height: Get.height,
      width: Get.width,
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Text(
                'Reset Password',
                style: CommonTextStyle.style7font16weight700black,
              ),
              CommonSpaces.spaceVertical40,
              Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Enter new password',
                  style: CommonTextStyle.BlueColorBold,
                ),
              ),
              Obx(
                () => CommonTextField(
                  controller: controller.password,
                  bordercolor: AppColors.colorC1c1,
                  disableBorderColor: AppColors.colorC1c1,
                  textColor: AppColors.blackColor,
                  isTextHidden: secureText.value,
                  togglePassword: true,
                  inputFormatters: [
                    FilteringTextInputFormatter.deny(RegExp(r"\s\b|\b\s"))
                  ],
                  toggleIcon: secureText.value == true
                      ? Icons.visibility
                      : Icons.remove_red_eye,
                  toggleFunction: () {
                    secureText.value = !secureText.value;
                    // controller.update();
                  },
                  validator: (value) {
                    if (value.toString().isEmpty) {
                      return 'This filed is required';
                    } else if (isPasswordEmpty(value.toString()) != null) {
                      return isPasswordEmpty(value.toString());
                    }
                    return null;
                  },
                  cursorColor: Colors.black,
                ),
              ),
              CommonSpaces.spaceVertical10,
              Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Renter new password',
                  style: CommonTextStyle.BlueColorBold,
                ),
              ),
              Obx(
                () => CommonTextField(
                  controller: controller.confirmPassword,
                  bordercolor: AppColors.colorC1c1,
                  disableBorderColor: AppColors.colorC1c1,
                  textColor: AppColors.blackColor,
                  isTextHidden: secureText2.value,
                  togglePassword: true,
                  inputFormatters: [
                    FilteringTextInputFormatter.deny(RegExp(r"\s\b|\b\s"))
                  ],
                  toggleIcon: secureText2.value == true
                      ? Icons.visibility
                      : Icons.remove_red_eye,
                  toggleFunction: () {
                    secureText2.value = !secureText2.value;
                    // controller.update();
                  },
                  validator: (value) {
                    if (value.toString().isEmpty) {
                      return 'This filed is required';
                    } else if (isPasswordEmpty(value.toString()) != null) {
                      return isPasswordEmpty(value.toString());
                    }
                    return null;
                  },
                  cursorColor: Colors.black,
                ),
              ),
              CommonSpaces.spaceVertical100,
              GetBuilder<ResetPasswordController>(builder: (controller) {
                return CommonButton(
                  width: Get.width / 1,
                  text: 'Continue',
                  fillColor: Colors.red,
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      if (controller.password.text ==
                          controller.confirmPassword.text) {
                        if (controller.isLoading.value) {
                          BotToast.showLoading();
                        } else {
                          BotToast.closeAllLoading();
                        }
                        controller.resetPassword();
                      } else {
                        CommonToast.showToast(AppStrings.passwordNotMatch);
                      }
                    }
                  },
                  textStyle: CommonTextStyle.signupColor,
                  textColor: Colors.white,
                );
              }),
            ],
          ).marginSymmetric(horizontal: 40),
        ),
      ),
    );
  }
}
