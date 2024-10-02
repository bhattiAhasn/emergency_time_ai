import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/app_assets/app_assets.dart';
import '../../../constants/app_colors/app_colors.dart';
import '../../../mixin_classes/localstorage_abstract.dart';
import '../../../widgets/common_spaces/common_spaces.dart';
import '../../../widgets/common_textstyle/common_text_style.dart';

class CommonDrawer extends StatelessWidget with InitializeLocalStorage {
  CommonDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: Get.width / 1.4,
      backgroundColor: AppColors.white,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(
            height: Get.height / 4,
            width: Get.width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  AppAssets.logo,
                ),
                fit: BoxFit.fill,
              ),
            ),
          ),
          CommonSpaces.spaceVertical10,
          // DrawerTileWidget(
          //   leading: Image.asset(
          //       AppAssets.kingIcon2,
          //     ),
          //     title: 'Get Premium',
          // ),
          // DrawerTileWidget(
          //   leading: Image.asset(
          //     AppAssets.privacyIcon,
          //     // height: 23,
          //     // width: 29,
          //   ),
          //   title: 'Account Privacy',
          // ),
          //
          // //////////Share /////////
          // DrawerTileWidget(
          //   leading: Image.asset(
          //     AppAssets.shareIcon,
          //   ),
          //   title: 'Share',
          // ),
          //
          // DrawerTileWidget(
          //   onTap: () {
          //     rateUsDialog(context);
          //   },
          //   leading: Image.asset(
          //     AppAssets.rateUs,
          //   ),
          //   title: 'Rate Us',
          // ),
          // DrawerTileWidget(
          //   onTap: () {
          //     launchURL(
          //         'https://play.google.com/store/apps/developer?id=Maida+Global+Apps');
          //   },
          //   leading: Image.asset(
          //     AppAssets.moreApps,
          //   ),
          //   title: 'More Apps',
          // ),
          //
          // DrawerTileWidget(
          //   onTap: () {
          //     launchURL(
          //         'https://docs.google.com/document/d/1EpGvpxZYCwi8DwU5F1CgyYeO58TQkghhyhQNjG0z3_U');
          //   },
          //   leading: Image.asset(
          //     AppAssets.privacyPolicy,
          //   ),
          //   title: 'Privacy Policy',
          // ),
          Row(
            children: [
              // Image.asset(
              //   AppAssets.privacyPolicy,
              //   height: 23,
              //   width: 29,
              // ),
              const SizedBox(
                width: 15,
              ),
              Text(
                'Privacy Policy',
                style: CommonTextStyle.drawerFont,
              )
            ],
          ).marginOnly(left: 15),
          // CommonSpaces.spaceVertical20,
          // storage.hasData(AppKeys.userIdKey) == true
          //     ? GetBuilder<DashboardScreenController>(
          //         builder: (dashboardScreenController) {
          //         return DrawerTileWidget(
          //           onTap: () {
          //             dashboardScreenController.logoutUser();
          //           },
          //           leading:
          //               const Icon(Icons.logout_rounded, color: Colors.black54),
          //           title: 'Logout',
          //         );
          //         // GestureDetector(
          //         //     onTap: () {
          //         //       dashboardScreenController.logoutUser();
          //         //     },
          //
          //         //     child: Row(
          //         //       children: [
          //         //         const Icon(Icons.logout_rounded, color: Colors.black54),
          //         //         const SizedBox(
          //         //           width: 15,
          //         //         ),
          //         //         Text(
          //         //           'Logout',
          //         //           style: CommonTextStyle.drawerFont,
          //         //         )
          //         //       ],
          //         //     ).marginOnly(left: 15),
          //         //   );
          //       })
          //     : DrawerTileWidget(
          //         onTap: () {
          //           Get.offAll(() => const SplashScreen());
          //         },
          //         leading: const Icon(
          //           Icons.login,
          //           color: Colors.black54,
          //         ),
          //         title: 'Login',
          //       ),
        ],
      ),
    );
  }

  // Future<void> launchURL(String url) async {
  //   if (await canLaunchUrl(Uri.parse(url))) {
  //     await launchUrl(Uri.parse(url));
  //   } else {
  //     throw 'Could not launch $url';
  //   }
  // }
  //
  // void rateUsDialog(BuildContext context) {
  //   double rating = 5.0;
  //
  //   Get.dialog(
  //     AlertDialog(
  //       // backgroundColor: Colors.white,
  //       surfaceTintColor: Colors.white,
  //       shape: RoundedRectangleBorder(
  //         borderRadius:
  //             BorderRadius.circular(10), // Adjust the border radius as needed
  //       ),
  //       contentPadding: EdgeInsets.zero,
  //       content: SizedBox(
  //         height: Get.height / 2.5,
  //         width: Get.width,
  //         child: Column(
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           children: [
  //             Image.asset(
  //               AppAssets.smartyLogo,
  //               width: 81,
  //             ),
  //             const SizedBox(
  //               height: 30,
  //             ),
  //             RatingBar.builder(
  //               initialRating: rating,
  //               minRating: 1,
  //               direction: Axis.horizontal,
  //               allowHalfRating: true,
  //               itemCount: 5,
  //               itemSize: 50,
  //               itemBuilder: (context, _) => const Icon(
  //                 Icons.star,
  //                 color: Colors.amber,
  //               ),
  //               onRatingUpdate: (newRating) {
  //                 rating = newRating;
  //               },
  //             ),
  //             const SizedBox(
  //               height: 30,
  //             ),
  //             CommonButton(
  //               width: Get.width / 2,
  //               height: 45,
  //               text: 'Submit',
  //               textStyle: CommonTextStyle.signupColor,
  //               onPressed: () {
  //                 // if (rating <= 3.0) {
  //                 BotToast.showText(text: 'Thank you for rating the app.');
  //                 // } else {
  //                 //   launchRateApp();
  //                 // rateAndReviewApp();
  //                 // }
  //                 Navigator.of(context).pop(); // Close the dialog
  //               },
  //               fillColor: Colors.red,
  //             ),
  //             const SizedBox(
  //               height: 20,
  //             ),
  //             InkWell(
  //               onTap: () {
  //                 Get.back();
  //               },
  //               child: Text(
  //                 'No Thanks',
  //                 style: CommonTextStyle.font14weightNormal342f,
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //     barrierDismissible: true,
  //   );
  // }
}
