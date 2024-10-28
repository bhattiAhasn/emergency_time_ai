import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../routes/app_routes.dart';

class SplashScreenController extends GetxController {
  final storage = GetStorage();

  @override
  void onReady() {
    super.onReady(); // Call super to ensure proper lifecycle management
    Future.delayed(const Duration(seconds: 3), () {
      final isSkip = storage.read('isSkip') ?? false;
      isSkip
          ? Get.offNamed(Routes
              .loginScreen) // Use Get.offNamed to prevent back navigation to SplashScreen
          : Get.offNamed(Routes.getStartedScreen);
    });
  }
}
