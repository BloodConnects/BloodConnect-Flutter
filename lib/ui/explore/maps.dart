import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'map_controller.dart';

class MapScreen extends GetView<MapController> {

  late MapController mapController;

  MapScreen(this.mapController, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: MapController.kGooglePlex,
        markers: Set<Marker>.of(mapController.markers),
        zoomControlsEnabled: false,
        onMapCreated: (GoogleMapController controller) {
          mapController.onMapCreated(controller);
        },
        myLocationButtonEnabled: true,
      ),
    );
  }
}