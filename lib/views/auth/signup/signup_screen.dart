import 'package:bot_toast/bot_toast.dart';
import 'package:emergency_time/views/select_country/select_contry_screen.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../constants/app_assets/app_assets.dart';
import '../../../constants/app_colors/app_colors.dart';
import '../../../constants/app_strings/app_strings.dart';
import '../../../controllers/auth/signup/signup_controller.dart';
import '../../../mixin_classes/keys_variables_abstract.dart';
import '../../../mixin_classes/validate_email/validate_email.dart';
import 'package:flutter/material.dart';
import '../../../widgets/common_buttons/common_button.dart';
import '../../../widgets/common_scaffold/common_scaffold.dart';
import '../../../widgets/common_spaces/common_spaces.dart';
import '../../../widgets/common_textfields/commn_textfield.dart';
import '../../../widgets/common_textstyle/common_text_style.dart';
import '../../../widgets/text_widget/text_widget.dart';
import '../login/login_screen.dart';

// ignore: must_be_immutable
class SignUpScreen extends StatelessWidget
    with CommonVariables, ValidateUserEmail {
  SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      backgroundColor: AppColors.redSplashColor,
      body: bodyData(context),
    );
  }

  Widget bodyData(BuildContext context) {
    final SignUpController controller = Get.put(SignUpController());

    return SafeArea(
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              Center(
                  child: Image.asset(
                AppAssets.logo,
                height: 189,
              )),
              CommonSpaces.spaceVertical40,
              CommonTextField(
                hintText: 'Full Name',
                controller: controller.username,
                bordercolor: AppColors.colorC1c1,
                disableBorderColor: AppColors.colorC1c1,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'This field is required';
                  }
                  return null;
                },
                cursorColor: Colors.black,
              ),
              CommonSpaces.spaceVertical10,
              CommonTextField(
                hintText: 'Email',
                controller: controller.email,
                bordercolor: AppColors.colorC1c1,
                disableBorderColor: AppColors.colorC1c1,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'This field is required';
                  } else if (!isValidEmail(value)) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
                cursorColor: Colors.black,
              ),
              CommonSpaces.spaceVertical10,
              Obx(
                () => CommonTextField(
                  hintText: 'Password',
                  controller: controller.password,
                  bordercolor: AppColors.colorC1c1,
                  disableBorderColor: AppColors.colorC1c1,
                  textColor: AppColors.blackColor,
                  isTextHidden: secureText.value,
                  togglePassword: true,
                  inputFormatters: [
                    FilteringTextInputFormatter.deny(RegExp(r"\s")),
                  ],
                  toggleIcon: secureText.value
                      ? Icons.visibility_off
                      : Icons.remove_red_eye,
                  toggleFunction: () {
                    secureText.value = !secureText.value;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'This field is required';
                    } else if (isPasswordEmpty(value) != null) {
                      return isPasswordEmpty(value);
                    }
                    return null;
                  },
                  cursorColor: Colors.black,
                ),
              ),
              CommonSpaces.spaceVertical10,
              Obx(
                () => CommonTextField(
                  hintText: 'Confirm Password',
                  controller: controller.confirmPassword,
                  bordercolor: AppColors.colorC1c1,
                  disableBorderColor: AppColors.colorC1c1,
                  textColor: AppColors.blackColor,
                  isTextHidden: secureText2.value,
                  togglePassword: true,
                  inputFormatters: [
                    FilteringTextInputFormatter.deny(RegExp(r"\s")),
                  ],
                  toggleIcon: secureText.value
                      ? Icons.visibility_off
                      : Icons.remove_red_eye,
                  toggleFunction: () {
                    secureText.value = !secureText.value;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'This field is required';
                    } else if (isPasswordEmpty(value) != null) {
                      return isPasswordEmpty(value);
                    }
                    return null;
                  },
                  cursorColor: Colors.black,
                ),
              ),
              CommonSpaces.spaceVertical50,
              CommonButton(
                width: Get.width,
                text: 'Register',
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    if (controller.password.text ==
                        controller.confirmPassword.text) {
                      controller.registerUser();
                      // controller.registerUser(
                      //     controller.username.text,
                      //     controller.email.text,
                      //     controller.username.text,
                      //     controller.password.text);
                    } else {
                      BotToast.showText(text: AppStrings.passwordNotMatch);
                    }
                  }
                },
                fillColor: Colors.red,
                textStyle: CommonTextStyle.signupColor,
                textColor: Colors.white,
              ),
              CommonSpaces.spaceVertical30,
              InkWell(
                onTap: () {
                  Get.to(() => LoginScreen());
                },
                child: const Center(
                  child: MyText(
                    "Already Have an Account, Login Here",
                    color: AppColors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                  ),
                ),
              ),
              CommonSpaces.spaceVertical10,
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  MyText(
                    "By Continuing, you agree to our ",
                    color: AppColors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 13,
                  ),
                  MyText(
                    'Terms & Conditions',
                    color: Color(0xff14BFFF),
                    fontWeight: FontWeight.w400,
                    fontSize: 13,
                  )
                ],
              ),
            ],
          ).marginSymmetric(horizontal: 20),
        ),
      ),
    );
  }
}
