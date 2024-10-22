import 'package:emergency_time/utils/libraries/app_libraries.dart';
import 'package:emergency_time/views/doctor_details_screen/local_widgets/doctor_profile.dart';
import 'package:emergency_time/views/doctor_details_screen/local_widgets/location_tile.dart';
import 'package:emergency_time/views/doctor_details_screen/local_widgets/more_similar_doctor_tile.dart';
import 'package:emergency_time/views/doctor_details_screen/local_widgets/review_comments_tile.dart';
import 'package:emergency_time/views/doctor_details_screen/local_widgets/time_tile.dart';
import 'package:emergency_time/widgets/common_spaces/common_spaces.dart';
import 'package:intl/intl.dart';


import '../../constants/app_assets/app_assets.dart';
import '../../../widgets/common_textstyle/common_text_style.dart';
import '../../constants/app_assets/app_icon.dart';
import '../book_appointment_screen/book_appointment_controller.dart';
import '../book_appointment_screen/local_widgets/day_card.dart';


class DoctorDetailScreen extends StatelessWidget {
  const DoctorDetailScreen({super.key});

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
      backgroundColor: AppColors.lightGreyBackground,
      appBar: AppBar(
        backgroundColor: AppColors.lightGreyBackground,
        leading: InkWell(
          child: Image.asset(AppIcons.backIcon),
          onTap: () {
            Get.back();
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Image.asset(
              AppIcons.shareIcon,
              width: 24,
              height: 24,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Image.asset(
              AppIcons.chatIcon,
              width: 24,
              height: 24,
            ),
          ),
        ],
      ),
      body: SizedBox(
        child: SingleChildScrollView(
          child: Column(
            children: [
              DoctorProfile(
                doctorName: 'Dr. Adaora Azubuike',
                image: AppAssets.visitDr1,
                specialization: 'Cardiologist',
                details: "14 yrs Experience, Janakpuri",
                fee: '₹500 Consultation Fees',
                rate: "4.5",
                reviews: '56 Reviews',
                hospitals: 'MBBS, MD, General Medicine',
              ),
              const Padding(
                padding: EdgeInsets.all(4.0),
                child: TimeTile(
                  morningTime: '10 AM - 2 PM',
                  eveningTime: '7 - 10 PM',
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(4.0),
                child: LocationTile(
                    location:
                        'Pocket 1, Gate Number 2, Sector 9, Landmark: Opposite shiksha bharti school, Delhi'),
              ),
              Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CommonSpaces.spaceVertical20,
                      SizedBox(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SizedBox(
                                  width: Get.width * .8,
                                  height: 160,
                                  child: Image.asset(AppAssets.posters),
                                ),
                              ),
                             Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SizedBox(
                                  width: Get.width * .8,
                                  height: 160,
                                  child: Image.asset(AppAssets.posters),
                                ),
                              ),
                             Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SizedBox(
                                  width: Get.width * .8,
                                  height: 160,
                                  child: Image.asset(AppAssets.posters),
                                ),
                              ),

                            ],
                          ),
                        ),
                      ),
                      CommonSpaces.spaceVertical20,
                      Text('User Reviews', style: CommonTextStyle.titleHeading.copyWith(fontSize: 20),),
                      const SizedBox(height: 8.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              ratingRow(5, 152, 537, Colors.green),
                              ratingRow(4, 120, 537, Colors.lightGreen),
                              ratingRow(3, 110, 537, Colors.orange),
                              ratingRow(2, 85, 537, Colors.red),
                              ratingRow(1, 65, 537, Colors.redAccent),
                            ],
                          ),
                          Column(
                            children: [
                              Stack(
                                alignment: Alignment.center,
                                children: [
                                  const Icon(Icons.star_rounded, color: Colors.green, size: 110),
                                  Center(
                                    child: Text(
                                      '4.2',
                                      style: CommonTextStyle.whiteSubTitle.copyWith(fontSize: 20.0),
                                    ),
                                  ),
                                ],
                              ),
                              Text('Based on',
                                  style: CommonTextStyle.titleBlack12Subheading),
                              Text(
                                '537 Reviews', style: CommonTextStyle.red14Text.copyWith(fontSize: 12.0),
                              ),
                            ],
                          ),
                        ]
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 4),
                            child: reviewButton('Most helpful', Colors.grey),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 4),
                            child: reviewButton('Recent', Colors.grey),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 4),
                            child: reviewButton('Critical', Colors.grey),
                          ),
                        ],
                      ),
                      CommonSpaces.spaceVertical12,
                      const ReviewCommentsTile(rating: "5 out 5", comment: 'Friendly and explained me very well about my problem. Even only by his words I feel better.Thanks Sir.', user: 'Pan Hyuk', date: '8 Jun 2025', userProfile: AppAssets.visitDr1,),
                      CommonSpaces.spaceVertical10,
                      const ReviewCommentsTile(rating: "5 out 5", comment: 'Friendly and explained me very well about my problem. Even only by his words I feel better.Thanks Sir.', user: 'Pan Hyuk', date: '8 Jun 2025', userProfile: AppAssets.visitDr1,),
                      CommonSpaces.spaceVertical10,
                      const ReviewCommentsTile(rating: "5 out 5", comment: 'Friendly and explained me very well about my problem. Even only by his words I feel better.Thanks Sir.', user: 'Pan Hyuk', date: '8 Jun 2025', userProfile: AppAssets.visitDr1,),
                      CommonSpaces.spaceVertical10,
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: reviewButton('View More Reviews', AppColors.redSplashColor),
                        ),
                      ),
                      CommonSpaces.spaceVertical20,
                      Text('Schedule an Appointment', style: CommonTextStyle.titleHeading.copyWith(fontSize: 20),),
                      CommonSpaces.spaceVertical20,
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
                      CommonSpaces.spaceVertical20,
                      Text('Similar Cardiology Doctors', style: CommonTextStyle.titleHeading.copyWith(fontSize: 20),),
                      CommonSpaces.spaceVertical20,
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MoreSimilarDoctorTile(doctorName: 'John Smith', doctorProfileImage: AppAssets.visitDr1, field: 'Cardiologist', fee: '₹500 Fees'),
                          MoreSimilarDoctorTile(doctorName: 'John Smith', doctorProfileImage: AppAssets.visitDr1, field: 'Cardiologist', fee: '₹500 Fees'),],
                      ),
                      CommonSpaces.spaceVertical30,
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Container(
                              width: Get.width * .3,
                              height: 45,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                      color: AppColors.rateGreen,
                                      width: 1
                                  )
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(6.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.phone, size: 24, color: AppColors.rateGreen,),
                                    const SizedBox(width: 8,),
                                    Text(
                                      "Call",
                                      style: CommonTextStyle.greenSubTitle,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(width: 8,),
                            Expanded(
                              child: InkWell(
                                child: Container(
                                  height: 45,
                                  decoration: BoxDecoration(
                                    color: AppColors.redSplashColor,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(6.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.calendar_month_sharp, size: 24, color: AppColors.white,),
                                        const SizedBox(width: 8,),
                                        Text(
                                          "Book Appointment",
                                          style:  CommonTextStyle.whiteSubTitle,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                onTap: (){
                                },
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }

  // Row Widget for Star Ratings
  Widget ratingRow(int count, int ratingCount, int totalReviews, Color barColor) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          // Star
          Text(count.toString(), style: CommonTextStyle.titleSubheading),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.0),
            child: Icon(Icons.star, color: Colors.grey, size: 16),
          ),
          const SizedBox(width: 4),
          SizedBox(
            width: Get.width * .4,
            child: LinearProgressIndicator(
              value: ratingCount / totalReviews,
              color: barColor,
              backgroundColor: Colors.grey[300],
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
            ),
          ),
          const SizedBox(width: 6),
          Text(ratingCount.toString(), style: CommonTextStyle.titleSubheading),
        ],
      ),
    );
  }

  // Review Button Widget
  Widget reviewButton(String text, Color textColor) {
    return ElevatedButton(
      onPressed: () {},
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        side: BorderSide(color: Colors.grey),
      ),
      child: Text(text, style: CommonTextStyle.bold16Text.copyWith(fontSize: 12.0, color: textColor),),
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
            width: 120,
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
