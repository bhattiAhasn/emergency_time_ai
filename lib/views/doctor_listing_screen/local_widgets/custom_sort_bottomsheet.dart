import 'package:emergency_time/views/doctor_listing_screen/doctor_listing_screen_controller.dart';

import '../../../constants/app_assets/app_icon.dart';
import '../../../utils/libraries/app_libraries.dart';
import '../../../widgets/common_spaces/common_spaces.dart';
import '../../../widgets/common_textstyle/common_text_style.dart';
import 'custom_radio_button.dart';

class CustomSortBottomsheet extends StatelessWidget {
  const CustomSortBottomsheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(topRight: Radius.circular(30), topLeft: Radius.circular(30)),
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 10, bottom: 20),
                child: Text("Sort By", style: CommonTextStyle.titleHeading.copyWith(fontSize: 18), textAlign: TextAlign.start),
              ),
              customRadioButton(
                title: 'Newest First',
                value: 'Newest First',
                controller: Get.find<DoctorListingScreenController>(),
              ),
              customRadioButton(
                title: 'Oldest First',
                value: 'Oldest First',
                controller: Get.find<DoctorListingScreenController>(),
              ),
              customRadioButton(
                title: 'Featured',
                value: 'Featured',
                controller: Get.find<DoctorListingScreenController>(),
              ),
              customRadioButton(
                title: 'Rating High to Low',
                value: 'Rating High to Low',
                controller: Get.find<DoctorListingScreenController>(),
              ),
              customRadioButton(
                title: 'Only Near me',
                value: 'Only Near me',
                controller: Get.find<DoctorListingScreenController>(),
              ),
              customRadioButton(
                title: 'Fee Low to High',
                value: 'Fee Low to High',
                controller: Get.find<DoctorListingScreenController>(),
              ),
              customRadioButton(
                title: 'Fee High to Low',
                value: 'Fee High to Low',
                controller: Get.find<DoctorListingScreenController>(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
