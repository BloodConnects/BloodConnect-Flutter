import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

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
      ),
    );
  }
}

class MapController extends GetxController {
  final Completer<GoogleMapController> controller = Completer<GoogleMapController>();
  static const CameraPosition kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  final List<Marker> marker = [];
  final List<Marker> list = const [
    Marker(
      markerId: MarkerId('1'),
      position: LatLng(37.42796133580664, -122.085749655962),
      infoWindow: InfoWindow(
        title: 'My Position',
      ),
    ),
  ];

  // void onTapOfMarker(MarkerId markerId, InfoWindow customInfoWindow){
  //    Marker(
  //     markerId: MarkerId('1'),
  //     position: LatLng(37.42796133580664, -122.085749655962),
  //     infoWindow: InfoWindow(
  //       title: 'My Position',
  //     ),
  //   );
  // }

  @override
  void onInit() {
    super.onInit();
    marker.addAll(list);
  }

  static MapController get to => Get.find<MapController>();
}
