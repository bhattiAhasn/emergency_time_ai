import 'package:emergency_time/constants/app_assets/app_assets.dart';
import 'package:emergency_time/utils/libraries/app_libraries.dart';
import 'package:emergency_time/views/dashboard_screen/dash_board_screen.dart';
import 'package:emergency_time/views/select_country/select_city/select_city.dart';
import 'package:emergency_time/views/select_country/select_country_controller.dart';
import 'package:emergency_time/widgets/text_widget/text_widget.dart';

class SelectCountryScreen extends StatelessWidget {
  // Initialize the controller

  const SelectCountryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CountryController>(
      init: CountryController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            toolbarHeight:
                0, // Hides the AppBar to make it similar to the design
            elevation: 0,
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20), // Add some space from the top
                  const MyText(
                    "Select country",
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                  const SizedBox(height: 10),
                  const MyText(
                    "In order to serve you better, Please select your location.",
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff506D85),
                  ),
                  const SizedBox(height: 80),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CountryOption(
                        imagePath:
                            AppAssets.pakistanLogo, // Path to your asset image
                        countryName: 'Pakistan',
                        onTap: () {
                          GetStorage().write('pakistan', 'true');
                          Get.to(() => const DashboardScreen());
                        },
                      ),
                      CountryOption(
                        imagePath: AppAssets
                            .unitedStateLogo, // Path to your asset image
                        countryName: 'United States',
                        onTap: () {
                          GetStorage().write('united', 'true');
                          Get.to(() => const DashboardScreen());
                          // Get.to(() => const SelectCityScreen());
                          // controller.selectCountry('United States');
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  // Display the selected country using Obx
                  Obx(() => Text(
                        "Selected Country: ${controller.selectedCountry}",
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      )),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class CountryOption extends StatelessWidget {
  final String imagePath;
  final String countryName;
  final VoidCallback onTap;

  const CountryOption({
    super.key,
    required this.imagePath,
    required this.countryName,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.red, width: 2),
            ),
            child: Image.asset(
              imagePath,
              width: 72,
              height: 72,
            ),
          ),
          const SizedBox(height: 10),
          MyText(
            countryName,
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}
