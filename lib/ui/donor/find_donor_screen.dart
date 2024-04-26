import 'dart:async';
import 'package:blood_donation_app/data/api/model/LocationModel.dart';
import 'package:blood_donation_app/data/enum_classes/blood_group.dart';
import 'package:blood_donation_app/ui/donor/slider_controller.dart';
import 'package:blood_donation_app/ui/explore/explore_screen.dart';
import 'package:blood_donation_app/ui/utils/dynamic_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_places_flutter/google_places_flutter.dart';
import 'package:google_places_flutter/model/prediction.dart';

import '../../data/api/model/blood_group_model.dart';
import '../explore/map_controller.dart';
import 'donor_list_screen.dart';

class FindDonorScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    final DonorController controllers = Get.put(DonorController());
    final SliderController sliderController = Get.put(SliderController());
    Completer<GoogleMapController> controller = Completer<GoogleMapController>();
    LatLng currentLatLng = const LatLng(0.0, 0.0);
    RxList<Marker> markers = <Marker>[].obs;


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
          padding: const EdgeInsets.only(left: 15, right: 15, top: 8),
          child: Column(
            children: [
              Container(
                height: 255,
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
                child: Stack(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Text(
                        'Blood Type',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 10, right: 10, top: 45, bottom: 10),
                      child: GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: 8,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                            mainAxisSpacing: 8,
                            crossAxisSpacing: 8,
                            mainAxisExtent: 95,
                          ),
                          itemBuilder: (context, index) {
                            BloodGroupModel bloodGroups = bloodGroupList[index];
                            return Obx(
                              () => GestureDetector(
                                onTap: () {
                                  controllers.toggleSelection(index);
                                },
                                child: Container(
                                  height: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: controllers.isSelected(index)
                                        ? Colors.redAccent[100]
                                        : Colors.grey[300],
                                  ),
                                  child: Center(
                                    child: SvgPicture.asset(
                                      bloodGroups.image,
                                      height: 50,
                                      width: 50,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                    )
                  ],
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
                          fontSize: 15,
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
                          itemClick: (Prediction prediction) async {
                            var location = await prediction.toLocationModel();
                            controllers.updateText("${location?.address} ${location?.city} ${location?.state} ${location?.postalCode}");
                            searchController.text = prediction.description!;
                            searchController.selection = TextSelection.fromPosition(TextPosition(offset: prediction.description!.length));
                            if (location?.latitude != null && location?.longitude != null) {
                              var mapController = await controller.future;
                              currentLatLng = LatLng(location!.latitude!, location.longitude!);
                              mapController.animateCamera(CameraUpdate.newLatLngZoom(currentLatLng, 15));
                              markers.clear();
                              markers.add(Marker(markerId: const MarkerId('1'),position: currentLatLng));
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
                          borderRadius: BorderRadius.circular(8),
                          child: Obx(
                            ()=> GoogleMap(
                              mapType: MapType.normal,
                              mapToolbarEnabled: false,
                              initialCameraPosition: MapController.kGooglePlex,
                              zoomControlsEnabled: false,
                              markers: Set.from(markers),
                              onMapCreated: (GoogleMapController googleMapController) {
                                controller.complete(googleMapController);
                              },
                              myLocationButtonEnabled: false,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Obx(
                        () => Text(
                          controllers.text.value.isEmpty
                              ? "Full Address \nWith Zip code and Streets"
                              : controllers.text.value,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      const Divider(),
                      const Text(
                        'Distance',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Obx(
                        () => Slider(
                          value: sliderController.sliderValue.value,
                          divisions: 10,
                          label:
                              sliderController.sliderValue.round().toString(),
                          onChanged: (value) {
                            sliderController.updateSlider(value);
                          },
                          activeColor: Colors.red,
                          min: 10,
                          max: 100,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              DynamicButton(
                onPressed: () {
                  BloodGroup? bloodGroup;
                  if (controllers.selectedIndex.value==-1) {
                    bloodGroup = null;
                  } else {
                    bloodGroup = bloodGroupList[controllers.selectedIndex.value].bloodGroup;
                  }
                  Get.to(DonorListScreen(bloodGroup: bloodGroup,latLng: currentLatLng));
                },
                buttonText: 'Continue',
              ),
              const SizedBox(
                height: 8,
              )
            ],
          ),
        ),
      ),
    );
  }

  List<BloodGroupModel> bloodGroupList = [
    BloodGroupModel(bloodGroup: BloodGroup.oNegative, image: 'Assets/Images/o nagative.svg'),
    BloodGroupModel(bloodGroup: BloodGroup.oPositive, image: 'Assets/Images/o positive.svg'),
    BloodGroupModel(bloodGroup: BloodGroup.aNegative, image: 'Assets/Images/a negative.svg'),
    BloodGroupModel(bloodGroup: BloodGroup.aPositive, image: 'Assets/Images/A positive.svg'),
    BloodGroupModel(bloodGroup: BloodGroup.bNegative, image: 'Assets/Images/b nagative.svg'),
    BloodGroupModel(bloodGroup: BloodGroup.bPositive, image: 'Assets/Images/b positive.svg'),
    BloodGroupModel(bloodGroup: BloodGroup.abNegative, image: 'Assets/Images/ab nagative.svg'),
    BloodGroupModel(bloodGroup: BloodGroup.abPositive, image: 'Assets/Images/ab positive.svg'),
  ];
}

class DonorController extends GetxController {

  final text = ''.obs;
  final location = Rx<LocationModel>(LocationModel());

  void updateText(String value) {
    text.value = value;
  }

  RxInt selectedIndex = RxInt(-1);
  RxString fullAddress = "".obs;

  bool isSelected(int index) {
    return selectedIndex==index;
  }

  void toggleSelection(int index) {
    selectedIndex.value = index;
  }
}
