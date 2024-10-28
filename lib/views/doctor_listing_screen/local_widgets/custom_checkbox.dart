import 'package:emergency_time/widgets/common_spaces/common_spaces.dart';

import '../../../utils/libraries/app_libraries.dart';
import '../../../widgets/common_textstyle/common_text_style.dart';
import '../doctor_listing_screen_controller.dart';

Widget customCheckbox({
  required String title,
  required String value,
  required DoctorListingScreenController controller,
}) {
  return InkWell(
    onTap: () {
      controller.toggleSelectedOption(value);  // Toggle selection when tapped
    },
    child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          child: Row(
            children: [
              Obx(() {
                bool isSelected = controller.selectedCheckboxOptions.contains(value);  // Check if selected
                return isSelected
                    ? const Icon(Icons.check_circle, color: AppColors.redSplashColor, size: 20)
                    : const Icon(Icons.circle_outlined, color: AppColors.lightGreyTextColor, size: 20);
              }),
              const SizedBox(width: 16,),
              Text(
                title,
                style: CommonTextStyle.titleBlack12Subheading.copyWith(fontSize: 14),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
