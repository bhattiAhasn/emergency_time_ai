import 'package:emergency_time/constants/app_assets/app_assets.dart';
import 'package:emergency_time/utils/libraries/app_libraries.dart';
import 'package:emergency_time/views/profile/appointment_screen/local_widget/appointment_tile.dart';

import '../../../constants/app_assets/app_icon.dart';
import '../../../widgets/common_textstyle/common_text_style.dart';

class AppointmentScreen extends StatelessWidget {
  const AppointmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          child: Image.asset(
            AppIcons.backIcon,
          ),
          onTap: () {
            Get.back();
          },
        ),
        title: Text(
          "My Appointments",
          style: CommonTextStyle.appBarTitle,
        ),
      ),
      body: ListView(
        children: [
          Container(
            height: 32.0, // Set the height to 32px
            color: AppColors.backgroundTextColor, // Set background color
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "upcoming".toUpperCase(),
                style: CommonTextStyle.greyText, // Your custom text style
              ),
            ),
          ),
          const AppointmentTile(
            doctorName: 'Dr. Adaora Azubuike',
            image: AppAssets.visitDr1,
            specialization: 'Cardiologist',
            details: "14 yrs Experience, Janakpuri",
            time: '26 June 2025',
            rate: "4.5",
            reviews: '56 Reviews',
          ),
          const AppointmentTile(
            doctorName: 'Tua Manuera',
            image: AppAssets.visitDr4,
            specialization: 'Paediatrics',
            details: "14 yrs Experience, Janakpuri",
            time: '28 June 2025',
            rate: "4.9",
            reviews: '56 Reviews',
          ),
          Container(
            height: 32.0, // Set the height to 32px
            color: AppColors.backgroundTextColor, // Set background color
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "past bookings".toUpperCase(),
                style: CommonTextStyle.greyText, // Your custom text style
              ),
            ),
          ),
          const AppointmentTile(
            doctorName: 'Dr. Adaora Azubuike',
            image: AppAssets.visitDr3,
            specialization: 'Cardiologist',
            details: "14 yrs Experience, Janakpuri",
            time: '26 June 2025',
            rate: "4.5",
            reviews: '56 Reviews',
          ),
          const AppointmentTile(
            doctorName: 'Tua Manuera',
            image: AppAssets.visitDr2,
            specialization: 'Paediatrics',
            details: "14 yrs Experience, Janakpuri",
            time: '28 June 2025',
            rate: "4.5",
            reviews: '56 Reviews',
          ),
        ],
      ),
    );
  }
}
