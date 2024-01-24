import 'package:blood_donation_app/screens/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../screens/maps.dart';

class AddLocationScreen extends StatelessWidget {
  const AddLocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    TextEditingController houseNoController = TextEditingController();
    TextEditingController streetController = TextEditingController();
    TextEditingController addressController = TextEditingController();

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
                    child: const MapScreen(),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextField(
                  controller: houseNoController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    labelText: 'House No',
                    hintText: 'Enter House No.',
                    hintStyle: TextStyle(
                      fontFamily: 'Inter',
                      color: Colors.black,
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextField(
                  controller: streetController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    labelText: 'Street',
                    hintText: 'Enter Street',
                    hintStyle: TextStyle(
                      fontFamily: 'Inter',
                      color: Colors.black,
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextField(
                  controller: addressController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    labelText: 'Address',
                    hintText: 'Enter Address',
                    hintStyle: TextStyle(
                      fontFamily: 'Inter',
                      color: Colors.black,
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                SizedBox(
                  height: 45,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.to(const HomeScreen());
                    },
                    style: ButtonStyle(
                      backgroundColor: const MaterialStatePropertyAll(Colors.red),
                      shape: MaterialStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    child: const Text(
                      'Save',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}