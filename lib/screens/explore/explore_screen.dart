import 'dart:async';
import 'dart:convert';
import 'package:blood_donation_app/api/model/LocationModel.dart';
import 'package:blood_donation_app/custom_cards/user_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_places_flutter/google_places_flutter.dart';
import 'package:google_places_flutter/model/prediction.dart';
import 'package:http/http.dart' as http;
import '../../controller/map_controller.dart';
import '../../controller/mycontroller.dart';
import 'Pre.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    MyController myController = Get.put(MyController());
    TextEditingController search = TextEditingController();

    Completer<GoogleMapController> controller =
        Completer<GoogleMapController>();

    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: MapController.kGooglePlex,
            zoomControlsEnabled: false,
            onMapCreated: (GoogleMapController googleMapController) {
              controller.complete(googleMapController);
            },
            myLocationButtonEnabled: true,
          ),
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 38,
                ),
                child: Container(
                  height: 48,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(24),
                    ),
                    color: Color.fromARGB(255, 222, 221, 221),
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
              Obx(
                () => Visibility(
                  visible: myController.isSecondContainerVisible.value,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 15, right: 15, top: 90),
                    child: Container(
                      height: 220,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(12),
                        ),
                        color: Color.fromARGB(255, 222, 221, 221),
                      ),
                      child: ListView.separated(
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 2),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Ahmedabad',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Inter',
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  'Gujarat, India',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Inter',
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return const Divider();
                        },
                      ),
                    ),
                  ),
                ),
              ),
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
              )
            ],
          ),
        ],
      ),
    );
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
            ?.firstWhere(
                (element) => element.types?.contains("locality") == true)
            .longName,
        state: temp.result?.addressComponents
            ?.firstWhere((element) =>
                element.types?.contains("administrative_area_level_1") == true)
            .longName,
        country: temp.result?.addressComponents
            ?.firstWhere(
                (element) => element.types?.contains("country") == true)
            .longName,
        postalCode: temp.result?.addressComponents
            ?.firstWhere(
                (element) => element.types?.contains("postal_code") == true)
            .longName);
  }
}
