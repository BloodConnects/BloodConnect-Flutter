import 'package:blood_donation_app/screens/maps.dart';
import 'package:blood_donation_app/custom_cards/user_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../controller/mycontroller.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    MyController myController = Get.put(MyController());
    TextEditingController search = TextEditingController();
    FocusNode searchFocusNode = FocusNode();
    // MapController mapController = Get.put(MapController());

    return Scaffold(
      body: Stack(
        children: [
          const MapScreen(),
          // GoogleMap(
          //   mapType: MapType.normal,
          //   initialCameraPosition: MapController.kGooglePlex,
          //   markers: Set<Marker>.of(mapController.marker),
          //   onMapCreated: (GoogleMapController controller) {
          //     mapController.controller.complete(controller);
          //   },
          // ),
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 38,
                ),
                child: Container(
                  height: 45,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(22),
                    ),
                    color: Color.fromARGB(255, 222, 221, 221),
                  ),
                  child: Center(
                    child: TextFormField(
                      focusNode: searchFocusNode,
                      onTap: () {
                        // Show the second container when clicking on the TextField
                        myController.toggleSecondContainerVisibility();
                      },
                      textAlign: TextAlign.left,
                      controller: search,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(22)),
                          borderSide: BorderSide.none,
                        ),
                        prefixIcon: Icon(Icons.search),
                        hintText: 'Search',
                      ),
                    ),
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
