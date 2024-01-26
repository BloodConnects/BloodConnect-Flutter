import 'package:blood_donation_app/controller/blood_request_controller.dart';
import 'package:blood_donation_app/controller/urgency_slider_controller.dart';
import 'package:blood_donation_app/screens/blood_request_form_answer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'maps.dart';

class BloodRequestScreen extends StatelessWidget {
  const BloodRequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController mobileNumberController = TextEditingController();
    TextEditingController emailAddressController = TextEditingController();
    TextEditingController searchController = TextEditingController();
    TextEditingController genderController = TextEditingController();
    TextEditingController bloodGroupController = TextEditingController();
    TextEditingController bloodUnitsController = TextEditingController();
    UrgencySliderController urgencySliderController =
        Get.put(UrgencySliderController());
    BloodRequestController bloodRequestController = Get.put(BloodRequestController());
    TextEditingController reasonController = TextEditingController();
    TextEditingController notesController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(5.0),
          child: CircleAvatar(
            radius: 12,
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
                      TextField(
                        controller: nameController,
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                          labelText: 'Full Name',
                          hintText: 'Enter Full Name',
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
                        height: 10,
                      ),
                      TextField(
                        controller: mobileNumberController,
                        keyboardType: TextInputType.phone,
                        decoration: const InputDecoration(
                          labelText: 'Mobile Number',
                          hintText: 'Enter Mobile Number',
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
                        height: 10,
                      ),
                      TextField(
                        controller: emailAddressController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          labelText: 'Email Address',
                          hintText: 'Enter Email Address',
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
                            hintStyle: TextStyle(
                              fontFamily: 'Inter',
                              color: Colors.white,
                            ),
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
                          borderRadius: BorderRadius.circular(12),
                          child: const MapScreen(),
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
                          items: const [
                            'Male',
                            'Female',
                            'Other'
                          ].map((String value) {
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
                        return DropdownButtonFormField<String>(
                          value: bloodRequestController.selectedBloodGroup.value,
                          items: const [
                            'A Positiver',
                            'A Negative',
                            'B Positive',
                            'B Negative',
                            'O Positive',
                            'O Negative',
                            'AB Positive',
                            'AB Negative'
                          ].map((String value) {
                            return DropdownMenuItem(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            bloodRequestController.onSelectedBloodGroup(newValue!);
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
                          value: bloodRequestController.selectedBloodUnits.value,
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
                            bloodRequestController.onSelectedBloodUnits(newValue!);
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
                          value: urgencySliderController.urgentSliderValue.value,
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
                      TextField(
                        controller: reasonController,
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                          labelText: 'Reason',
                          hintText: 'Enter Reason... e.g.Accident',
                          hintStyle: TextStyle(
                            fontFamily: 'Inter',
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextField(
                        controller: notesController,
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                          labelText: 'Notes',
                          hintText: 'Enter Notes',
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
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                height: 45,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Get.to(const BloodRequestFormAnswer());
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
                    'Continue',
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
    );
  }
}