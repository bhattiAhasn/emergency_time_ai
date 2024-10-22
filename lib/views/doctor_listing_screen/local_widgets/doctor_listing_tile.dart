import 'package:emergency_time/routes/app_routes.dart';
import 'package:emergency_time/utils/libraries/app_libraries.dart';
import 'package:emergency_time/widgets/common_spaces/common_spaces.dart';
import 'package:emergency_time/widgets/common_textstyle/common_text_style.dart';

class DoctorListingTile extends StatefulWidget {
  final String doctorName;
  final String image;
  final String specialization;
  final String details;
  final String time;
  final String rate;
  final String reviews;
  late final String selectedOption;

  DoctorListingTile({
    Key? key,
    required this.doctorName,
    required this.image,
    required this.specialization,
    required this.details,
    required this.time,
    required this.rate,
    required this.reviews,
    required this.selectedOption,
  }) : super(key: key);

  @override
  State<DoctorListingTile> createState() => _DoctorListingTileState();
}

class _DoctorListingTileState extends State<DoctorListingTile> {
  // The list of options for the dropdown
  final List<String> options = ['10 AM', '1 AM', '12PM', '8PM'];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      child: Column(
        children: [
          ListTile(
            leading: Stack(
              children: [
                CircleAvatar(
                  radius: 30,
                  child: Image.asset(widget.image),
                ),
                const Positioned(
                  bottom: 1,
                  right: 7,
                  child: CircleAvatar(
                    backgroundColor: AppColors.rateGreen,
                    radius: 7,
                  ),
                ),
              ],
            ),
            title: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Flexible widget for text columns
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.doctorName,
                        style: CommonTextStyle.titleHeading,
                        overflow: TextOverflow.ellipsis, // Prevent overflow
                      ),
                      Text(
                        widget.specialization,
                        style: CommonTextStyle.titleSubheading,
                        overflow: TextOverflow.ellipsis, // Prevent overflow
                      ),
                      Text(
                        widget.details,
                        style: CommonTextStyle.titleSubheading,
                        overflow: TextOverflow.ellipsis, // Prevent overflow
                      ),
                      Text(
                        widget.time,
                        style: CommonTextStyle.titleBlack12Subheading,
                        overflow: TextOverflow.ellipsis, // Prevent overflow
                      ),
                    ],
                  ),
                ),
                // Rating and reviews column
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        Text(
                          widget.rate,
                          style: CommonTextStyle.titleHeading,
                        ),
                        const SizedBox(width: 4),
                        const Icon(
                          Icons.star,
                          color: AppColors.rateGreen,
                          size: 16,
                        ),
                      ],
                    ),
                    Text(
                      widget.reviews,
                      style: CommonTextStyle.titleReviews,
                      overflow: TextOverflow.ellipsis, // Prevent overflow
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 6.0,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Availability",
                    style: CommonTextStyle.titleSubheading,
                    overflow: TextOverflow.ellipsis, // Prevent overflow
                  ),
                  Row(
                    children: [
                      Text(
                        "Today",
                        style:  CommonTextStyle.titleHeading,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: DropdownButton<String>(
                          hint: Text('10 AM'),
                          value: widget.selectedOption,
                          underline: Container(color: Colors.white,),
                          isDense: true,
                          icon: Icon(Icons.arrow_drop_down, color: Colors.black,),
                          style:  CommonTextStyle.titleHeading,
                          onChanged: (String? newValue) {
                            setState(() {
                              widget.selectedOption =
                              newValue!; // Update the selected value
                            });
                          },
                          items: options.map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value, // Each option's value
                              child: Text(value), // What is displayed in the dropdown
                            );
                          }).toList(),
                        ),
                      )
                    ],
                  ),
                ],
              ),
              Container(
                height: 40,
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
              InkWell(
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                    color: AppColors.redSplashColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Center(
                      child: Text(
                        "Book Appointment",
                        style: CommonTextStyle.whiteSubTitle,
                      ),
                    ),
                  ),
                ),
                onTap: (){
                  Get.toNamed(Routes.bookAppointmentScreen);
                },
              ),

            ],
          )
        ],
      ),
    );
  }
}
