import 'dart:async';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapController extends GetxController {

  Completer<GoogleMapController> controller = Completer<GoogleMapController>();

  RxList<Marker> markers = <Marker>[].obs;
  Rx<LatLng> currentLatLng = const LatLng(0.0, 0.0).obs;

  //current location
  Rx<CameraPosition> cameraPosition = Rx<CameraPosition>(CameraPosition(
    target: LatLng(20.42796133580664, 80.885749655962),
    zoom: 14.4746,
  ));

  void updateCameraPosition(CameraPosition position) {
    cameraPosition.value = position;
  }

  static const CameraPosition kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  // final List<Marker> list = [
  //   Marker(
  //     markerId: MarkerId('1'),
  //     position: LatLng(37.42796133580664, -122.085749655962),
  //     infoWindow: InfoWindow(
  //       title: 'My Position',
  //     ),
  //   ),
  // ];

  void onMapCreated(GoogleMapController controller) {
    if(!this.controller.isCompleted){
      this.controller.complete(controller);
    }
  }

  void moveCameraToLatLng(double longitude, double latitude) async {
    final GoogleMapController mapController = await controller.future;
    mapController.moveCamera(CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(latitude, longitude), zoom: 10,)));
    mapController.animateCamera(CameraUpdate.newLatLngZoom(LatLng(latitude, longitude),20));
    currentLatLng.value = LatLng(latitude, longitude);

    var marke = Marker(
      markerId: const MarkerId('2'),
      position: LatLng(latitude, longitude),
      infoWindow: const InfoWindow(
        title: 'New Postition',
      ),
    );
    markers.add(marke);

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
    markers.addAll([
      Marker(
        markerId: MarkerId('1'),
        position: LatLng(37.42796133580664, -122.085749655962),
        infoWindow: InfoWindow(
          title: 'My Position',
        ),
      ),
    ]);
  }

  @override
  void dispose() {
    controller = Completer();
    super.dispose();
  }

  static MapController get to => Get.find<MapController>();
}
