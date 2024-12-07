import 'package:emergency_time/constants/app_assets/app_assets.dart';
import 'package:emergency_time/constants/app_assets/app_icon.dart';
import 'package:emergency_time/widgets/common_textstyle/common_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/app_colors/app_colors.dart';
import '../../routes/app_routes.dart';
import '../../widgets/common_spaces/common_spaces.dart';
import 'book_appointment_controller.dart';
import 'local_widgets/appointment_tile.dart';
import 'local_widgets/day_card.dart';
import 'package:intl/intl.dart';

class BookAppointmentScreen extends StatelessWidget {
  const BookAppointmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final BookAppointmentController bookAppointmentController =
        Get.put(BookAppointmentController());

    List<Map<String, String>> next30Days = getNext30Days();

    final List<Map<String, String>> timeSlots = [
      {"text": "10:30 AM", "value": "10:30 AM"},
      {"text": "11:00 AM", "value": "11:00 AM"},
      {"text": "11:30 AM", "value": "11:30 AM"},
      {"text": "12:00 PM", "value": "12:00 PM"},
      {"text": "12:30 PM", "value": "12:30 PM"},
      {"text": "01:00 PM", "value": "01:00 PM"},
      {"text": "01:30 PM", "value": "01:30 PM"},
      {"text": "02:00 PM", "value": "02:00 PM"},
    ];

    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          child: Image.asset(AppIcons.backIcon),
          onTap: () {
            Get.back();
          },
        ),
        title: Text(
          "Book an Appointment",
          style: CommonTextStyle.appBarTitle,
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const AppointmentTile(
                  doctorName: 'Dr. Adaora Azubuike',
                  image: AppAssets.visitDr1,
                  specialization: 'Cardiologist',
                  details: "14 yrs Experience, Janakpuri",
                  fee: '₹500 Consultation Fees',
                  rate: "4.5",
                  reviews: '56 Reviews',
                ),
                CommonSpaces.spaceVertical20,
                SizedBox(
                  height: Get.height * 0.9,
                  width: Get.width,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: AppColors.lightGreyBackground,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30)),
                    ),
                    child: Column(
                      children: [
                        CommonSpaces.spaceVertical30,
                        SizedBox(
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: next30Days.map((dayInfo) {
                                return DayCard(
                                  date: dayInfo['date']!,
                                  day: dayInfo['day']!,
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                        CommonSpaces.spaceVertical10,
                        SizedBox(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              _buildCustomRadioButton(
                                icon: AppIcons.morningIcon,
                                text: 'Morning',
                                value: 'Morning',
                                controller: bookAppointmentController,
                              ),
                              _buildCustomRadioButton(
                                icon: AppIcons.eveningIcon,
                                text: 'Evening',
                                value: 'Evening',
                                controller: bookAppointmentController,
                              ),
                            ],
                          ),
                        ),
                        CommonSpaces.spaceVertical10,
                        SizedBox(
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: GridView.builder(
                              shrinkWrap: true,
                              gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 4,
                                crossAxisSpacing: 8,
                                mainAxisSpacing: 8,
                                childAspectRatio: 1.7,
                              ),
                              itemCount: timeSlots.length,
                              itemBuilder: (context, index) {
                                final timeSlot = timeSlots[index];
                                return _buildTimeButton(
                                  text: timeSlot["text"]!.toUpperCase(),
                                  value: timeSlot["value"]!,
                                  controller: bookAppointmentController,
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                CommonSpaces.spaceVertical50,
              ],
            ),
          ),
          Positioned(
            bottom: 10,
            left: 0,
            right: 0,
            child: InkWell(
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
                      "Proceed to Book Appointment",
                      style: CommonTextStyle.white16Title,
                    ),
                  ),
                ),
              ),
              onTap: () {
                Get.toNamed(Routes.doctorDetailsScreen);
              },
            ),
          ),
        ],
      ),
    );
  }

  List<Map<String, String>> getNext30Days() {
    List<Map<String, String>> daysList = [];
    DateTime currentDate = DateTime.now();

    for (int i = 0; i < 30; i++) {
      DateTime date = currentDate.add(Duration(days: i));
      String day = DateFormat('EEEE').format(date);
      String dateStr = DateFormat('dd').format(date);

      daysList.add({"day": day, "date": dateStr});
    }

    return daysList;
  }

  Widget _buildCustomRadioButton({
    required String icon,
    required String text,
    required String value,
    required BookAppointmentController controller,
  }) {
    return Obx(() {
      bool isSelected = controller.selectedOption.value == value;

      return GestureDetector(
        onTap: () {
          controller.setSelectedOption(value); // Update the selected option
        },
        child: Container(
          margin: const EdgeInsets.all(8.0),
          padding: const EdgeInsets.all(12.0),
          decoration: BoxDecoration(
            color: isSelected ? AppColors.redSplashColor : AppColors.white,
            borderRadius: BorderRadius.circular(14.0),
          ),
          child: SizedBox(
            width: 140,
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(icon),
                const SizedBox(width: 10),
                Text(
                  text,
                  style: isSelected
                      ? CommonTextStyle.whiteSubTitle
                      : CommonTextStyle.titleHeading,
                ),
              ],
            ),
          ),
        ),
      );
    });
  }

  Widget _buildTimeButton({
    required String text,
    required String value,
    required BookAppointmentController controller,
  }) {
    return Obx(() {
      bool isSelected = controller.selectedTime.value == value;

      return GestureDetector(
        onTap: () {
          controller.setSelectedTime(value); // Set the selected time
        },
        child: Container(
          decoration: BoxDecoration(
            color: isSelected ? AppColors.redSplashColor : AppColors.white,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Center(
            child: Text(
              text,
              style: isSelected
                  ? CommonTextStyle.whiteSubTitle
                  : CommonTextStyle.titleHeading,
            ),
          ),
        ),
      );
    });
  }
}
