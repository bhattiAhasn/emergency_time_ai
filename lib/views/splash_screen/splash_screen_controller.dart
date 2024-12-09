import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../routes/app_routes.dart';

class SplashScreenController extends GetxController {
  final GetStorage storage = GetStorage();

  @override
  void onReady() {
    super.onReady();
    Future.delayed(const Duration(seconds: 3), () {
      print('pakistan>>>>>>${storage.read('pakistan')}');
      print('united>>>>>>${storage.read('united')}');
      // Read values from storage
      final isSkipValue = storage.read('isSkip');
      final openAppValue = storage.read('isAppOpen');

      // Convert to bool if they are not already booleans
      final bool isSkip =
          (isSkipValue is bool) ? isSkipValue : (isSkipValue == 'true');
      final bool openApp =
          (openAppValue is bool) ? openAppValue : (openAppValue == 'true');

      // Determine the next route based on the isSkip and openApp values
      String nextRoute;
      if (!isSkip) {
        nextRoute =
            Routes.getStartedScreen; // Show Get Started screen for new users
      } else {
        nextRoute = openApp ? Routes.dashboardScreen : Routes.loginScreen;
      }

      // Navigate to the determined route
      Get.offNamed(nextRoute);
    });
  }
}
