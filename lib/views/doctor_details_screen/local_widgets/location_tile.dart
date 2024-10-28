import 'package:emergency_time/constants/app_assets/app_icon.dart';
import 'package:emergency_time/utils/libraries/app_libraries.dart';
import 'package:emergency_time/widgets/common_textstyle/common_text_style.dart';

class LocationTile extends StatelessWidget {
  final String location;
  const LocationTile({super.key, required this.location});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      height: 100,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: SizedBox(
              width: 50,
              height: 50,
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.redSplashColor.withOpacity(0.2),
                  borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Image.asset(AppIcons.locationIcon),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Text(
              location,
              style: CommonTextStyle.titleHeading,
              maxLines: 3,  // Restrict to 3 lines
              overflow: TextOverflow.ellipsis,  // Add ellipsis if text exceeds max lines
            ),
          ),
          const SizedBox(width: 8,)
        ],
      ),
    );
  }
}
