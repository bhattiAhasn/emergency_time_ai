import 'package:emergency_time/constants/app_assets/app_assets.dart';
import 'package:emergency_time/widgets/text_widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'hospital_locator_controller.dart';

class HospitalLocatorScreen extends StatelessWidget {
  final HospitalLocatorController controller =
      Get.put(HospitalLocatorController());

  @override
  Widget build(BuildContext context) {
    return HospitalListScreen(controller: controller);
  }
}

class HospitalListScreen extends StatelessWidget {
  final HospitalLocatorController controller;

  HospitalListScreen({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const MyText('Hospital Locator', color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false, // Disable default back button
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(13),
            child: Row(
              children: [
                Expanded(
                    child: TextField(
                  controller: controller.cityName,
                  onChanged: (value) {
                    controller.searchQuery.value = value;
                    controller.updateCitySuggestions();
                  },
                  decoration: const InputDecoration(
                    hintText: 'Enter city',
                    hintStyle: TextStyle(color: Colors.black),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                          Radius.circular(20)), // Set radius here
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                          Radius.circular(20)), // Add radius for enabled state
                      borderSide: BorderSide(
                          color:
                              Colors.grey), // Optional: customize border color
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                          Radius.circular(20)), // Add radius for focused state
                      borderSide: BorderSide(
                          color:
                              Colors.blue), // Optional: customize focus color
                    ),
                  ),
                  style: const TextStyle(color: Colors.black),
                )),
                IconButton(
                  icon: const Icon(Icons.search, color: Colors.black),
                  onPressed: () {
                    if (controller.cityName.text.isNotEmpty) {
                      controller
                          .searchHospitalsInCity(controller.cityName.text);
                    }
                  },
                ),
              ],
            ),
          ),
          Obx(() {
            if (controller.citySuggestions.isNotEmpty &&
                controller.searchQuery.isNotEmpty) {
              return Container(
                height: 100,
                child: ListView.builder(
                  itemCount: controller.citySuggestions.length,
                  itemBuilder: (context, index) {
                    final suggestion = controller.citySuggestions[index];
                    return ListTile(
                      title: Text(suggestion,
                          style: const TextStyle(color: Colors.black)),
                      onTap: () {
                        controller.cityName.text = suggestion;
                        controller.searchHospitalsInCity(suggestion);
                        controller.citySuggestions.clear();
                      },
                    );
                  },
                ),
              );
            } else {
              return const SizedBox.shrink();
            }
          }),
          Expanded(
            child: Obx(() {
              if (controller.hospitalNames.isEmpty) {
                return const Center(
                    child: MyText(
                  'No hospitals found',
                  color: Colors.black,
                ));
              } else {
                return ListView.builder(
                  itemCount: controller.hospitalNames.length,
                  itemBuilder: (context, index) {
                    final hospital = controller.hospitalNames[index];
                    return ListTile(
                      leading: Image.asset(AppAssets.hospitalLogo),
                      title: Text(hospital,
                          style: const TextStyle(color: Colors.black)),
                      onTap: () async {
                        final marker = controller.markers.elementAt(index);
                        await controller.fetchRouteToHospital(marker.position);
                        Get.to(() => HospitalMapScreen(
                              controller: controller,
                              initialMarkerIndex: index,
                            ));
                      },
                    );
                  },
                );
              }
            }),
          ),
        ],
      ),
    );
  }
}

class HospitalMapScreen extends StatelessWidget {
  final HospitalLocatorController controller;
  final int initialMarkerIndex;

  const HospitalMapScreen(
      {super.key, required this.controller, required this.initialMarkerIndex});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const MyText(
          'Map View',
          color: Colors.black,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
      ),
      body: Stack(
        children: [
          Obx(() => GoogleMap(
                onMapCreated: controller.onMapCreated,
                initialCameraPosition: CameraPosition(
                    target: controller.markers
                        .elementAt(initialMarkerIndex)
                        .position,
                    zoom: 15),
                markers: controller.markers.toSet(),
                polylines: controller.polylines.toSet(),
              )),
          Positioned(
            bottom: 16,
            right: 16,
            child: FloatingActionButton(
              onPressed: () async {
                await controller.showCurrentLocation();
              },
              backgroundColor: Colors.blue,
              child: const Icon(Icons.my_location),
            ),
          ),
        ],
      ),
    );
  }
}
