import 'package:get/get.dart';

class CountryController extends GetxController {
  var selectedCountry = ''.obs;

  // Function to select a country
  void selectCountry(String country) {
    selectedCountry.value = country;
    print("Selected Country: $country");
  }

  var countries = [
    {"name": "Guangzhou", "subtext": "Cape Town"},
    {"name": "Las Vegas", "subtext": "Jaipur"},
    {"name": "Madrid", "subtext": "Lisbon"},
    {"name": "Odessa", "subtext": "Montevideo"},
    {"name": "San Jose", "subtext": "Panama City"},
    {"name": "Vienna", "subtext": "Vancouver"},
  ].obs;

  // For storing filtered results
  var filteredCountries = <Map<String, String>>[].obs;

  // TextController for the search field
  var searchTextController = ''.obs;

  // Search filter logic
  void searchCountry(String query) {
    if (query.isEmpty) {
      filteredCountries.value = countries;
    } else {
      filteredCountries.value = countries
          .where((country) =>
              country["name"]!.toLowerCase().contains(query.toLowerCase()) ||
              country["subtext"]!.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
  }

  @override
  void onInit() {
    super.onInit();
    filteredCountries.value = countries; // Initialize with all countries
  }
}
