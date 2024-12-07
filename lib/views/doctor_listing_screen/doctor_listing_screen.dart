import 'package:emergency_time/constants/app_colors/app_colors.dart';
import 'package:emergency_time/routes/app_routes.dart';
import 'package:emergency_time/views/doctor_listing_screen/doctor_listing_screen_controller.dart';
import 'package:emergency_time/views/doctor_listing_screen/local_widgets/custom_sort_bottomsheet.dart';
import 'package:emergency_time/views/doctor_listing_screen/local_widgets/doctor_listing_tile.dart';
import 'package:emergency_time/widgets/common_spaces/common_spaces.dart';
import 'package:flutter/material.dart';

import '../../constants/app_assets/app_assets.dart';
import '../../constants/app_assets/app_icon.dart';
import 'package:get/get.dart';

import '../../widgets/common_textstyle/common_text_style.dart';

class DoctorListingScreen extends StatefulWidget {
  const DoctorListingScreen({super.key});

  @override
  State<DoctorListingScreen> createState() => _DoctorListingScreenState();
}

class _DoctorListingScreenState extends State<DoctorListingScreen> {
  DoctorListingScreenController doctorListingScreenController = Get.put(DoctorListingScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          child: Image.asset(
            AppIcons.backIcon,
          ),
          onTap: () {
            Get.back();
          },
        ),
        title: Text(
          "Cardiology",
          style: CommonTextStyle.appBarTitle,
        ),
        actions: [
          Obx(() {
            return DropdownButton<String>(
              hint: Text("New Dehli"),
              value: doctorListingScreenController.selectedOption.value.isEmpty
                  ? null
                  : doctorListingScreenController.selectedOption.value,
              icon: Icon(Icons.arrow_drop_down, color: Colors.black,),
              iconSize: 24,
              style: CommonTextStyle.titleHeading,
              underline: Container(color: Colors.white,),
              onChanged: (String? newValue) {
                doctorListingScreenController.updateSelectedOption(newValue); // Update the selected value using GetX controller
              },
              items: doctorListingScreenController.options.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            );
          }),
          const SizedBox(width: 16,)
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildSearchField(),
              CommonSpaces.spaceVertical12,
              DoctorListingTile(
                doctorName: 'Dr. Adaora Azubuike',
                image: AppAssets.visitDr1,
                specialization: 'Cardiologist',
                details: "14 yrs Experience, Janakpuri",
                time: '₹500 Consultation Fees',
                rate: "4.5",
                reviews: '56 Reviews',
                selectedOption: '8PM',
              ),
              CommonSpaces.spaceVertical12,
              DoctorListingTile(
                doctorName: 'Tua Manuera',
                image: AppAssets.visitDr4,
                specialization: 'Paediatrics',
                details: "14 yrs Experience, Janakpuri",
                time: '₹500 Consultation Fees',
                rate: "4.9",
                reviews: '56 Reviews',
                selectedOption: '8PM',
              ),
              CommonSpaces.spaceVertical12,
              DoctorListingTile(
                doctorName: 'Dr. Adaora Azubuike',
                image: AppAssets.visitDr3,
                specialization: 'Cardiologist',
                details: "14 yrs Experience, Janakpuri",
                time: '₹500 Consultation Fees',
                rate: "4.5",
                reviews: '56 Reviews',
                selectedOption: '8PM',
              ),
              CommonSpaces.spaceVertical12,
              DoctorListingTile(
                doctorName: 'Tua Manuera',
                image: AppAssets.visitDr2,
                specialization: 'Paediatrics',
                details: "14 yrs Experience, Janakpuri",
                time: '₹500 Consultation Fees',
                rate: "4.5",
                reviews: '56 Reviews',
                selectedOption: '8PM',
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        elevation: 7,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Sort Icon and Text
              GestureDetector(
                onTap: () {
                  Get.bottomSheet(CustomSortBottomsheet());
                },
                child: Row(
                  children: [
                    Image.asset(AppIcons.sortingIcon),
                    const SizedBox(width: 8),
                    Text(
                      "Sort",
                      style: CommonTextStyle.titleHeading,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),

              Container(
                width: 1,
                height: 30,
                color: Colors.grey.shade300,
              ),
              const SizedBox(width: 16),

              GestureDetector(
                onTap: () {
                  Get.toNamed(Routes.doctorListFilterScreen);
                },
                child: Row(
                  children: [
                    Image.asset(AppIcons.filterIcon),
                    const SizedBox(width: 8),
                    Text(
                      "Filter",
                      style: CommonTextStyle.titleHeading,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

    );
  }

  Widget _buildSearchField() {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, bottom: 10.0),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search Cardiologist',
          hintStyle: const TextStyle(color: Color(0xff506D85)),
          prefixIcon: const Icon(Icons.search, color: Color(0xff506D85)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.transparent),
          ),
          filled: true,
        ),
      ),
    );
  }
}
