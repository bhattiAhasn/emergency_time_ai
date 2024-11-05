import 'package:emergency_time/constants/app_assets/app_assets.dart';
import 'package:emergency_time/views/dashboard_screen/dash_board_screen.dart';
import 'package:emergency_time/views/select_country/select_contry_screen.dart';
import 'package:emergency_time/widgets/text_widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../constants/app_colors/app_colors.dart';
import '../../../constants/app_strings/app_strings.dart';
import '../../../controllers/auth/login/login_controller.dart';
import '../../../mixin_classes/keys_variables_abstract.dart';
import '../../../mixin_classes/localstorage_abstract.dart';
import '../../../mixin_classes/validate_email/validate_email.dart';
import '../../../widgets/common_buttons/common_button.dart';
import '../../../widgets/common_scaffold/common_scaffold.dart';
import '../../../widgets/common_spaces/common_spaces.dart';
import '../../../widgets/common_textfields/commn_textfield.dart';
import '../../../widgets/common_textstyle/common_text_style.dart';
import '../forgot_password/forgot_password_screen.dart';
import '../signup/signup_screen.dart';

// ignore: must_be_immutable
class LoginScreen extends StatelessWidget
    with CommonVariables, ValidateUserEmail, InitializeLocalStorage {
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CommonScaffold(
        backgroundColor: AppColors.redSplashColor, // Updated to red color

        body: bodyData(),
      ),
    );
  }

  bodyData() {
    LoginController loginController = Get.put(LoginController());

    return SizedBox(
      height: Get.height,
      width: Get.width,
      // color: Colors.white,
      child: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 40,
              ),
              Center(
                  child: Image.asset(
                AppAssets.logo,
                height: 189,
              )),
              // const SizedBox(height: 10),

              CommonSpaces.spaceVertical40,

              CommonTextField(
                hintText: 'Email',
                controller: loginController.email,
                focus: FocusNode(),
                bordercolor: AppColors.colorC1c1,
                disableBorderColor: AppColors.colorC1c1,
                textColor: AppColors.blackColor,
                validator: (value) {
                  if (value.toString().isEmpty) {
                    return 'This filed is required';
                  }
                  return null;
                },
              ),
              CommonSpaces.spaceVertical20,

              Obx(
                () => CommonTextField(
                  hintText: 'Password',
                  controller: loginController.password,
                  bordercolor: AppColors.colorC1c1,
                  disableBorderColor: AppColors.colorC1c1,
                  textColor: AppColors.blackColor,
                  isTextHidden: secureText.value,
                  togglePassword: true,
                  inputFormatters: [
                    FilteringTextInputFormatter.deny(RegExp(r"\s\b|\b\s"))
                  ],
                  toggleIcon: secureText.value == true
                      ? Icons.visibility_off
                      : Icons.remove_red_eye,
                  toggleFunction: () {
                    secureText.value = !secureText.value;
                    // loginController.update();
                  },
                  validator: (value) {
                    if (value.toString().isEmpty) {
                      return 'This filed is required';
                    } else if (isPasswordEmpty(value.toString()) != null) {
                      return isPasswordEmpty(value.toString());
                    }
                    return null;
                  },
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: TextButton(
                  onPressed: () {
                    Get.to(ForgotPassword());
                    // Get.toNamed(Routes.forgotPasswordScreen);
                  },
                  child: Text(
                    "Forgot Password?",
                    style: CommonTextStyle.authEmailNormalText,
                  ),
                ),
              ),

              // CommonSpaces.spaceVertical10,
              //Remember me
              Row(
                children: [
                  Obx(() => CheckboxMenuButton(
                      style: const ButtonStyle(
                          foregroundColor:
                              MaterialStatePropertyAll(AppColors.appColor)),
                      value: loginController.rememberMe.value,
                      onChanged: (val) {
                        if (loginController.rememberMe.value == false) {
                          loginController.rememberMe.value = true;
                        } else {
                          loginController.rememberMe.value = false;
                        }
                      },
                      child: Text(
                        'Keep me signed in',
                        style: CommonTextStyle.font16weight4005252NexRegular,
                      ))),
                ],
              ),

              //Login button
              CommonSpaces.spaceVertical30,

              CommonButton(
                width: Get.width / 1,
                text: 'Login',
                textStyle: CommonTextStyle.signupColor,
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    await loginController.loginUser();
                  }
                },
                fillColor: Colors.red,
                textColor: Colors.white,
              ),
              CommonSpaces.spaceVertical40,

              InkWell(
                onTap: () {
                  Get.to(() => SignUpScreen());
                },
                child: const Center(
                  child: MyText(
                    "Don’t have an account,Register Here?",
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
                    fontSize: 11,
                  ),
                  MyText(
                    'Terms & Conditions',
                    color: Color(0xff14BFFF),
                    fontWeight: FontWeight.w400,
                    fontSize: 11,
                  )
                ],
              ),
              CommonSpaces.spaceVertical30,
            ],
          ).marginSymmetric(horizontal: 40),
        ),
      ),
    );
  }
}
