import 'package:emergency_time/constants/app_colors/app_colors.dart';
import 'package:emergency_time/widgets/text_widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'hospital_locator_controller.dart'; // Import the controller

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
              fontSize: 24,
            ),
            backgroundColor: AppColors.redSplashColor,
          ),
          body: Stack(
            children: [
              // Google Map with GetX reactive markers
              Obx(() => GoogleMap(
                    onMapCreated: controller.onMapCreated,
                    initialCameraPosition: CameraPosition(
                      target: controller.center,
                      zoom: 14.0,
                    ),
                    markers: controller.markers.value,
                  )),
              // Search Bar
              Positioned(
                top: 20,
                left: 15,
                right: 15,
                child: Container(
                  height: 50,
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
                  child: Row(
                    children: [
                      const Icon(Icons.search, color: Colors.grey),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Obx(
                          () => TextField(
                            onChanged: (value) =>
                                controller.updateSearchQuery(value),
                            style: const TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: controller.searchQuery.value.isEmpty
                                  ? 'New Delhi'
                                  : controller.searchQuery.value,
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.clear, color: Colors.grey),
                        onPressed: () {
                          controller.clearSearch();
                        },
                      ),
                    ],
                  ),
                ),
              ),
              // Hospital Info Card
              Positioned(
                bottom: 20,
                left: 15,
                right: 15,
                child: HospitalInfoCard(),
              ),
            ],
          ),
        );
      },
    );
  }
}

class HospitalInfoCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          const BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'MULTI SPECIALITY',
            style: TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Medicity Hospital',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '645 Jericho Tpke, Hyde Park, NY 11040',
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 8),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Open until 12:30 am',
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 12,
                ),
              ),
              Text(
                '1.4 Km',
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
