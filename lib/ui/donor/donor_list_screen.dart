import 'package:blood_donation_app/data/enum_classes/blood_group.dart';
import 'package:blood_donation_app/ui/donor/donor_list_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter_platform_interface/src/types/location.dart';
import '../../data/api/api_fuctions/donor_list.dart';

class DonorListScreen extends StatelessWidget {
  DonorListScreen({super.key,required this.bloodGroup, required this.latLng});

  final BloodGroup? bloodGroup;
  final LatLng latLng;

  DonorListController donorListController = Get.put(DonorListController());

  @override
  Widget build(BuildContext context) {
    donorListController.fetchApiFile(bloodGroup,latLng);
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
          'Donor List',
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      body: Obx(() {
        if (donorListController.donor.isEmpty) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: ListView.builder(
                itemCount: donorListController.donor.length,
                itemBuilder: (context, index) {
                  return DonorListContainer(
                      donor: donorListController.donor[index]);
                }),
          );
        }
      }),
    );
  }
}
