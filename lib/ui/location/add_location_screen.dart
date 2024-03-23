import 'dart:async';
import 'package:blood_donation_app/api/api_fuctions/add_location.dart';
import 'package:blood_donation_app/api/model/LocationModel.dart';
import 'package:blood_donation_app/controller/map_controller.dart';
import 'package:blood_donation_app/dynamic_widgets/dynamic_button.dart';
import 'package:blood_donation_app/dynamic_widgets/dynamic_text_field.dart';
import 'package:blood_donation_app/ui/explore/explore_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_places_flutter/google_places_flutter.dart';
import 'package:google_places_flutter/model/prediction.dart';


class AddLocationScreen extends StatelessWidget {
  const AddLocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    TextEditingController houseNoController = TextEditingController();
    TextEditingController streetController = TextEditingController();
    TextEditingController addressController = TextEditingController();
    MapController mapController = Get.put(MapController());

    Completer<GoogleMapController> controller = Completer<GoogleMapController>();

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
                      prefixIcon: Icon(Icons.search, size: 24,),
                    ),
                    debounceTime: 800,
                    countries: const ["in", "fr"],
                    isLatLngRequired: true,
                    getPlaceDetailWithLatLng: (Prediction prediction) {
                      print("placeDetails${prediction.lng}");
                    },
                    itemClick: (Prediction prediction) async {
                      var location = await prediction.toLocationModel();
                      searchController.text = prediction.description!;
                      searchController.selection = TextSelection.fromPosition(
                          TextPosition(offset: prediction.description!.length));

                      if (location?.latitude != null && location?.longitude != null) {
                        var mapController = await controller.future;
                        mapController.animateCamera(CameraUpdate.newLatLngZoom(LatLng(location!.latitude!, location!.longitude!),15));
                        houseNoController.text = location.houseNo.toString();
                        streetController.text = location.street.toString();
                        addressController.text = location.address.toString();
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
                      initialCameraPosition: MapController.kGooglePlex,
                      zoomControlsEnabled: false,
                      onMapCreated: (GoogleMapController googleMapController) {
                        controller.complete(googleMapController);
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
                    AddLocation().addLocationFunction(
                        LocationModel(
                          street: streetController.text,
                          latitude: mapController.currentLatLng.value.latitude,
                          longitude:
                              mapController.currentLatLng.value.longitude,
                          houseNo: houseNoController.text,
                          address: addressController.text,
                          city: '',
                          country: '',
                          state: '',
                          type: LocationType.HOME,
                        ), onClose: () {
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
