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
            backgroundColor:
                Colors.white, // Optional: Set the background color if needed
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

              // Dropdown for selecting a city
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
                  child: DropdownButton<String>(
                    style: const TextStyle(
                        color: Colors.black, fontFamily: "Nexa"),
                    isExpanded: true,
                    hint: const Text('Select a city'),
                    value: null,
                    items: <String>[
                      'Islamabad',
                      'Lahore',
                      'Karachi',
                      'Rawalpindi',
                      'London'
                    ].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? city) {
                      if (city != null) {
                        controller.searchHospitalsInCity(city);
                      }
                    },
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
