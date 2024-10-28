import 'package:emergency_time/constants/app_assets/app_assets.dart';
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
              color: Colors.black,
            ),
            actions: [
              InkWell(
                onTap: () {
                  controller.hospitalList.value =
                      !controller.hospitalList.value;
                },
                child: Image.asset(
                  AppAssets.threeLines,
                  height: 30,
                ).marginOnly(right: 15),
              )
            ],
            backgroundColor: Colors.white,
            iconTheme: const IconThemeData(
              color: Colors.black,
            ),
          ),
          body: Stack(
            children: [
              // Google Map or Hospital List
              Obx(() => controller.hospitalList.value
                  ? GoogleMap(
                      onMapCreated: controller.onMapCreated,
                      initialCameraPosition: CameraPosition(
                        target: controller.center,
                        zoom: 6.0,
                      ),
                      markers: controller.markers.value,
                    )
                  : Obx(() {
                      if (controller.hospitalNames.isEmpty) {
                        return const Center(
                            child: MyText('No hospitals found.'));
                      } else {
                        return ListView.builder(
                          itemCount: controller.hospitalNames.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              leading: Image.asset(AppAssets.hospitalLogo),
                              title: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const MyText(
                                    'Multi Speciality',
                                    color: Color(0xff506D85),
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  MyText(
                                    controller.hospitalNames[index]
                                        .split(' - ')[0],
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                  ),
                                  const Row(children: [
                                    MyText(
                                      'Open',
                                      color: Color(0xff11BF80),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    MyText(
                                      ' 24 Hours',
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                    )
                                  ])
                                ],
                              ),
                              trailing: MyText(
                                controller.hospitalNames[index]
                                    .split(' - ')[1], // Distance
                                color: const Color(0xff11BF80),
                              ),
                            );
                          },
                        );
                      }
                    })),

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
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: controller.cityName,
                              style: const TextStyle(
                                color: Colors.black,
                              ),
                              onChanged: (value) {
                                controller.searchQuery.value = value;
                                controller.updateCitySuggestions();
                              },
                              onSubmitted: (value) {
                                if (value.isNotEmpty) {
                                  controller.searchHospitalsInCity(value);
                                }
                              },
                              decoration: const InputDecoration(
                                hintStyle: TextStyle(
                                  color: Colors.black,
                                ),
                                hintText: 'Enter city name (e.g. London)',
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.clear,
                              color: Colors.black,
                            ),
                            onPressed: () {
                              controller.cityName.clear(); // Clear search input
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
                                      // Update search query with selected city
                                      controller.searchQuery.value =
                                          controller.citySuggestions[index];
                                      // Search hospitals for the selected city
                                      controller.searchHospitalsInCity(
                                          controller.citySuggestions[index]);
                                      // Clear suggestions after selection
                                      controller.citySuggestions.clear();
                                      controller.cityName.text =
                                          controller.searchQuery.value;
                                      controller.update();
                                    },
                                  );
                                },
                              )
                            : const SizedBox.shrink(); // No suggestions
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
