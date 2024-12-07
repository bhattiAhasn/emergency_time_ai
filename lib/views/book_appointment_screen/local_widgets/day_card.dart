import 'package:emergency_time/utils/libraries/app_libraries.dart';
import 'package:emergency_time/views/book_appointment_screen/book_appointment_controller.dart';
import 'package:emergency_time/widgets/common_textstyle/common_text_style.dart';
import 'package:get/get.dart';


class DayCard extends StatelessWidget {
  final String date;
  final String day;

  const DayCard({super.key, required this.date, required this.day});

  @override
  Widget build(BuildContext context) {
    final BookAppointmentController dayController = Get.find<BookAppointmentController>();

    return Obx(() {
      bool isSelected = dayController.selectedDate.value == date;
      return Padding(
        padding: const EdgeInsets.all(4.0),
        child: GestureDetector(
          onTap: () {
            dayController.setSelectedDate(date);
          },
          child: Card(
            color: isSelected ? AppColors.redSplashColor : AppColors.white,
            child: SizedBox(
              width: 90,
              height: 110,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      day,
                      style: isSelected
                          ? CommonTextStyle.white12Title
                          : CommonTextStyle.grey12Text,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      date,
                      style: isSelected
                          ? CommonTextStyle.white24Title
                          : CommonTextStyle.bold24Title,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
