import 'package:emergency_time/views/hospital_locator/hospital_locator.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import '../middlewears/auth/auth_middlewear.dart';
import '../views/auth/forgot_password/email_verify/emial_verify_screen.dart';
import '../views/auth/forgot_password/forgot_password_screen.dart';
import '../views/auth/forgot_password/reset_password/reset_password_screen.dart';
import '../views/auth/forgot_password/reset_success/reset_success_screen.dart';
import '../views/auth/login/login_screen.dart';
import '../views/auth/signup/signup_screen.dart';
import '../views/chatbot_screen/chat_bot_screen.dart';
import '../views/dashboard_screen/dash_board_screen.dart';
import '../views/get_started_screen/get_started_screen.dart';
import '../views/guest_or_login/gues_or_login.dart';
import '../views/splash_screen/splash_screen.dart';
import 'app_routes.dart';

class AppPages {
  static var initial = Routes.splashScreen;

  static final routes = [
    //Splash screen
    GetPage(
      name: Routes.splashScreen,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: Routes.getStartedScreen,
      page: () => const GetStartedScreen(),
    ),
    //Login screen
    GetPage(
      name: Routes.loginScreen,
      page: () => LoginScreen(),
    ),

    GetPage(
      name: Routes.chatBotScreen,
      page: () => const ChatBotScreen(),
    ),

    //Sign up screen
    GetPage(
      name: Routes.signUpScreen,
      page: () => SignUpScreen(),
    ),

    //Forgot Password screen
    GetPage(
      name: Routes.forgotPasswordScreen,
      page: () => ForgotPassword(),
    ),

    //Verify Email screen
    GetPage(
      name: Routes.emailVerificationScreen,
      page: () => EmailVerify(),
    ),

    //Reset Password screen
    GetPage(
      name: Routes.resetPasswordScreen,
      page: () => ResetPassword(),
    ),

    //Reset Password screen
    GetPage(
      name: Routes.successReset,
      page: () => const ResetPasswordSuccess(),
    ),

    GetPage(
      name: Routes.dashboardScreen,
      page: () => const DashboardScreen(),
      middlewares: [
        AuthMiddleware(),
      ],
    ),

    //create post screen
    GetPage(
      name: Routes.guestOrLoginScreen,
      page: () => const GuestOrLogin(),
    ),
    GetPage(
      name: Routes.hospitalLocatorScreen,
      page: () => const HospitalLocatorScreen(),
    ),
    //
    // //profile page screen
    //Law show screen
  ];
}
