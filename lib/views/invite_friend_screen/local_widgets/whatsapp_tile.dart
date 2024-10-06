import 'package:emergency_time/constants/app_assets/app_assets.dart';
import 'package:emergency_time/constants/app_assets/app_icon.dart';
import 'package:emergency_time/utils/libraries/app_libraries.dart';

import '../../../../widgets/common_textstyle/common_text_style.dart';

class WhatsappTile extends StatelessWidget {

  final String name;
  final String imagePath;

  const WhatsappTile({super.key, required this.name, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Stack(
            children: [
              /*Image.asset(
                imagePath,
                height: 72,
                width: 72,
              ),*/
              CircleAvatar(
                radius: 35,
                child: Image.asset(imagePath, width: 80, height: 80,fit: BoxFit.cover,),
              ),
              Positioned(
                bottom: 1,
                right: 7,
                child: CircleAvatar(
                  radius: 7,
                  child: Image.asset(AppIcons.whatsappIcon,),
                ),
              ),
            ]

          ),
          const SizedBox(height: 10),
          Text(
            name,
            style: CommonTextStyle.lightGreySubTitle,
          ),
        ],
      ),
    );
  }
}
