import 'package:get/get.dart';

class DoctorListingScreenController extends GetxController {

  // list for the dropdown
  var options = ['Lahore', 'Karachi', 'Multan', 'Islamabad'].obs;
  var selectedOption = ''.obs;

  void updateSelectedOption(String? newValue) {
    if (newValue != null) {
      selectedOption.value = newValue;
    }
  }
}