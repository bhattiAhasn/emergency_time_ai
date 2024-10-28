import 'package:emergency_time/constants/app_assets/app_icon.dart';
import 'package:emergency_time/utils/libraries/app_libraries.dart';
import 'package:emergency_time/widgets/common_spaces/common_spaces.dart';

import '../../../routes/app_routes.dart';
import '../../../widgets/common_textstyle/common_text_style.dart';
import '../doctor_listing_screen_controller.dart';
import 'custom_checkbox.dart';

class FiltersScreen extends StatelessWidget {
  const FiltersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          child: Image.asset(AppIcons.backIcon),
          onTap: () {
            Get.back();
          },
        ),
        title: Text(
          "Filters",
          style: CommonTextStyle.appBarTitle,
        ),
        actions: [
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
            child: Text(
              "Reset",
              style: CommonTextStyle.red14Text,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: AppColors.lightGreyBackground,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Text(
                  "Availability".toUpperCase(),
                  style: CommonTextStyle.greyText,
                  textAlign: TextAlign.start,
                ),
              ),
            ),
            customCheckbox(
              title: 'Today',
              value: 'Today',
              controller: Get.put(DoctorListingScreenController()),
            ),
            customCheckbox(
              title: 'Tomorrow',
              value: 'Tomorrow',
              controller: Get.put(DoctorListingScreenController()),
            ),
            customCheckbox(
              title: '12 July 2024',
              value: '12 July 2024',
              controller: Get.put(DoctorListingScreenController()),
            ),
            customCheckbox(
              title: '15 July 2024',
              value: '15 July 2024',
              controller: Get.put(DoctorListingScreenController()),
            ),
            CommonSpaces.spaceVertical20,
            Container(
              color: AppColors.lightGreyBackground,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Text(
                  "gender".toUpperCase(),
                  style: CommonTextStyle.greyText,
                  textAlign: TextAlign.start,
                ),
              ),
            ),
            customCheckbox(
              title: 'Male',
              value: 'male',
              controller: Get.put(DoctorListingScreenController()),
            ),
            customCheckbox(
              title: 'Female',
              value: 'female',
              controller: Get.put(DoctorListingScreenController()),
            ),
            customCheckbox(
              title: 'Other',
              value: 'other',
              controller: Get.put(DoctorListingScreenController()),
            ),
            CommonSpaces.spaceVertical20,
            Container(
              color: AppColors.lightGreyBackground,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Text(
                  "Consultation Fees".toUpperCase(),
                  style: CommonTextStyle.greyText,
                  textAlign: TextAlign.start,
                ),
              ),
            ),
            customCheckbox(
              title: 'Below ₹200',
              value: 'Below ₹200',
              controller: Get.put(DoctorListingScreenController()),
            ),
            customCheckbox(
              title: 'Between ₹200 - ₹500',
              value: 'Between ₹200 - ₹500',
              controller: Get.put(DoctorListingScreenController()),
            ),
            customCheckbox(
              title: 'Between ₹500 - ₹1,000',
              value: 'Between ₹500 - ₹1,000',
              controller: Get.put(DoctorListingScreenController()),
            ),
            customCheckbox(
              title: 'Above  ₹500',
              value: 'Above  ₹500',
              controller: Get.put(DoctorListingScreenController()),
            ),
            CommonSpaces.spaceVertical20,
            Container(
              color: AppColors.lightGreyBackground,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Text(
                  "others".toUpperCase(),
                  style: CommonTextStyle.greyText,
                  textAlign: TextAlign.start,
                ),
              ),
            ),
            customCheckbox(
              title: 'Online Booking',
              value: 'TOnline Booking',
              controller: Get.put(DoctorListingScreenController()),
            ),
            customCheckbox(
              title: 'Video Consultation',
              value: 'Video Consultation',
              controller: Get.put(DoctorListingScreenController()),
            ),
            CommonSpaces.spaceVertical40,
            InkWell(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  width: Get.width,
                  height: 52,
                  decoration: BoxDecoration(
                    color: AppColors.redSplashColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(
                      "Submit",
                      style: CommonTextStyle.white16Title,
                    ),
                  ),
                ),
              ),
              onTap: (){
                Get.back();
              },
            ),
          ],
        ),
      ),
    );
  }
}
