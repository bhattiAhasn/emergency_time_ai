import 'package:emergency_time/views/book_appointment_screen/book_apointment_screen.dart';
import 'package:emergency_time/views/doctor_details_screen/doctor_detail_screen.dart';
import 'package:emergency_time/views/doctor_listing_screen/doctor_listing_screen.dart';
import 'package:emergency_time/views/doctor_listing_screen/local_widgets/filters_screen.dart';
import 'package:emergency_time/views/feedback_screen/feedback_screen.dart';
import 'package:emergency_time/views/hospital_locator/hospital_locator.dart';
import 'package:emergency_time/views/appointment_screen/appointment_screen.dart';
import 'package:emergency_time/views/invite_friend_screen/invite_friend_screen.dart';
import 'package:emergency_time/views/profile/profile_screen.dart';
import 'package:emergency_time/views/settings_screen/settings_screen.dart';
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
import '../views/select_country/select_contry_screen.dart';
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
      page: () => HospitalLocatorScreen(),
    ),
    //
    // //profile page screen
    //Law show screen

    // drawer route
    GetPage(
      name: Routes.settingsScreen,
      page: () => const SettingsScreen(),
    ),

    GetPage(
      name: Routes.appointmentScreen,
      page: () => const AppointmentScreen(),
    ),

    GetPage(
      name: Routes.inviteFriendScreen,
      page: () => const InviteFriendScreen(),
    ),

    GetPage(
      name: Routes.feedbackScreen,
      page: () => const FeedbackScreen(),
    ),

    GetPage(
      name: Routes.doctorListingScreen,
      page: () => const DoctorListingScreen(),
    ),

    GetPage(
      name: Routes.doctorDetailsScreen,
      page: () => const DoctorDetailScreen(),
    ),

    GetPage(
      name: Routes.bookAppointmentScreen,
      page: () => const BookAppointmentScreen(),
    ),

    GetPage(
      name: Routes.doctorListFilterScreen,
      page: () => const FiltersScreen(),
    ),

    GetPage(
      name: Routes.countriesScreen,
      page: () => const SelectCountryScreen(),
    ),
  ];
}
