import 'dart:async';
import 'package:blood_donation_app/ui/donor/blood_group_controller.dart';
import 'package:blood_donation_app/ui/donor/blood_request_controller.dart';
import 'package:blood_donation_app/ui/donor/urgency_slider_controller.dart';
import 'package:blood_donation_app/ui/utils/dynamic_button.dart';
import 'package:blood_donation_app/ui/utils/dynamic_text_field.dart';
import 'package:blood_donation_app/ui/explore/explore_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_places_flutter/google_places_flutter.dart';
import 'package:google_places_flutter/model/prediction.dart';
import '../../data/enum_classes/blood_group.dart';
import '../explore/map_controller.dart';
import 'blood_request_form_answer.dart';

class BloodRequestScreen extends StatelessWidget {
  BloodRequestScreen({
    super.key,
  });

  TextEditingController nameController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController emailAddressController = TextEditingController();
  TextEditingController searchController = TextEditingController();
  UrgencySliderController urgencySliderController =
      Get.put(UrgencySliderController());
  BloodGroupController bloodGroupController = Get.put(BloodGroupController());
  BloodRequestController bloodRequestController =
      Get.put(BloodRequestController());
  TextEditingController reasonController = TextEditingController();
  TextEditingController notesController = TextEditingController();
  Completer<GoogleMapController> controller = Completer<GoogleMapController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(5.0),
          child: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_rounded),
            onPressed: () {
              Get.back();
            },
          ),
        ),
        centerTitle: true,
        title: const Text(
          'Blood Request',
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
          child: Column(
            children: [
              Container(
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  child: Column(
                    children: [
                      DynamicTextField(
                        controller: nameController,
                        keyboardType: TextInputType.text,
                        labelText: 'Full Name',
                        hintText: 'Enter Full Name',
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      DynamicTextField(
                        controller: mobileNumberController,
                        keyboardType: TextInputType.phone,
                        labelText: 'Mobile Number',
                        hintText: 'Enter Mobile Number',
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      DynamicTextField(
                        controller: emailAddressController,
                        keyboardType: TextInputType.emailAddress,
                        labelText: 'Email Address',
                        hintText: 'Enter Email Address',
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Location',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Inter',
                          fontSize: 14,
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
                          googleAPIKey:
                              "AIzaSyBoEK1cMECtgHIm-VBpbdBKiyeTaGiXA6o",
                          boxDecoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          containerVerticalPadding: 1,
                          inputDecoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Search Location',
                            isDense: true,
                            prefixIcon: Icon(
                              Icons.search,
                              size: 22,
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
                            searchController.text = prediction.description!;
                            searchController.selection =
                                TextSelection.fromPosition(TextPosition(
                                    offset: prediction.description!.length));

                            if (location?.latitude != null &&
                                location?.longitude != null) {
                              var mapController = await controller.future;
                              mapController.animateCamera(
                                  CameraUpdate.newLatLngZoom(
                                      LatLng(location!.latitude!,
                                          location!.longitude!),
                                      15));
                            } else {
                              Get.snackbar(
                                  '', "Can't get latitude and longitude");
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
                                  Expanded(
                                      child: Text(prediction.description ?? ""))
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
                          borderRadius: BorderRadius.circular(12),
                          child: GoogleMap(
                            mapType: MapType.normal,
                            initialCameraPosition: MapController.kGooglePlex,
                            zoomControlsEnabled: false,
                            onMapCreated:
                                (GoogleMapController googleMapController) {
                              controller.complete(googleMapController);
                            },
                            myLocationButtonEnabled: true,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'Full Address \nWith Zip Code and State',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 12,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Obx(() {
                        return DropdownButtonFormField<String>(
                          value: bloodRequestController.selectedGender.value,
                          items: const ['Male', 'Female', 'Other']
                              .map((String value) {
                            return DropdownMenuItem(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            bloodRequestController.onSelectedGender(newValue!);
                          },
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                            ),
                            hintText: 'Select Gender',
                            prefixIcon: Icon(Icons.person_outline_sharp),
                          ),
                        );
                      }),
                      const SizedBox(
                        height: 10,
                      ),
                      Obx(() {
                        return DropdownButtonFormField<BloodGroup>(
                          value: bloodGroupController.selectedValue.value,
                          items: const [
                            BloodGroup.oPositive,
                            BloodGroup.oNegative,
                            BloodGroup.aPositive,
                            BloodGroup.aNegative,
                            BloodGroup.bPositive,
                            BloodGroup.bNegative,
                            BloodGroup.abPositive,
                            BloodGroup.abNegative,
                            BloodGroup.unknown
                          ].map((BloodGroup value) {
                            return DropdownMenuItem(
                              value: value,
                              child: Text(value.toDisplayText()),
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            bloodGroupController.onSelected(newValue!);
                          },
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                            ),
                            hintText: 'Select Blood Group',
                            prefixIcon: Icon(Icons.bloodtype),
                          ),
                        );
                      }),
                      const SizedBox(
                        height: 10,
                      ),
                      Obx(() {
                        return DropdownButtonFormField<String>(
                          value:
                              bloodRequestController.selectedBloodUnits.value,
                          items: const [
                            '200 ml',
                            '300 ml',
                            '400 ml',
                            '500 ml',
                            '600 ml ',
                            '700 ml',
                            '800 ml',
                            '900 ml',
                            '1000 ml'
                          ].map((String value) {
                            return DropdownMenuItem(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            bloodRequestController
                                .onSelectedBloodUnits(newValue!);
                          },
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                            ),
                            hintText: 'Select Blood Units',
                            prefixIcon: Icon(Icons.bloodtype),
                          ),
                        );
                      }),
                      const SizedBox(
                        height: 15,
                      ),
                      const Text(
                        'Urgency',
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Inter',
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      Obx(
                        () => Slider(
                          value:
                              urgencySliderController.urgentSliderValue.value,
                          divisions: 10,
                          label: urgencySliderController.urgentSliderValue
                              .round()
                              .toString(),
                          onChanged: (value) {
                            urgencySliderController.updateUrgentSlider(value);
                          },
                          activeColor: Colors.red,
                          min: 0,
                          max: 100,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      DynamicTextField(
                        controller: reasonController,
                        keyboardType: TextInputType.text,
                        labelText: 'Reason',
                        hintText: 'Enter Reason, e.g.Accident',
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      DynamicTextField(
                        controller: notesController,
                        keyboardType: TextInputType.text,
                        labelText: 'Notes',
                        hintText: 'Enter Notes',
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              DynamicButton(
                onPressed: () {
                  Get.to(const BloodRequestFormAnswer());
                },
                buttonText: 'Continue',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
