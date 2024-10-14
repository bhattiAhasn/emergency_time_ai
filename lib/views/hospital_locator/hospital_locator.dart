import 'package:emergency_time/widgets/text_widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'hospital_locator_controller.dart';

class HospitalLocatorScreen extends StatelessWidget {
  const HospitalLocatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HospitalLocatorController>(
      init: HospitalLocatorController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: const MyText(
              'Hospital Locator',
              color: Colors.black, // Ensuring black text color for the title
            ),
            backgroundColor: Colors.white, // Optional: Set background color
            iconTheme: const IconThemeData(
              color: Colors.black, // Set the back button color to black
            ),
          ),
          body: Stack(
            children: [
              // Google Map
              Obx(() => GoogleMap(
                    onMapCreated: controller.onMapCreated,
                    initialCameraPosition: CameraPosition(
                      target: controller.center,
                      zoom: 6.0,
                    ),
                    markers: controller.markers.value,
                  )),

              // Search bar for city input
              Positioned(
                top: 20,
                left: 15,
                right: 15,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              style: const TextStyle(
                                color: Colors
                                    .black, // Ensure black text color for input text
                              ),
                              onChanged: (value) {
                                controller.searchQuery.value = value;
                                controller
                                    .updateCitySuggestions(); // Update suggestions
                              },
                              onSubmitted: (value) {
                                if (value.isNotEmpty) {
                                  controller.searchHospitalsInCity(value);
                                }
                              },
                              decoration: const InputDecoration(
                                hintStyle: TextStyle(
                                  color: Colors.black, // Black hint text color
                                ),
                                hintText: 'Enter city name (e.g. London)',
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.search,
                              color: Colors
                                  .black, // Ensure black color for the search icon
                            ),
                            onPressed: () {
                              if (controller.searchQuery.value.isNotEmpty) {
                                controller.searchHospitalsInCity(
                                    controller.searchQuery.value);
                              }
                            },
                          ),
                        ],
                      ),
                      // Display city suggestions
                      Obx(() {
                        return controller.citySuggestions.isNotEmpty
                            ? ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: controller.citySuggestions.length,
                                itemBuilder: (context, index) {
                                  return ListTile(
                                    title: MyText(
                                      controller.citySuggestions[index],
                                      color: Colors.black,
                                    ),
                                    onTap: () {
                                      controller.searchQuery.value =
                                          controller.citySuggestions[index];
                                      controller.searchHospitalsInCity(
                                          controller.citySuggestions[index]);
                                    },
                                  );
                                },
                              )
                            : const SizedBox
                                .shrink(); // Return an empty widget if no suggestions
                      }),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
