import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

// Import your constants, routes, and other utilities
import '../../../constants/app_assets/app_assets.dart';
import '../../../constants/app_keys/app_keys.dart';
import '../../../constants/app_strings/app_strings.dart';
import '../../../mixin_classes/localstorage_abstract.dart';
import '../../../routes/app_routes.dart';
import '../../../utils/api/apis_url.dart';
import '../../../utils/libraries/app_libraries.dart';
import '../../../widgets/common_spaces/common_spaces.dart';
import '../../../widgets/common_textstyle/common_text_style.dart';
import '../../../widgets/common_toast/common_toast.dart';

class SignUpController extends GetxController with InitializeLocalStorage {
  final TextEditingController username = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();
  final RxBool isLoading = false.obs;

  Future<void> registerUser() async {
    try {
      isLoading.value = true; // Show loading indicator

      final Uri url = Uri.parse(ApiData.registerUser);
      if (kDebugMode) {
        print("Register user request URL: $url");
      }

      // Prepare headers and body
      final Map<String, String> headers = {
        "Content-Type": "application/json",
      };

      final Map<String, String> body = {
        'name': username.text,
        'email': email.text,
        'username': username.text,
        'password': password.text,
        'password_confirmation':
            confirmPassword.text, // Assuming confirmation needed
      };

      final String bodyJson = jsonEncode(body);

      // Make POST request
      final http.Response res = await http
          .post(
            url,
            headers: headers,
            body: bodyJson,
          )
          .timeout(const Duration(seconds: 30)); // Timeout after 30 seconds

      // Debug response
      if (kDebugMode) {
        print("Response status: ${res.statusCode}");
        print("Response body: ${res.body}");
      }

      // Handle response based on status code
      switch (res.statusCode) {
        case 201:
        case 200:
          _handleSuccess(res.body);
          break;
        case 400:
          CommonToast.showToast(AppStrings.alreadyRegister);
          break;
        default:
          CommonToast.showToast(AppStrings.somethingWentWrong);
      }
    } on TimeoutException catch (e) {
      CommonToast.showToast(AppStrings.somethingWentWrong);
      if (kDebugMode) print("Request timed out: $e");
    } on http.ClientException catch (e) {
      CommonToast.showToast(AppStrings.connectionNotStable);
      if (kDebugMode) print("Client-side error occurred: $e");
    } catch (e) {
      CommonToast.showToast(AppStrings.somethingWentWrong);
      if (kDebugMode) print("Error occurred during request: $e");
    } finally {
      isLoading.value = false; // Hide loading indicator
      update(); // Update UI
    }
  }

  // Handle successful registration response
  void _handleSuccess(String responseBody) {
    final Map<String, dynamic> data = jsonDecode(responseBody);

    // Access 'user' and 'token' fields based on response structure
    final email = data["user"]?["email"] ?? "";
    final userName = data["user"]?["name"] ?? "";
    final token = data["token"] ?? "";
    final userId = data["user"]?["id"] ?? "";

    // Only write to storage if the values are not null or empty
    if (email.isNotEmpty) storage.write(AppKeys.userEmailKey, email);
    if (userName.isNotEmpty) storage.write(AppKeys.usernameKey, userName);
    if (token.isNotEmpty) storage.write('token', token);
    if (userId != null) storage.write('userId', userId.toString());

    storage.write(AppKeys.isAppOpenKey, "true");

    print("Stored username: ${storage.read(AppKeys.usernameKey)}");

    signUpDialog();

    Future.delayed(const Duration(seconds: 2), () {
      Get.offAndToNamed(Routes.loginScreen);
      if (kDebugMode) {
        print('Is app open: ${storage.read(AppKeys.isAppOpenKey)}');
      }
    });
  }

  // Show Sign-up Success Dialog
  void signUpDialog() {
    Get.dialog(
      AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        contentPadding: EdgeInsets.zero,
        content: SizedBox(
          height: Get.height / 4.8,
          width: Get.width / 1.6,
          child: Column(
            children: [
              CommonSpaces.spaceVertical10,
              Text(
                'Signup',
                style: CommonTextStyle.EditProfileFont,
              ),
              CommonSpaces.spaceVertical10,
              CommonSpaces.spaceVertical20,
              Text(
                'Congratulations!',
                style: CommonTextStyle.EditProfileFont,
              ),
              CommonSpaces.spaceVertical10,
              Text(
                'Account has been created successfully',
                style: CommonTextStyle.font12weightNormal342f,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
