import 'dart:async';
import 'dart:convert';
import 'package:blood_donation_app/domain/location_manager.dart';
import 'package:blood_donation_app/ui/utils/dynamic_button.dart';
import 'package:blood_donation_app/ui/utils/dynamic_text_field.dart';
import 'package:blood_donation_app/ui/explore/explore_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_places_flutter/google_places_flutter.dart';
import 'package:google_places_flutter/model/prediction.dart';
import '../../data/api/api_constant/api_constants.dart';
import '../../data/api/api_fuctions/add_location.dart';
import '../../data/api/model/LocationModel.dart';
import '../../domain/share_preference/share_preference_service.dart';
import 'package:http/http.dart' as http;

class AddLocationScreen extends StatelessWidget {
  const AddLocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    TextEditingController houseNoController = TextEditingController();
    TextEditingController streetController = TextEditingController();
    TextEditingController addressController = TextEditingController();
    Completer<GoogleMapController> mapController =
        Completer<GoogleMapController>();
    LocationModel locationModel = LocationModel();
    GoogleMapController googleMapController;

    LocationManager().getCurrentLocation().then((value) async {
      if (value == null) return;
      googleMapController = await mapController.future;
      var userLocation = LatLng(value.latitude!, value.longitude!);
      googleMapController
          .animateCamera(CameraUpdate.newLatLngZoom(userLocation, 15));
      var locationModel = await userLocation.toLocationModel();
      if (locationModel == null) return;
      houseNoController.text = locationModel.houseNo.toString();
      streetController.text = locationModel.street.toString();
      addressController.text = locationModel.address.toString();
    });

    Future<void> updateLocationData(LocationModel locationModels) async {
      locationModel = locationModels;
      googleMapController = await mapController.future;
      googleMapController.animateCamera(CameraUpdate.newLatLngZoom(
          LatLng(locationModel.latitude!, locationModel.longitude!), 15));
      houseNoController.text = locationModel.houseNo.toString();
      streetController.text = locationModel.street.toString();
      addressController.text = locationModel.address.toString();
    }

    return Dialog(
      child: Container(
        height: 575,
        width: double.infinity,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(1.0, 2.0),
              blurRadius: 2,
              spreadRadius: 1.0,
            )
          ],
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Add Location',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Container(
                  height: 40,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                    color: Color.fromARGB(255, 222, 221, 221),
                  ),
                  child: GooglePlaceAutoCompleteTextField(
                    textEditingController: searchController,
                    googleAPIKey: "AIzaSyBoEK1cMECtgHIm-VBpbdBKiyeTaGiXA6o",
                    boxDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    containerVerticalPadding: 1,
                    inputDecoration: const InputDecoration(
                      border: InputBorder.none,
                      isDense: true,
                      hintText: 'Search Location',
                      prefixIcon: Icon(Icons.search, size: 24),
                    ),
                    debounceTime: 800,
                    countries: const ["in", "fr"],
                    isLatLngRequired: true,
                    itemClick: (Prediction prediction) async {
                      var location = await prediction.toLocationModel();
                      searchController.text = prediction.description!;
                      searchController.selection = TextSelection.fromPosition(
                          TextPosition(offset: prediction.description!.length));

                      if (location?.latitude != null &&
                          location?.longitude != null) {
                        locationModel = location!;
                        updateLocationData(locationModel);
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
                const SizedBox(
                  height: 8,
                ),
                Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: GoogleMap(
                      mapType: MapType.normal,
                      initialCameraPosition: CameraPosition(
                        target: LatLng(
                            locationModel.latitude ?? 0.0,
                            locationModel.longitude ?? 0.0),
                        zoom: 15,
                      ),
                      zoomControlsEnabled: false,
                      onMapCreated: (GoogleMapController googleMapController) {
                        mapController.complete(googleMapController);
                      },
                      myLocationButtonEnabled: true,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                DynamicTextField(
                  controller: houseNoController,
                  keyboardType: TextInputType.number,
                  labelText: 'House Number',
                  hintText: 'Enter House Number',
                ),
                const SizedBox(
                  height: 8,
                ),
                DynamicTextField(
                  controller: streetController,
                  keyboardType: TextInputType.text,
                  labelText: 'Street',
                  hintText: 'Street',
                ),
                const SizedBox(
                  height: 8,
                ),
                DynamicTextField(
                  controller: addressController,
                  keyboardType: TextInputType.text,
                  labelText: 'Address',
                  hintText: 'Enter Address',
                ),
                const SizedBox(
                  height: 8,
                ),
                DynamicButton(
                  onPressed: () async {
                    locationModel.street = streetController.text;
                    locationModel.houseNo = houseNoController.text;
                    locationModel.address = addressController.text;
                    AddLocation().addLocationFunction(locationModel,
                        onClose: () {
                      Get.back();
                    });
                  },
                  buttonText: 'Save',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

extension LatLngExtension on LatLng {
  Future<LocationModel?> toLocationModel() async {
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${await SharePreferenceService().getUserToken()}'
    };
    try {
      String placeUrl =
          '${ApiConstants.baseUrl}${ApiConstants.getLocation}?latitude=$latitude&longitude=$longitude';
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
