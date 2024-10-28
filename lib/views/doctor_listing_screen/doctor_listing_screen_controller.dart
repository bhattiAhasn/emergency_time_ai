import 'package:get/get.dart';

class DoctorListingScreenController extends GetxController {

  var options = ['Lahore', 'Karachi', 'Multan', 'Islamabad'].obs;
  var selectedOption = ''.obs;
  var selectedSortOption = ''.obs;
  var selectedCheckboxOptions = <String>{}.obs;


  void setSelectedSortOption(String option) {
    selectedSortOption.value = option;
  }

  void updateSelectedOption(String? newValue) {
    if (newValue != null) {
      selectedOption.value = newValue;
    }
  }

  void toggleSelectedOption(String value) {
    if (selectedCheckboxOptions.contains(value)) {
      selectedCheckboxOptions.remove(value);
    } else {
      selectedCheckboxOptions.add(value);
    }
  }
}