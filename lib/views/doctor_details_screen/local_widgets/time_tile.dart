import '../../../constants/app_assets/app_icon.dart';
import '../../../utils/libraries/app_libraries.dart';
import '../../../widgets/common_textstyle/common_text_style.dart';

class TimeTile extends StatelessWidget {

  final String morningTime;
  final String eveningTime;

  const TimeTile({super.key, required this.morningTime, required this.eveningTime});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20, left: 8, right: 8),
          child: SizedBox(
            width: 50,
            height: 50,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.2),
                borderRadius: const BorderRadius.all(Radius.circular(12.0)),
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Image.asset(AppIcons.timeIcon),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Morning",
                    style: CommonTextStyle.titleHeading,
                  ),
                  Text(
                    morningTime,
                    style: CommonTextStyle.titleHeading,
                  ),
                  Text(
                    "See full detail",
                    style: CommonTextStyle.red14Text,
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Evening",
                    style: CommonTextStyle.titleHeading,
                  ),
                  Text(
                    eveningTime,
                    style: CommonTextStyle.titleHeading,
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(width: 8),
      ],
    );
  }
}
