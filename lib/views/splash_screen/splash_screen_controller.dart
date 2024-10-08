import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../routes/app_routes.dart';

class SplashScreenController extends GetxController {
  final storage = GetStorage();
  @override
  void onReady() {
    Future.delayed(const Duration(seconds: 3), () {
      Get.toNamed(Routes.getStartedScreen);
    });
  }
}
