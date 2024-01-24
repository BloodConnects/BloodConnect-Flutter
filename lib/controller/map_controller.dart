import 'dart:async';

import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

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
  Rx<LatLng> currentLatLng = LatLng(0.0, 0.0).obs;
  // Initialize the map controller
  void onMapCreated(GoogleMapController controller) {
    this.controller.complete(controller);
  }

  // void moveCameraToLatLng(LatLng latLng) async {
  //   final GoogleMapController mapController = await controller.future;
  //
  //   mapController.animateCamera(CameraUpdate.newLatLng(latLng));
  //   currentLatLng.value = latLng;
  // }

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
