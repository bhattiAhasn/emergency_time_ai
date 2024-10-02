import 'package:bot_toast/bot_toast.dart';
import 'package:emergency_time/routes/app_pagess.dart';
import 'package:emergency_time/services/auth_service/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initServices();
  await dotenv.load(fileName: "assets/.env");
  runApp(const MyApp());
}

Future<void> initServices() async {
  await GetStorage.init();
  // bio
  AuthService auth = AuthService();
  await Get.putAsync(() => auth.init());
  // await Get.putAsync(() => bio.init());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: const ColorScheme.light(
              surface: Colors.white, onSurface: Colors.white),
          primarySwatch: Colors.blue,
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white,
            elevation: 0,
            scrolledUnderElevation: 0,
          ),
        ),
        title: '',
        defaultTransition: Get.defaultTransition,
        initialRoute: AppPages.initial,
        builder: BotToastInit(),
        navigatorObservers: [BotToastNavigatorObserver()],
        getPages: AppPages.routes);
  }
}
