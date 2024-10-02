import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HospitalLocatorController extends GetxController {
  // Default center for Pakistan (Islamabad)
  final LatLng center =
      const LatLng(30.3753, 69.3451); // Approximate center of Pakistan

  // Observable list of markers
  final RxSet<Marker> markers = <Marker>{}.obs;

  // Search query observable
  var searchQuery = ''.obs;

  // Map controller
  GoogleMapController? mapController;

  @override
  void onInit() {
    super.onInit();
    // Add markers for Pakistan hospitals
    _loadPakistanHospitals();
  }

  void _loadPakistanHospitals() {
    markers.addAll({
      const Marker(
        markerId: MarkerId('shaukat_khanum'),
        position: LatLng(31.4832, 74.2713),
        infoWindow: InfoWindow(
          title: 'Shaukat Khanum Memorial Hospital',
          snippet: 'Lahore',
        ),
      ),
      const Marker(
        markerId: MarkerId('aga_khan'),
        position: LatLng(24.8615, 67.0728),
        infoWindow: InfoWindow(
          title: 'Aga Khan University Hospital',
          snippet: 'Karachi',
        ),
      ),
      const Marker(
        markerId: MarkerId('cmh_rawalpindi'),
        position: LatLng(33.5987, 73.0441),
        infoWindow: InfoWindow(
          title: 'Combined Military Hospital (CMH)',
          snippet: 'Rawalpindi',
        ),
      ),
      const Marker(
        markerId: MarkerId('pims'),
        position: LatLng(33.6844, 73.0479),
        infoWindow: InfoWindow(
          title: 'PIMS Hospital',
          snippet: 'Islamabad',
        ),
      ),
      // Add more hospitals as needed
    });
  }

  // Update map controller when map is created
  void onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  // Update the search query
  void updateSearchQuery(String query) {
    searchQuery.value = query;
    // Filter hospitals based on search query or make API calls
  }

  // Clear the search input
  void clearSearch() {
    searchQuery.value = '';
  }
}
