import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/app_colors/app_colors.dart';
import '../../../constants/app_strings/app_strings.dart';
import '../../../controllers/auth/forogt_passowrd/forgot_password_controller.dart';
import '../../../mixin_classes/keys_variables_abstract.dart';
import '../../../mixin_classes/validate_email/validate_email.dart';
import '../../../widgets/common_buttons/common_button.dart';
import '../../../widgets/common_scaffold/common_scaffold.dart';
import '../../../widgets/common_spaces/common_spaces.dart';
import '../../../widgets/common_textfields/commn_textfield.dart';
import '../../../widgets/common_textstyle/common_text_style.dart';

// ignore: must_be_immutable
class ForgotPassword extends StatelessWidget
    with CommonVariables, ValidateUserEmail {
  ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      isAppbarShow: true,
      body: bodyData(),
    );
  }

  bodyData() {
    ForgotPasswordController controller = Get.put(ForgotPasswordController());

    return SizedBox(
      height: Get.height,
      width: Get.width,
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              const SizedBox(height: 30),
              Text(
                'Forget Password,',
                style: CommonTextStyle.style7font16weight700black,
              ),
              CommonSpaces.spaceVertical50,

              Text(
                'Email Address Here',
                style: CommonTextStyle.authEmailBold,
              ),
              CommonSpaces.spaceVertical10,
              Text(
                'Enter the email address associated',
                style: CommonTextStyle.authEmailNormalText,
              ),
              Text(
                'with your account.',
                style: CommonTextStyle.authEmailNormalText,
              ),
              CommonSpaces.spaceVertical30,

              // SizedBox(
              //   height: 60,
              //   child: Image.asset(AppAssets.emailHere),
              // ),
              CommonSpaces.spaceVertical30,
              Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  AppStrings.email,
                  style: CommonTextStyle.BlueColorBold,
                ),
              ),
              CommonTextField(
                controller: controller.email,
                bordercolor: AppColors.colorC1c1,
                disableBorderColor: AppColors.colorC1c1,
                textColor: AppColors.blackColor,
                validator: (value) {
                  if (value.toString().isEmpty) {
                    return 'This filed is required';
                  } else {
                    return null;
                  }
                },
              ),
              CommonSpaces.spaceVertical50,
              CommonButton(
                width: Get.width / 1,
                onPressed: () async {
                  // Get.to(() => EmailVerify());
                  if (formKey.currentState!.validate()) {
                    await controller
                        .sendVerificationCode(controller.email.text);
                  }
                },
                textStyle: CommonTextStyle.signupColor,
                fillColor: Colors.red,
                text: 'Recover Password',
                textColor: Colors.white,
              ),
            ],
          ).marginSymmetric(horizontal: 40),
        ),
      ),
    );
  }
}
