import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class HospitalLocatorController extends GetxController {
  final LatLng center = const LatLng(30.3753, 69.3451); // Center of Pakistan
  final RxSet<Marker> markers = <Marker>{}.obs;
  final RxSet<Polyline> polylines = <Polyline>{}.obs;

  RxList<String> citySuggestions = <String>[].obs;
  RxList<String> hospitalNames = <String>[].obs;
  GoogleMapController? mapController;
  Position? currentPosition;
  RxString searchQuery = ''.obs;
  TextEditingController cityName = TextEditingController();
  RxBool hospitalList = true.obs;

  final String googleApiKey = dotenv.env['GOOGLE_API_KEY'] ?? '';
  RxString selectedCountry = 'Pakistan'.obs;

  final Map<String, List<String>> availableCities = {
    'Pakistan': [
      'Karachi', 'Lahore', 'Islamabad', 'Faisalabad', 'Rawalpindi',
      'Multan', 'Peshawar', 'Hyderabad', 'Gujranwala', 'Quetta',
      // Additional cities...
    ],
    'USA': [
      'New York', 'Los Angeles', 'Chicago', 'Houston', 'Phoenix',
      'Philadelphia', 'San Antonio', 'San Diego', 'Dallas', 'San Jose',
      // Additional cities...
    ],
  };

  @override
  void onInit() {
    super.onInit();
    _loadPakistanHospitals();
    _determinePosition();
  }

  void onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  Future<void> _determinePosition() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location permissions are permanently denied.');
    }

    currentPosition = await Geolocator.getCurrentPosition();
  }

  Future<void> showCurrentLocation() async {
    currentPosition = await Geolocator.getCurrentPosition();
    if (currentPosition != null) {
      final currentLatLng =
          LatLng(currentPosition!.latitude, currentPosition!.longitude);

      // Add marker for current location
      markers.add(
        Marker(
          markerId: MarkerId('currentLocation'),
          position: currentLatLng,
          infoWindow: InfoWindow(title: 'You are here'),
        ),
      );

      // Animate the camera to the current location
      mapController?.animateCamera(
        CameraUpdate.newLatLngZoom(currentLatLng, 14.0),
      );
    }
  }

  void _loadPakistanHospitals() {
    markers.addAll({
      const Marker(
          markerId: MarkerId('hospital1'), position: LatLng(30.3753, 69.3451)),
    });
  }

  Future<void> searchHospitalsInCity(String city) async {
    final String url =
        'https://maps.googleapis.com/maps/api/place/textsearch/json?query=hospitals+in+$city&key=$googleApiKey';

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final results = data['results'] as List;

      markers.clear();
      hospitalNames.clear();

      for (var place in results) {
        final lat = place['geometry']['location']['lat'];
        final lng = place['geometry']['location']['lng'];
        final name = place['name'];
        final distance = currentPosition != null
            ? _calculateDistance(
                currentPosition!.latitude, currentPosition!.longitude, lat, lng)
            : 'Distance unavailable';

        hospitalNames.add('$name - $distance');

        markers.add(
          Marker(
            markerId: MarkerId(name),
            position: LatLng(lat, lng),
            infoWindow: InfoWindow(title: name),
          ),
        );
      }

      if (results.isNotEmpty && mapController != null) {
        final firstResult = results.first;
        mapController!.animateCamera(
          CameraUpdate.newLatLngZoom(
              LatLng(firstResult['geometry']['location']['lat'],
                  firstResult['geometry']['location']['lng']),
              14.0),
        );
      }
    }
  }

  Future<void> fetchRouteToHospital(LatLng destination) async {
    if (currentPosition == null) return;

    final String url =
        'https://maps.googleapis.com/maps/api/directions/json?origin=${currentPosition!.latitude},${currentPosition!.longitude}&destination=${destination.latitude},${destination.longitude}&key=$googleApiKey';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final routes = data['routes'];
      if (routes.isNotEmpty) {
        final route = routes[0]['overview_polyline']['points'];
        final polylinePoints = _decodePolyline(route);

        polylines.clear();
        polylines.add(Polyline(
          polylineId: const PolylineId('route_to_hospital'),
          points: polylinePoints,
          color: Colors.blue,
          width: 4,
        ));
      }
    }
  }

  List<LatLng> _decodePolyline(String encoded) {
    List<LatLng> polylinePoints = [];
    int index = 0;
    int len = encoded.length;
    int lat = 0;
    int lng = 0;

    while (index < len) {
      int b;
      int shift = 0;
      int result = 0;
      do {
        b = encoded.codeUnitAt(index++) - 63;
        result |= (b & 0x1f) << shift;
        shift += 5;
      } while (b >= 0x20);
      int dlat = (result & 1) != 0 ? ~(result >> 1) : (result >> 1);
      lat += dlat;

      shift = 0;
      result = 0;
      do {
        b = encoded.codeUnitAt(index++) - 63;
        result |= (b & 0x1f) << shift;
        shift += 5;
      } while (b >= 0x20);
      int dlng = (result & 1) != 0 ? ~(result >> 1) : (result >> 1);
      lng += dlng;

      polylinePoints.add(LatLng(lat / 1E5, lng / 1E5));
    }

    return polylinePoints;
  }

  String _calculateDistance(
      double startLat, double startLng, double endLat, double endLng) {
    final distanceInMeters =
        Geolocator.distanceBetween(startLat, startLng, endLat, endLng);
    return '${(distanceInMeters / 1000).toStringAsFixed(2)} km';
  }

  void updateCitySuggestions() {
    citySuggestions.value = availableCities[selectedCountry.value]!
        .where((city) =>
            city.toLowerCase().contains(searchQuery.value.toLowerCase()))
        .toList();
  }

  void clearSearch() {
    searchQuery.value = '';
  }

  @override
  void onClose() {
    cityName.dispose();
    super.onClose();
  }
}
