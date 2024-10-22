

import 'package:emergency_time/widgets/common_spaces/common_spaces.dart';

import '../../../utils/libraries/app_libraries.dart';
import '../../../widgets/common_textstyle/common_text_style.dart';

class MoreSimilarDoctorTile extends StatelessWidget {

  final String doctorName;
  final String doctorProfileImage;
  final String field;
  final String fee;

  const MoreSimilarDoctorTile({super.key, required this.doctorName, required this.doctorProfileImage, required this.field, required this.fee});


  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 40,
              child: Image.asset(doctorProfileImage),
            ),
            Text(doctorName , style: CommonTextStyle.titleHeading),
            CommonSpaces.spaceVertical6,
            Text(field , style: CommonTextStyle.titleSubheading.copyWith(color: AppColors.textBlue)),
            CommonSpaces.spaceVertical6,
            Text(fee, style: CommonTextStyle.titleHeading),
      
          ]
        ),
      ),
    );
  }
}
