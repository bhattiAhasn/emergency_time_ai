import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

import '../../utils/libraries/app_libraries.dart';

class HospitalLocatorController extends GetxController {
  final LatLng center = const LatLng(30.3753, 69.3451); // Center of Pakistan
  final RxSet<Marker> markers = <Marker>{}.obs;

  RxList<String> citySuggestions = <String>[].obs; // Store city suggestions
  RxList<String> hospitalNames = <String>[].obs; // List to store hospital names

  GoogleMapController? mapController;
  Position? currentPosition;
  RxString searchQuery = ''.obs;
  TextEditingController cityName = TextEditingController();
  RxBool hospitalList = true.obs;

  // Replace with your actual Google API key
  final String googleApiKey = dotenv.env['GOOGLE_API_KEY'] ?? '';

  // List of cities in Pakistan
  final List<String> pakistanCities = [
    'Karachi',
    'Lahore',
    'Islamabad',
    'Faisalabad',
    'Rawalpindi',
    'Multan',
    'Peshawar',
    'Hyderabad',
    'Gujranwala',
    'Quetta',
    'Sialkot',
    'Bahawalpur',
    'Gujrat',
    'Mardan',
    'Sargodha',
    'Sheikhupura',
    'Larkana',
    'Rahim Yar Khan',
    'Okara',
    'Chiniot',
    'Kasur',
    'Dera Ghazi Khan',
    'Mianwali',
    'Nawabshah',
    'Jhelum',
    'Turbat',
    'Kohat',
    'Sukkur',
    'Zhob',
    'Faisalabad',
  ];

  // List of cities in the UK
  final List<String> ukCities = [
    'London',
    'Birmingham',
    'Manchester',
    'Glasgow',
    'Liverpool',
    'Leeds',
    'Sheffield',
    'Bristol',
    'Newcastle upon Tyne',
    'Nottingham',
    'Southampton',
    'Leicester',
    'Coventry',
    'Bradford',
    'Cardiff',
    'Belfast',
    'Brighton',
    'Plymouth',
    'Stoke-on-Trent',
    'Wolverhampton',
    'Derby',
    'Luton',
    'Swansea',
    'Reading',
    'Aberdeen',
    'Dundee',
    'Oxford',
    'Cambridge',
    'York',
    'Gloucester',
  ];

  @override
  void onInit() {
    super.onInit();
    _loadPakistanHospitals();
    _determinePosition();
  }

  void onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  // Get current user location
  Future<void> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Check if location services are enabled
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    currentPosition = await Geolocator.getCurrentPosition();
  }

  // Loads default markers
  void _loadPakistanHospitals() {
    markers.addAll({
      // Add default hospitals (as you did)
    });
  }

  // Method to search hospitals in a selected city
  Future<void> searchHospitalsInCity(String city) async {
    if (kDebugMode) {
      print('City>>>>>>>>>$city');
    }

    update(); // Updates the UI immediately
    final String url =
        'https://maps.googleapis.com/maps/api/place/textsearch/json?query=hospitals+in+$city&key=$googleApiKey';

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final results = data['results'] as List;

      // Clear existing markers and hospital names
      markers.clear();
      hospitalNames.clear();

      // Add new markers based on search results
      for (var place in results) {
        final lat = place['geometry']['location']['lat'];
        final lng = place['geometry']['location']['lng'];
        final name = place['name'];
        final address = place['formatted_address'];
        final openingHours = place['opening_hours'] != null
            ? place['opening_hours']['weekday_text']
            : 'No hours available';
        final distance = currentPosition != null
            ? _calculateDistance(
                currentPosition!.latitude, currentPosition!.longitude, lat, lng)
            : 'Distance unavailable';

        // Print the hospital name
        print('Hospital Name: $name');

        // Add hospital name and distance to the list
        hospitalNames.add('$name - $distance');

        markers.add(
          Marker(
            markerId: MarkerId(name),
            position: LatLng(lat, lng),
            infoWindow: InfoWindow(
              title: name,
              snippet: '$address\nDistance: $distance\nHours: $openingHours',
            ),
          ),
        );
      }

      // Update map center to the first result
      if (results.isNotEmpty && mapController != null) {
        final firstResult = results.first;
        final lat = firstResult['geometry']['location']['lat'];
        final lng = firstResult['geometry']['location']['lng'];

        mapController!.animateCamera(
          CameraUpdate.newLatLngZoom(LatLng(lat, lng), 14.0),
        );
      }
    } else {
      // Handle API error
      print('Error fetching hospitals: ${response.body}');
    }
  }

  // Calculate distance between two coordinates (in km)
  String _calculateDistance(
      double startLat, double startLng, double endLat, double endLng) {
    final distanceInMeters =
        Geolocator.distanceBetween(startLat, startLng, endLat, endLng);
    final distanceInKm = (distanceInMeters / 1000).toStringAsFixed(2);
    return '$distanceInKm km';
  }

  // Update city suggestions based on the search query
  void updateCitySuggestions() {
    if (searchQuery.value.isEmpty) {
      citySuggestions.clear();
      return;
    }

    // Combine both city lists for suggestions
    final allCities = [...pakistanCities, ...ukCities];

    // Filter cities based on search query
    citySuggestions.value = allCities
        .where((city) =>
            city.toLowerCase().contains(searchQuery.value.toLowerCase()))
        .toList();
  }

  // Clears the search query
  void clearSearch() {
    searchQuery.value = '';
  }

  @override
  void onClose() {
    // Dispose of the TextEditingController when the controller is removed from memory
    cityName.dispose();
    super.onClose();
  }
}
