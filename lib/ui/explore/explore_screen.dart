import 'dart:async';
import 'dart:convert';
import 'package:blood_donation_app/data/api/api_fuctions/donor_list.dart';
import 'package:blood_donation_app/domain/location_manager.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_places_flutter/google_places_flutter.dart';
import 'package:google_places_flutter/model/prediction.dart';
import 'package:http/http.dart' as http;
import '../../data/api/api_constant/api_constants.dart';
import '../../data/api/model/LocationModel.dart';
import '../../domain/share_preference/share_preference_service.dart';
import 'explore_list_container.dart';
import 'map_controller.dart';

class ExploreScreen extends StatelessWidget {
  ExploreScreen({super.key});

  TextEditingController search = TextEditingController();
  MapController mapController = Get.put(MapController());
  DonorListController donorListController = Get.put(DonorListController());
  Completer<GoogleMapController> controller = Completer<GoogleMapController>();
  LatLng currentLatLng = const LatLng(0.0, 0.0);

  @override
  Widget build(BuildContext context) {

    LocationManager().getCurrentLocation().then((value) async {
      if (value == null) return;
      var googleMapController = await controller.future;
      var userLocation = LatLng(value.latitude!, value.longitude!);
      donorListController.fetchApiFile(null,userLocation);
      googleMapController.animateCamera(CameraUpdate.newLatLngZoom(userLocation, 15));
    });

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
              onLongPress: (LatLng latLng) {
                mapController.moveCameraToLatLng(
                    latLng.longitude, latLng.latitude);
              },
              myLocationEnabled: false,
              markers: Set.from(donorListController.markers),
              myLocationButtonEnabled: false,
              compassEnabled: false,
            ),
          ),
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 15,
                  right: 15,
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
                      if (kDebugMode) {
                        print("placeDetails${prediction.lng}");
                      }
                    },
                    itemClick: (Prediction prediction) async {
                      var location = await prediction.toLocationModel();
                      search.text = prediction.description!;
                      prediction.placeId;
                      search.selection = TextSelection.fromPosition(
                        TextPosition(offset: prediction.description!.length),
                      );
                      if (location?.latitude != null &&
                          location?.longitude != null) {
                        var mapController = await controller.future;
                        mapController.animateCamera(CameraUpdate.newLatLngZoom(
                            LatLng(location!.latitude!, location.longitude!),
                            15));
                      } else {
                        Get.snackbar('', "Can't get latitude and longitude");
                      }
                    },
                    itemBuilder: (context, index, Prediction prediction) {
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
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
              Stack(
                children: [
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Obx( ()=> CarouselSlider.builder(
                          itemCount: donorListController.donor.length,
                          itemBuilder: (BuildContext context, int itemIndex,
                                  int pageViewIndex) =>
                              Container(
                                child: ExploreListContainer(
                                    donor: donorListController.donor[itemIndex],
                                    onContactPressed: () {}),
                              ),
                          options: CarouselOptions(
                            height: 200,
                            aspectRatio: 16 / 9,
                            viewportFraction: 0.8,
                            initialPage: 0,
                            enableInfiniteScroll: false,
                            reverse: false,
                            scrollDirection: Axis.horizontal,
                            onPageChanged: (index, reason) async {
                              var googleMapController = await controller.future;
                              googleMapController.animateCamera(
                                  CameraUpdate.newLatLngZoom(
                                      donorListController.markers[index].position,
                                      15));
                            },
                          )),
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
      if (kDebugMode) {
        print("ERROR$error");
      }
    });
    return await Geolocator.getCurrentPosition();
  }
}

extension PredictionExtension on Prediction {
  Future<LocationModel?> toLocationModel() async {
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${await SharePreferenceService().getUserToken()}'
    };
    try {
      String placeUrl =
          '${ApiConstants.baseUrl}${ApiConstants.getLocation}?placeId=$placeId';
      var response = await http.get(Uri.parse(placeUrl), headers: headers);
      var data = jsonDecode(response.body) as Map<String, dynamic>;
      return LocationModel.fromJson(data['data']);
    } catch (e) {
      if (kDebugMode) {
        print("error message: $e");
      }
      return null;
    }
  }
}
