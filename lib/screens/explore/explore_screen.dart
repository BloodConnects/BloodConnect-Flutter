import 'dart:async';
import 'dart:convert';
import 'package:blood_donation_app/api/model/LocationModel.dart';
import 'package:blood_donation_app/controller/location_controller.dart';
import 'package:blood_donation_app/custom_cards/user_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_places_flutter/google_places_flutter.dart';
import 'package:google_places_flutter/model/prediction.dart';
import 'package:http/http.dart' as http;
import '../../controller/map_controller.dart';
import 'Pre.dart';
import 'package:geolocator/geolocator.dart';

class ExploreScreen extends StatelessWidget {
  ExploreScreen({super.key});

  TextEditingController search = TextEditingController();
  MapController mapController = Get.put(MapController());
  // LocationController locationController = Get.put(LocationController());
  Completer<GoogleMapController> controller = Completer<GoogleMapController>();
  Completer<GoogleMapController> completerController =
      Completer<GoogleMapController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Obx(
            () => GoogleMap(
              mapType: MapType.normal,
              initialCameraPosition: MapController.kGooglePlex,
              zoomControlsEnabled: false,
              onMapCreated: (GoogleMapController googleMapController) {
                controller.complete(googleMapController);
              },
              myLocationEnabled: true,
              markers: Set.from(mapController.markers),
              myLocationButtonEnabled: true,
              compassEnabled: true,
            ),
          ),
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 15, right: 15,
                  top: 60,
                ),
                child: Container(
                  height: 48,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(24),
                    ),
                    color: Colors.white,
                    // color: Color.fromARGB(255, 222, 221, 221),
                  ),
                  child: GooglePlaceAutoCompleteTextField(
                    textEditingController: search,
                    googleAPIKey: "AIzaSyBoEK1cMECtgHIm-VBpbdBKiyeTaGiXA6o",
                    boxDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    containerVerticalPadding: 1,
                    inputDecoration: const InputDecoration(
                      border: InputBorder.none,
                      isDense: true,
                      hintText: 'Search Location',
                      prefixIcon: Icon(
                        Icons.search,
                        size: 28,
                      ),
                    ),
                    debounceTime: 800,
                    countries: const ["in", "fr"],
                    isLatLngRequired: true,
                    getPlaceDetailWithLatLng: (Prediction prediction) {
                      print("placeDetails${prediction.lng}");
                    },
                    itemClick: (Prediction prediction) async {
                      var location = await prediction.toLocationModel();
                      search.text = prediction.description!;
                      search.selection = TextSelection.fromPosition(
                        TextPosition(offset: prediction.description!.length),
                      );
                      if (location.latitude != null &&
                          location.longitude != null) {
                        var mapController = await controller.future;
                        mapController.animateCamera(CameraUpdate.newLatLngZoom(
                            LatLng(location.latitude!, location.longitude!),
                            15));
                      } else {
                        Get.snackbar('', "Can't get latitude and longitude");
                      }

                    },
                    itemBuilder: (context, index, Prediction prediction) {
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          // color: Colors.grey[300]
                        ),
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          children: [
                            const Icon(Icons.location_on),
                            const SizedBox(
                              width: 7,
                            ),
                            Expanded(child: Text(prediction.description ?? ""))
                          ],
                        ),
                      );
                    },
                    seperatedBuilder: const Divider(),
                    isCrossBtnShown: true,
                    containerHorizontalPadding: 4,
                  ),
                ),
              ),
              // Positioned(
              //   right: 15,
              //   top: 95,
              //   child: SizedBox(
              //     height: 60,
              //     width: 60,
              //     child: FloatingActionButton(
              //       onPressed: () async{
              //         Position position = await getUserCurrentLocation();
              //         mapController.moveCameraToLatLng(position.latitude, position.longitude);
              //         // getUserCurrentLocation().then((value) async {
              //         //   print(value.latitude.toString() +
              //         //       " " +
              //         //       value.longitude.toString());
              //         //
              //         //   Position position =
              //         //       await Geolocator.getCurrentPosition();
              //         //   LatLng latLng =
              //         //       LatLng(position.latitude, position.longitude);
              //         //
              //         //   // Move camera to user's current location
              //         //   mapController.moveCameraToLatLng(latLng);
              //         //
              //         //   // Add marker for current user's location
              //         //   mapController.markers.add(
              //         //     Marker(
              //         //       markerId: MarkerId("2"),
              //         //       position: LatLng(value.latitude, value.longitude),
              //         //       infoWindow: InfoWindow(
              //         //         title: 'My Current Location',
              //         //       ),
              //         //     ),
              //         //   );
              //         //
              //         //   // Specify current user's location
              //         //   CameraPosition cameraPosition = CameraPosition(
              //         //     target: LatLng(value.latitude, value.longitude),
              //         //     zoom: 14,
              //         //   );
              //         //
              //         //   final GoogleMapController controller =
              //         //       await completerController.future;
              //         //   controller.animateCamera(
              //         //       CameraUpdate.newCameraPosition(cameraPosition));
              //         //   Get.find<MapController>()
              //         //       .updateCameraPosition(cameraPosition);
              //         // });
              //       },
              //       child: const Center(
              //         child: Icon(Icons.explore_outlined, size: 28,),
              //       ),
              //     ),
              //   ),
              // ),
              Stack(
                children: [
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 10),
                        child: Row(
                          children: [
                            buildUserCard(
                              name: 'Priyanka Fulwari',
                              bloodType: 'A positive',
                              gender: 'Female',
                              location: 'Ahmedabad, Gujarat',
                              imagePath: 'Assets/Images/images.jpeg',
                              onContactPressed: () {},
                            ),
                            const SizedBox(width: 10),
                            buildUserCard(
                              name: 'Priyanka Fulwari',
                              bloodType: 'A positive',
                              gender: 'Female',
                              location: 'Ahmedabad, Gujarat',
                              imagePath: 'Assets/Images/images.jpeg',
                              onContactPressed: () {},
                            ),
                            const SizedBox(width: 10),
                            buildUserCard(
                              name: 'Priyanka Fulwari',
                              bloodType: 'A positive',
                              gender: 'Female',
                              location: 'Ahmedabad, Gujarat',
                              imagePath: 'Assets/Images/images.jpeg',
                              onContactPressed: () {},
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<Position> getUserCurrentLocation() async {
    await Geolocator.requestPermission()
        .then((value) {})
        .onError((error, stackTrace) async {
      await Geolocator.requestPermission();
      print("ERROR" + error.toString());
    });
    return await Geolocator.getCurrentPosition();
  }
}

extension PredictionExtension on Prediction {
  Future<LocationModel> toLocationModel() async {
    String placeUrl =
        'https://maps.googleapis.com/maps/api/place/details/json?placeid=${this.placeId}&key=AIzaSyBoEK1cMECtgHIm-VBpbdBKiyeTaGiXA6o';
    var reponse = await http.get(Uri.parse(placeUrl));
    var data = jsonDecode(reponse.body) as Map<String, dynamic>;
    var temp = Pre.fromJson(data);
    return LocationModel(
      latitude: temp.result?.geometry?.location?.lat,
      longitude: temp.result?.geometry?.location?.lng,
      street: temp.result?.addressComponents
          ?.firstWhere(
              (element) => element.types?.contains("political") == true)
          .longName,
      city: temp.result?.addressComponents
          ?.firstWhere((element) => element.types?.contains("locality") == true)
          .longName,
      state: temp.result?.addressComponents
          ?.firstWhere((element) =>
              element.types?.contains("administrative_area_level_1") == true)
          .longName,
      country: temp.result?.addressComponents
          ?.firstWhere((element) => element.types?.contains("country") == true)
          .longName,
      postalCode: temp.result?.addressComponents
          ?.firstWhere(
              (element) => element.types?.contains("postal_code") == true)
          .longName,
    );
  }
}
