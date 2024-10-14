import 'dart:convert';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

class HospitalLocatorController extends GetxController {
  final LatLng center = const LatLng(30.3753, 69.3451); // Center of Pakistan
  final RxSet<Marker> markers = <Marker>{}.obs;
  var searchQuery = ''.obs;
  GoogleMapController? mapController;

  // Replace with your actual Google API key
  final String googleApiKey = 'AIzaSyA3IbVbaLHbanjoqpetg4pWRTEtTnaZnak';

  @override
  void onInit() {
    super.onInit();
    _loadPakistanHospitals();
  }

  void onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  // Loads default markers
  void _loadPakistanHospitals() {
    markers.addAll({
      // Add default hospitals (as you did)
    });
  }

  // Method to search hospitals in a selected city
  Future<void> searchHospitalsInCity(String city) async {
    final String url =
        'https://maps.googleapis.com/maps/api/place/textsearch/json?query=hospitals+in+$city&key=$googleApiKey';

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final results = data['results'] as List;

      // Clear existing markers
      markers.clear();

      // Add new markers based on search results
      for (var place in results) {
        final lat = place['geometry']['location']['lat'];
        final lng = place['geometry']['location']['lng'];
        final name = place['name'];
        final address = place['formatted_address'];

        markers.add(
          Marker(
            markerId: MarkerId(name),
            position: LatLng(lat, lng),
            infoWindow: InfoWindow(
              title: name,
              snippet: address,
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

  // Clears the search query
  void clearSearch() {
    searchQuery.value = '';
  }
}
