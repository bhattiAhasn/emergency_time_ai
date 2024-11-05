import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../routes/app_routes.dart';

class SplashScreenController extends GetxController {
  final GetStorage storage = GetStorage();

  @override
  void onReady() {
    super.onReady();
    Future.delayed(const Duration(seconds: 3), () {
      final bool isSkip = storage.read('isSkip') ?? false;
      final String nextRoute =
          isSkip ? Routes.loginScreen : Routes.getStartedScreen;
      Get.offNamed(nextRoute);
    });
  }
}
