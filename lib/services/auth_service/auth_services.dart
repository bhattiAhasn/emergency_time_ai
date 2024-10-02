import 'package:flutter/foundation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import '../../mixin_classes/localstorage_abstract.dart';

class AuthService extends GetxService with InitializeLocalStorage {
  bool loggedInUser = false;

  Future<AuthService> init() async {
    print("calllllllllllllllllllllll auth");
    await checkLogin();
    return this;
  }

  Future<bool> checkLogin() async {
    if (kDebugMode) {
      print(storage.read("isAppOpen"));
    }
    if (storage.hasData("isAppOpen")) {
      loggedInUser = true;
    } else {
      loggedInUser = false;
    }
    return loggedInUser;
  }
}
