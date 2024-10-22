import 'package:emergency_time/views/doctor_listing_screen/doctor_listing_screen_controller.dart';

import '../../../utils/libraries/app_libraries.dart';
import '../../../widgets/common_textstyle/common_text_style.dart';

Widget customRadioButton({
  required String title,
  required String value,
  required DoctorListingScreenController controller,
}) {
  return InkWell(
    onTap: () {
      if (controller.selectedSortOption.value != value) {
        controller.setSelectedSortOption(value);
      }
    },
    child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: CommonTextStyle.titleBlack12Subheading.copyWith(fontSize: 14),
              ),
              Obx(() {
                bool isSelected = controller.selectedSortOption.value == value;
                return isSelected
                    ? const Icon(Icons.check_circle, color: AppColors.redSplashColor, size: 20)
                    : const SizedBox.shrink();
              }),
            ],
          ),
        ),
        const Divider(height: 1, color: AppColors.lightGreyTextColor,)
      ],
    ),
  );
}
