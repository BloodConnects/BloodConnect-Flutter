import 'dart:convert';

import 'package:blood_donation_app/api/api_constant/api_constants.dart';
import 'package:blood_donation_app/api/api_controller/update_data_controller.dart';
import 'package:blood_donation_app/api/api_fuctions/login_user.dart';
import 'package:blood_donation_app/api/api_fuctions/register_user.dart';
import 'package:blood_donation_app/api/model/userModel.dart';
import 'package:blood_donation_app/controller/blood_group_controller.dart';
import 'package:blood_donation_app/controller/mycontroller.dart';
import 'package:blood_donation_app/dynamic_widgets/dynamic_button.dart';
import 'package:blood_donation_app/dynamic_widgets/dynamic_text_field.dart';
import 'package:blood_donation_app/enum_classes/blood_group.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../api/api_controller/editing_controller.dart';
import '../../enum_classes/gender.dart';

class EditProfileScreen extends StatelessWidget {
  List<Map<String, dynamic>> genderList = [
    {'name': 'Male', 'image': 'Assets/Images/male.png', 'value': Gender.Male},
    {
      'name': 'Female',
      'image': 'Assets/Images/female.png',
      'value': Gender.Female
    },
    {
      'name': 'Other',
      'image': 'Assets/Images/other.png',
      'value': Gender.Other
    },
  ];

  var editingController = Get.put(EditingController());

  TextEditingController nameController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController datOfBirthController = TextEditingController();
  TextEditingController emailAddressController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();


  //
  // @override
  // void onInit()async{
  //   var userModel =  await getUserModel();
  //   nameController.text = userModel.fullName ?? '';
  //   super.onInit();
  // }

  @override
  Widget build(BuildContext context) {
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
          'Edit Profile',
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
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Column(
            children: [
              Center(
                child: CircleAvatar(
                  radius: 70,
                  backgroundImage:  NetworkImage(editingController.profilePicture.value)
                  ,
                ),
              ),
              const SizedBox(
                height: 20,
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
                      DynamicTextField(
                        controller: editingController.nameController,
                        keyboardType: TextInputType.text,
                        labelText: 'Full Name',
                        hintText: 'Enter Full Name',
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      DynamicTextField(
                        controller: editingController.mobileController,
                        keyboardType: TextInputType.phone,
                        labelText: 'Mobile Number',
                        hintText: 'Enter Mobile Number',
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      DynamicTextField(
                        controller: editingController.emailAddressController,
                        keyboardType: TextInputType.emailAddress,
                        labelText: 'Email Address',
                        hintText: 'Enter Email Address',
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Obx(() {
                        return DropdownButtonFormField<BloodGroup>(
                          value: editingController.selectedBlood.value,
                          items: const [
                            BloodGroup.oPositive,
                            BloodGroup.oNegative,
                            BloodGroup.abPositive,
                            BloodGroup.abNegative,
                            BloodGroup.aPositive,
                            BloodGroup.aNegative,
                            BloodGroup.bNegative,
                            BloodGroup.bPositive,
                            BloodGroup.unknown,
                          ].map((BloodGroup value) {
                            return DropdownMenuItem(
                              value: value,
                              child: Text(value.toDisplayText()),
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            editingController.onSelected(newValue!);
                          },
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                            ),
                            hintText: 'Select Blood Group',
                            prefixIcon: Icon(Icons.bloodtype_rounded),
                          ),
                        );
                      }),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'Gender',
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Inter',
                            fontSize: 16),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: SizedBox(
                          width: double.infinity,
                          child: Wrap(
                            spacing: 8,
                            children: genderList
                                .map(
                                  (gender) => GestureDetector(
                                    onTap: () {
                                      editingController
                                          .onSelectedGender(gender['value']);
                                    },
                                    child: genderWidget(
                                      gender['image']!,
                                      gender['value']!,
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      DynamicTextField(
                        controller: editingController.birthDateController,
                        keyboardType: TextInputType.text,
                        labelText: 'Date Of Birth',
                        hintText: 'Enter Date Of Birth',
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      DynamicTextField(
                        controller: editingController.weightController,
                        keyboardType: TextInputType.text,
                        labelText: 'Weight',
                        hintText: 'Enter Weight',
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      DynamicTextField(
                        controller: editingController.heightController,
                        keyboardType: TextInputType.text,
                        labelText: 'Height',
                        hintText: 'Enter Height',
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      DynamicButton(
                        onPressed: () {
                          RegisterUser().updateUserData(
                            UserModel(
                              uid: editingController.userModel.uid,
                              fullName: editingController.nameController.text,
                              mobileNumber: editingController.mobileController.text,
                              mailAddress: editingController.emailAddressController.text,
                              bloodGroup: editingController.selectedBlood.value,
                              gender: editingController.selectedGender.value,
                              birthDate: int.parse(editingController.birthDateController.text.toString()),
                              weight: double.parse(editingController.weightController.text.toString()),
                              profilePictureUrl: editingController.profilePicture.value,
                              height: double.parse(editingController.heightController.text.toString()),
                              userToken: editingController.userModel.userToken,
                            ),
                          );
                        },
                        buttonText: 'Save',
                        backgroundColor: Colors.red,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'Delete Account',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget genderWidget(String imageUrl, Gender genderType) {
    return Stack(
      children: [
        Obx(
          () {
            return Column(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(imageUrl),
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                        editingController.selectedGender.value == genderType
                            ? Colors.red.withOpacity(0.3)
                            : Colors.transparent,
                        BlendMode.darken,
                      ),
                    ),
                    shape: BoxShape.circle,
                    border: Border.all(
                      color:
                          editingController.selectedGender.value == genderType
                              ? Colors.red
                              : Colors.white12,
                    ),
                  ),
                  child: Visibility(
                    visible:
                        editingController.selectedGender.value == genderType,
                    child: const Icon(
                      Icons.check,
                      size: 40,
                      color: Colors.red,
                    ),
                  ),
                ),
                Text(
                  genderType.toDisplayText(),
                  style: const TextStyle(
                      fontFamily: 'Inter', fontSize: 14, color: Colors.black),
                )
              ],
            );
          },
        ),
      ],
    );
  }
}

Future<UserModel> getUserModel() async {
  var pref = await SharedPreferences.getInstance();
  var temp = pref.getString('login');
  var userModel = UserModel.fromJson(jsonDecode(temp!));
  return userModel;
}