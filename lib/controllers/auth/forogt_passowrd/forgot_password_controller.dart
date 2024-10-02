import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../routes/app_routes.dart';
import '../../../utils/api/apis_url.dart';
import '../../../utils/libraries/app_libraries.dart';
import '../../../widgets/common_toast/common_toast.dart';

class ForgotPasswordController extends GetxController {
  TextEditingController email = TextEditingController();
  RxBool isLoading = false.obs;

  // RxList to hold response data
  Map bodyData = {};

  Future<void> sendVerificationCode(String email) async {
    print('email>>>>>>$email');
    try {
      isLoading.value = true;

      Uri url = Uri.parse(ApiData.forgotPassword);
      if (kDebugMode) {
        print("Sending verification code to: $email");
        print("URL: $url");
      }

      // Prepare headers
      var headers = <String, String>{
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      };

      // Prepare request body
      var body = jsonEncode({
        'email': email,
      });

      // Make POST request with timeout
      var response = await http
          .post(url, headers: headers, body: body)
          .timeout(const Duration(seconds: 20));

      print("Response status code: ${response.statusCode}");
      print("Response body: ${response.body}");

      // Handle response
      if (response.statusCode == 200) {
        CommonToast.showToast('Verification code sent successfully.');

        // Parse response body into a Map<String, dynamic>
        Map<String, dynamic> data = jsonDecode(response.body);

        // Add the parsed data to the RxList<Map<String, dynamic>>
        bodyData.addAll(data);
        Get.toNamed(Routes.resetPasswordScreen,
            arguments: {"token": bodyData['reset_token']});
        if (kDebugMode) {
          print('Token stored: ${bodyData['reset_token']}');
        }
      } else {
        CommonToast.showToast(
            'Failed to send verification code. Server error: ${response.statusCode}');
      }
    } on TimeoutException catch (e) {
      CommonToast.showToast('Request timed out. Please try again.');
      print("Request timed out: $e");
    } on http.ClientException catch (e) {
      CommonToast.showToast('Network error. Please check your connection.');
      print("Client-side error occurred: $e");
    } catch (e) {
      CommonToast.showToast('An unexpected error occurred.');
      print("Error occurred during request: $e");
    } finally {
      isLoading.value = false;
    }
  }
}
