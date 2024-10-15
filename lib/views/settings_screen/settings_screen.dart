import 'package:emergency_time/constants/app_assets/app_icon.dart';
import 'package:emergency_time/utils/libraries/app_libraries.dart';
import 'package:emergency_time/views/feedback_screen/feedback_screen.dart';
import 'package:emergency_time/views/settings_screen/setting_screen_controller.dart';
import 'package:emergency_time/views/settings_screen/local_widget/setting_tile.dart';
import 'package:emergency_time/widgets/common_scaffold/common_scaffold.dart';
import 'package:emergency_time/widgets/common_textstyle/common_text_style.dart';
import 'package:flutter/cupertino.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SettingScreenController settingScreenController =
        Get.put(SettingScreenController());

    return CommonScaffold(
      appBar: AppBar(
        leading: InkWell(
          child: Image.asset(
            AppIcons.backIcon,
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Settings",
          style: CommonTextStyle.appBarTitle,
        ),
      ),
      body: ListView(
        children: [
          ListTile(
            leading:
                Image.asset(AppIcons.settingNotificationSettings, height: 24),
            title: Text(
              "Notification Setting",
              style: CommonTextStyle.settingTitleText,
            ),
            trailing: Obx(
              () => CupertinoSwitch(
                value: settingScreenController.switchValue.value,
                onChanged: (value) {
                  settingScreenController.toggleSwitch();
                },
              ),
            ),
          ),
          /* SettingTile(
            leading: AppIcons.settingNotificationSettings,
            title: 'Notification Settings',
          ),*/
          const SettingTile(
            leading: AppIcons.settingChangePassword,
            title: 'Change Password',
          ),
          const SettingTile(
            leading: AppIcons.settingShareApp,
            title: 'Share Our App',
          ),
          SettingTile(
            leading: AppIcons.settingRateApp,
            title: 'Rate Our App',
            onTap: () {
              Get.to(() => const FeedbackScreen());
            },
          ),
          const SettingTile(
            leading: AppIcons.settingTermsAndConditions,
            title: 'Terms and Conditions',
          ),
          const SettingTile(
            leading: AppIcons.settingPrivacyPolicy,
            title: 'Privacy Policy',
          ),
          const SettingTile(
            leading: AppIcons.settingLogout,
            title: 'Logout',
          ),
        ],
      ),
    );
  }
}
