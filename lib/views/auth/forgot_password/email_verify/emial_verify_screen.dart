import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../../constants/app_colors/app_colors.dart';

import '../../../../controllers/auth/forogt_passowrd/email_verify/email_verify_controller.dart';
import '../../../../mixin_classes/validate_email/validate_email.dart';
import '../../../../widgets/common_buttons/common_button.dart';
import '../../../../widgets/common_scaffold/common_scaffold.dart';
import '../../../../widgets/common_spaces/common_spaces.dart';
import '../../../../widgets/common_textstyle/common_text_style.dart';
import '../reset_password/reset_password_screen.dart';

class EmailVerify extends StatelessWidget with ValidateUserEmail {
  EmailVerify({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      isAppbarShow: true,
      body: bodyData(context),
    );
  }

  Widget bodyData(BuildContext context) {
    return GetBuilder<EmailVerificationController>(
      init: EmailVerificationController(),
      builder: (controller) {
        return SizedBox(
          height: Get.height,
          width: Get.width,
          child: SingleChildScrollView(
            child: Form(
              key: controller.formKey,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 30),
                    Text(
                      "Verify Email Address",
                      style: CommonTextStyle.style7font16weight700black,
                    ),
                    CommonSpaces.spaceVertical40,
                    // Uncomment and replace with actual image asset if needed
                    // SizedBox(
                    //   height: 60,
                    //   child: Image.asset(AppAssets.getCode),
                    // ),
                    Text(
                      'Get Your Code',
                      style: CommonTextStyle.authEmailBold,
                    ),
                    CommonSpaces.spaceVertical10,
                    Text(
                      'Please enter the 4-digit code that',
                      style: CommonTextStyle.authEmailNormalText,
                    ),
                    Text(
                      'was sent to your email address.',
                      style: CommonTextStyle.authEmailNormalText,
                    ),
                    CommonSpaces.spaceVertical30,
                    SizedBox(
                      width: Get.width / 2,
                      child: PinCodeTextField(
                        pastedTextStyle: CommonTextStyle.BlueColorBold,
                        length: 4,
                        animationType: AnimationType.fade,
                        textStyle: CommonTextStyle.BlueColorBold,
                        validator: (v) {
                          if (v == null || v.isEmpty) {
                            return 'Enter pin';
                          }
                          return null;
                        },
                        pinTheme: PinTheme(
                          selectedFillColor: AppColors.pinFieldBackground,
                          selectedColor: AppColors.pinFieldBackground,
                          borderWidth: 2,
                          disabledColor: AppColors.pinFieldBackground,
                          shape: PinCodeFieldShape.box,
                          borderRadius: BorderRadius.circular(4),
                          fieldHeight: 44,
                          fieldWidth: 40,
                          inactiveColor: AppColors.pinFieldBackground,
                          inactiveFillColor: AppColors.pinFieldBackground,
                          activeColor: AppColors.pinFieldBackground,
                          activeFillColor: AppColors.pinFieldBackground,
                        ),
                        cursorColor: Colors.white,
                        animationDuration: const Duration(milliseconds: 300),
                        enableActiveFill: true,
                        controller: controller.pin,
                        keyboardType: TextInputType.number,
                        boxShadows: const [
                          BoxShadow(
                            offset: Offset(0, 1),
                            color: Colors.black12,
                            blurRadius: 10,
                          ),
                        ],
                        onCompleted: (v) async {
                          // Uncomment and implement verifyOtp method
                          // await controller.verifyOtp();
                        },
                        onChanged: (value) {
                          controller.isEmpty.value = false;
                          // controller.update();
                        },
                        beforeTextPaste: (text) {
                          return true;
                        },
                        appContext: context,
                      ),
                    ),
                    CommonSpaces.spaceVertical80,
                    CommonButton(
                      width: Get.width,
                      text: 'Verify and Proceed',
                      onPressed: () {
                        Get.to(() => ResetPassword());
                      },
                      textStyle: CommonTextStyle.signupColor,
                      fillColor: Colors.blue,
                      textColor: Colors.white,
                    ).marginOnly(left: 20, right: 20),
                  ]),
            ),
          ),
        );
      },
    );
  }
}
