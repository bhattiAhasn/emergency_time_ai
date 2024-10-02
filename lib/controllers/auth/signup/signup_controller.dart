import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
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
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  RxBool isLoading = false.obs;
  // final String baseUrl =
  //     "http://openpolicy1.canadacentral.cloudapp.azure.com:8000";
  // final String registerEndpoint = "/register/";
  //
  // Future<void> registerUser(
  //     String name, String email, String username, String password) async {
  //   print('hellllllo');
  //   final url = Uri.parse(baseUrl + registerEndpoint);
  //   final response = await http.post(
  //     url,
  //     headers: <String, String>{
  //       'Content-Type': 'application/json; charset=UTF-8',
  //     },
  //     body: jsonEncode(<String, String>{
  //       'name': name,
  //       'email': email,
  //       'username': username,
  //       'password': password,
  //     }),
  //   );
  //
  //   if (response.statusCode == 200) {
  //     print("response of register call==============${response.body}");
  //     // Registration successful
  //     print('User registered successfully');
  //   } else {
  //     // Registration failed
  //     print('Failed to register user: ${response.statusCode}');
  //   }
  // }
  // Register user call
  Future<void> registerUser() async {
    try {
      isLoading.value = true; // Show loading indicator

      final Uri url = Uri.parse(ApiData.registerUser);
      if (kDebugMode) {
        print("Register user request URL: $url");
      }

      // Prepare headers and body
      final Map<String, String> headers = {
        'Content-Type': 'application/json; charset=UTF-8',
      };

      final Map<String, String> body = {
        'name': username.text,
        'email': email.text,
        'username': username.text,
        'password': password.text,
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

    storage.write(AppKeys.userEmailKey, data["email"]);
    storage.write(AppKeys.usernameKey, data["username"]);
    storage.write('userId', data["id"]);
    storage.write(AppKeys.isAppOpenKey, "true");

    print("Stored username: ${storage.read("username")}");

    signUpDialog();

    Future.delayed(const Duration(seconds: 2), () {
      Get.offAndToNamed(Routes.loginScreen);
      print('Is app open: ${storage.read('isAppOpen')}');
    });
  }

  void signUpDialog() {
    Get.dialog(
      AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(10), // Adjust the border radius as needed
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
                  'Account has been created successfully',
                  style: CommonTextStyle.font12weightNormal342f,
                ),
              ],
            )),
      ),
    );
  }
}
