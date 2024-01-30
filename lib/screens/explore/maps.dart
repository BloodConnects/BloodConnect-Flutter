import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../controller/map_controller.dart';

class MapScreen extends GetView<MapController> {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    MapController mapController = Get.put(MapController());

    return Scaffold(
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: MapController.kGooglePlex,
        markers: Set<Marker>.of(mapController.marker),
        onMapCreated: (GoogleMapController controller) {
          mapController.controller.complete(controller);
        },
        myLocationButtonEnabled: true,
      ),
    );
  }
}