import 'package:blood_donation_app/api/model/LocationModel.dart';
import 'package:blood_donation_app/api/model/UserRepositry.dart';
import 'package:blood_donation_app/controller/map_controller.dart';
import 'package:blood_donation_app/dynamic_widgets/dynamic_button.dart';
import 'package:blood_donation_app/dynamic_widgets/dynamic_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../screens/explore/maps.dart';

class AddLocationScreen extends StatelessWidget {
  const AddLocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    TextEditingController houseNoController = TextEditingController();
    TextEditingController streetController = TextEditingController();
    TextEditingController addressController = TextEditingController();
    MapController mapController = Get.put(MapController());

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
              children: [
                const Row(
                  children: [
                    Text(
                      'Add Location',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Spacer(),
                    CircleAvatar(
                      radius: 16,
                    )
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Container(
                  height: 40,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey[400],
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: TextField(
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                      hintStyle:
                          TextStyle(fontFamily: 'Inter', color: Colors.white),
                      hintText: 'Search Location',
                    ),
                    controller: searchController,
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
                    child: MapScreen(mapController),
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
                  onPressed: () {
                    addLocation(LocationModel());
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
