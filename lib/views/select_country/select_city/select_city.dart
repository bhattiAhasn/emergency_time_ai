import 'package:emergency_time/views/dashboard_screen/dash_board_screen.dart';
import 'package:emergency_time/views/select_country/select_country_controller.dart';
import 'package:emergency_time/widgets/text_widget/text_widget.dart';
import '../../../utils/libraries/app_libraries.dart';

class SelectCityScreen extends StatelessWidget {
  const SelectCityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CountryController>(
      init: CountryController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            leading: IconButton(
              icon: const Icon(Icons.close),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            title: const MyText(
              "Search your city",
              fontWeight: FontWeight.w400,
              fontSize: 20,
              color: Colors.black,
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // Search field
                TextField(
                  style: const TextStyle(
                    color: Colors.black, // Set the search text color to black
                  ),
                  onChanged: (query) {
                    controller.searchCountry(query);
                  },
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.search,
                      color: Color(0xff506D85),
                    ),
                    hintText: "Search",
                    hintStyle: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 11,
                        color: Colors.black),
                    suffixIcon: IconButton(
                      icon: const Icon(
                        Icons.clear,
                        color: Color(0xff506D85),
                      ),
                      onPressed: () {
                        controller.searchCountry('');
                      },
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                // List of countries
                Expanded(
                  child: Obx(
                    () => ListView.builder(
                      itemCount: controller.filteredCountries.length,
                      itemBuilder: (context, index) {
                        var country = controller.filteredCountries[index];
                        return ListTile(
                          leading: const Icon(Icons.location_pin,
                              color: Colors.blue),
                          title: MyText(
                            country["name"] ?? '',
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                          subtitle: MyText(
                            country["subtext"] ?? '',
                            fontWeight: FontWeight.w400,
                            fontSize: 11,
                            color: const Color(0xff506D85),
                          ),
                          onTap: () {
                            Get.to(() => const DashboardScreen());
                            // Handle country selection
                            if (kDebugMode) {
                              print("Selected: ${country['name']}");
                            }
                          },
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
