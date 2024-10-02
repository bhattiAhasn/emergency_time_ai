import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../routes/app_routes.dart';
import '../../services/auth_service/auth_services.dart';

class AuthMiddleware extends GetMiddleware {
  final GetStorage storage = GetStorage();
  AuthService authService = Get.find<AuthService>();
  @override
  RouteSettings? redirect(String? route) {
    print('value>>>>>>>>>>>>>>>${storage.read("isAppOpen")}');
    print("I am in auth middlewear==================");
    return storage.hasData("isAppOpen") == true
        ? null
        : const RouteSettings(name: Routes.guestOrLoginScreen);
  }
}
