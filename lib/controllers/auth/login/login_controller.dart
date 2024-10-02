import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../constants/app_strings/app_strings.dart';
import '../../../mixin_classes/localstorage_abstract.dart';
import '../../../utils/api/apis_url.dart';
import '../../../utils/libraries/app_libraries.dart';
import '../../../views/dashboard_screen/dash_board_screen.dart';
import '../../../widgets/common_toast/common_toast.dart';

class LoginController extends GetxController with InitializeLocalStorage {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  RxBool rememberMe = false.obs;
  RxBool isLoading = false.obs;
  RxBool secureText = true.obs;

  Future<void> loginUser() async {
    try {
      isLoading.value = true; // Show loading indicator

      final Uri url = Uri.parse(ApiData.login);
      if (kDebugMode) {
        print("Login user request URL: $url");
      }

      // Prepare headers and body
      final Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      };

      final Map<String, String> body = {
        "email": email.text,
        "password": password.text, // Ensure consistent key casing
      };

      final String bodyJson = jsonEncode(body);

      // Make POST request
      final http.Response res = await http
          .post(
            url,
            headers: headers,
            body: bodyJson,
          )
          .timeout(const Duration(seconds: 20)); // Timeout after 20 seconds

      // Debug response
      if (kDebugMode) {
        print("Response status: ${res.statusCode}");
        print("Response body: ${res.body}");
      }

      // Handle response based on status code
      switch (res.statusCode) {
        case 200:
          handleSuccess(res.body);
          break;
        case 401:
          CommonToast.showToast(AppStrings.incorrectCredentials);
          break;
        default:
          CommonToast.showToast(AppStrings.somethingWentWrong);
      }
    } on TimeoutException catch (e) {
      CommonToast.showToast(AppStrings.unableToConnect);
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

// Handle successful login response
  void handleSuccess(String responseBody) {
    if (kDebugMode) {
      print('loginResponse<<<<<<<<<<<<<<$responseBody');
    }
    final Map<String, dynamic> data = jsonDecode(responseBody);
    // storage.write(AppKeys.userIdKey, data["User_id"]);

    storage.write('token', data["access_token"]);
    storage.write('tokenType', data["token_type"]);
    storage.write('userEmail', email.text);
    storage.write('moderator', data['user']["is_moderator"]);

    print('tokenKey>>>>>${storage.read('token')}');
    print('tokenType>>>>>${storage.read('tokenType')}');

    if (rememberMe.value == true) {
      storage.write("isAppOpen", 'true');
    }

    if (kDebugMode) {
      print('isAppOpen>>>>>>>>>>${storage.read('isAppOpen')}');
    }
    CommonToast.showToast(AppStrings.loginSuccess);
    print('moderator>>>>>${storage.read('moderator')}');
    // Navigate to Dashboard
    Get.offAll(() => const DashboardScreen());
  }
}
