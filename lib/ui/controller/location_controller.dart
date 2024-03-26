// import 'dart:developer';
//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:location/location.dart';
// import 'package:blood_donation_app/controller/map_controller.dart';
//
// class LocationController extends GetxController {
//   var locationMessage = 'Grant permission to get location'.obs;
//
//   Future<void> getLocation() async {
//     Location location = Location();
//     bool _serviceEnabled;
//     PermissionStatus _permissionGranted;
//     LocationData _locationData;
//
//     _serviceEnabled = await location.serviceEnabled();
//     if (!_serviceEnabled) {
//       _serviceEnabled = await location.requestService();
//       if (!_serviceEnabled) {
//         locationMessage.value = 'Location services are disabled.';
//         return;
//       }
//     }
//
//     _permissionGranted = await location.hasPermission();
//     if (_permissionGranted == PermissionStatus.denied) {
//       // Get the current context
//       BuildContext? currentContext = Get.context;
//       if (currentContext == null) {
//         locationMessage.value = 'Failed to get context.';
//         return;
//       }
//
//       // Show dialog to request location permissions
//       bool? permissionGranted = await showLocationPermissionDialog(currentContext);
//       if (permissionGranted != true) {
//         locationMessage.value = 'Location permission denied.';
//         return;
//       }
//
//       _permissionGranted = await location.requestPermission();
//       if (_permissionGranted != PermissionStatus.granted) {
//         locationMessage.value = 'Location permission denied.';
//         return;
//       }
//     }
//
//     _locationData = await location.getLocation();
//     try {
//       _locationData = await location.getLocation();
//     } catch (e) {
//       print('Error fetching location: $e');
//     }
//
//     // Ensure MapController is initialized and accessible
//     MapController mapController = Get.find<MapController>();
//     if (mapController != null) {
//       mapController.moveCameraToLatLng(
//         LatLng(_locationData.latitude ?? 0.0, _locationData.longitude ?? 0.0),
//       );
//     } else {
//       printError(info: "MapController is null or not initialized.");
//     }
//
//     locationMessage.value =
//     'Latitude: ${_locationData.latitude}, Longitude: ${_locationData.longitude}';
//   }
//
//   Future<bool?> showLocationPermissionDialog(BuildContext context) async {
//     return showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: Text('Location Permission'),
//         content: Text('This app requires access to your location. Please grant the location permission to continue.'),
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.of(context).pop(false),
//             child: Text('Deny'),
//           ),
//           TextButton(
//             onPressed: () => Navigator.of(context).pop(true),
//             child: Text('Allow'),
//           ),
//         ],
//       ),
//     );
//   }
// }
