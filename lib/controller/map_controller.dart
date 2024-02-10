import 'dart:async';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapController extends GetxController {

  Completer<GoogleMapController> controller = Completer<GoogleMapController>();

  static const CameraPosition kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  final List<Marker> marker = [];
  final List<Marker> list = [
    Marker(
      markerId: MarkerId('1'),
      position: LatLng(37.42796133580664, -122.085749655962),
      infoWindow: InfoWindow(
        title: 'My Position',
      ),
    ),
  ];
  Rx<LatLng> currentLatLng = const LatLng(0.0, 0.0).obs;

  void onMapCreated(GoogleMapController controller) {
    if(!this.controller.isCompleted){
      this.controller.complete(controller);
    }
  }

  void moveCameraToLatLng(LatLng latLng) async {
    final GoogleMapController mapController = await controller.future;
    mapController.moveCamera(CameraUpdate.newCameraPosition(CameraPosition(target: latLng, zoom: 10,)));
    mapController.animateCamera(CameraUpdate.newLatLngZoom(latLng,20));
    currentLatLng.value = latLng;

    var marke = Marker(
      markerId: const MarkerId('2'),
      position: latLng,
      infoWindow: const InfoWindow(
        title: 'New Postition',
      ),
    );
    marker.add(marke);

  }

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

  @override
  void dispose() {
    controller = Completer();
    super.dispose();
  }

  static MapController get to => Get.find<MapController>();
}
