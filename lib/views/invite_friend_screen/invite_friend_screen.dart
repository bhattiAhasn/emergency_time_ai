import 'package:emergency_time/constants/app_assets/app_assets.dart';
import 'package:emergency_time/constants/app_assets/app_icon.dart';
import 'package:emergency_time/views/invite_friend_screen/local_widgets/contacts_textfield.dart';
import 'package:emergency_time/views/invite_friend_screen/local_widgets/whatsapp_tile.dart';
import 'package:emergency_time/widgets/common_spaces/common_spaces.dart';
import 'package:emergency_time/widgets/common_textstyle/common_text_style.dart';

import '../../../utils/libraries/app_libraries.dart';

class InviteFriendScreen extends StatelessWidget {
  const InviteFriendScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.redSplashColor,
      appBar: AppBar(
        leading: InkWell(
            child: Icon(Icons.arrow_back,
              color: Colors.white,),
        onTap: (){
              Get.back();
        },),
        backgroundColor: AppColors.redSplashColor,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 16.0, left: 16.0),
            child: Text("Invite Friends", style: CommonTextStyle.whiteTitle,),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, left: 16.0),
            child: Text("Invite friends & family and earn ₹500", style: CommonTextStyle.whiteSubTitle,),
          ),
          CommonSpaces.spaceVertical30,
          Padding(
            padding: const EdgeInsets.only(top: 8.0, left: 16.0),
            child: Text("Whatsapp Friends", style: CommonTextStyle.lightGreySubTitle,),
          ),
          CommonSpaces.spaceVertical10,
          SizedBox(
            height: 120,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: const [
                WhatsappTile(name: "Sherlin", imagePath: AppAssets.visitDr1),
                WhatsappTile(name: "Adam", imagePath: AppAssets.visitDr4),
                WhatsappTile(name: "Komal", imagePath: AppAssets.visitDr2),
                WhatsappTile(name: "Gary", imagePath: AppAssets.visitDr3),
                WhatsappTile(name: "Wilson", imagePath: AppAssets.visitDr1),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, left: 16.0),
            child: Text("Share on Social Media", style: CommonTextStyle.lightGreySubTitle,),
          ),
          SizedBox(
            height: 100,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                buildIconTile(AppIcons.whatsappIcon),
                buildIconTile(AppIcons.facebookIcon),
                buildIconTile(AppIcons.twitterIcon),
                buildIconTile(AppIcons.messengerIcon),
                buildIconTile(AppIcons.linkedinIcon),
              ],
            ),
          ),
          CommonSpaces.spaceVertical10,
          const Padding(
            padding: EdgeInsets.all(12.0),
            child: ContactsTextfield(),
          ),
          CommonSpaces.spaceVertical10,
          Expanded(child: Image.asset(AppAssets.shareWithFriendsImage))
        ],
      ),
    );
  }
  
  Widget buildIconTile(String iconPath) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CircleAvatar(
        radius: 27,
        child: Image.asset(iconPath),
      ),
    );
  }

}
