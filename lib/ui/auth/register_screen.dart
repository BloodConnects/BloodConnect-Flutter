import 'package:blood_donation_app/ui/home_controller.dart';
import 'package:blood_donation_app/ui/utils/dynamic_button.dart';
import 'package:blood_donation_app/ui/utils/dynamic_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../data/api/api_fuctions/register_user.dart';
import '../../data/api/model/userModel.dart';
import '../../data/enum_classes/blood_group.dart';
import '../../data/enum_classes/gender.dart';
import '../donor/blood_group_controller.dart';

class RegisterationScreen extends StatelessWidget {
  RegisterationScreen(this.userModel, {super.key}) {
    fullNameController = TextEditingController(text: userModel.fullName);
    emailController = TextEditingController(text: userModel.mailAddress);
    mobileNumberController = TextEditingController(text: userModel.mobileNumber);
  }

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
  Rx<Gender> selectedGender = Gender.Male.obs;
  late TextEditingController fullNameController;
  late TextEditingController mobileNumberController;
  late TextEditingController emailController;
  HomeController myController = Get.put(HomeController());
  BloodGroupController bloodGroupController = Get.put(BloodGroupController());
  UserModel userModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.black,
            size: 22,
          ),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            bottom: 0,
            right: 0,
            left: 0,
            child: SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: double.infinity,
                color: Colors.transparent,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      const Text(
                        'Register Yourself',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontFamily: 'Inter',
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
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
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              DynamicTextField(
                                controller: fullNameController,
                                keyboardType: TextInputType.text,
                                labelText: 'Full Name',
                                hintText: 'Enter Full Name',
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              DynamicTextField(
                                controller: mobileNumberController,
                                keyboardType: TextInputType.phone,
                                labelText: 'Mobile Number',
                                hintText: 'Enter Mobile Number',
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Obx(() {
                                return DropdownButtonFormField<BloodGroup>(
                                  value:
                                      bloodGroupController.selectedValue.value,
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
                                      borderSide:
                                          BorderSide(color: Colors.black),
                                    ),
                                    hintText: 'Select Blood Group',
                                    prefixIcon: Icon(Icons.bloodtype_rounded),
                                  ),
                                );
                              }),
                              const SizedBox(
                                height: 8,
                              ),
                              DynamicTextField(
                                controller: emailController,
                                keyboardType: TextInputType.emailAddress,
                                labelText: 'Email Address',
                                hintText: 'Enter Email Address',
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              const Text(
                                'Gender',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Inter',
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8),
                                child: Wrap(
                                  spacing: 8,
                                  children: genderList
                                      .map(
                                        (gender) => GestureDetector(
                                          onTap: () {
                                            selectedGender.value =
                                                gender['value']!;
                                          },
                                          child: genderWidget(
                                              gender['image']!,
                                              gender['name']!,
                                              gender['value']),
                                        ),
                                      )
                                      .toList(),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              DynamicButton(
                                onPressed: () async {
                                  RegisterUser().registerUser(
                                    UserModel(
                                      uid: FirebaseAuth
                                          .instance.currentUser?.uid,
                                      fullName: fullNameController.text,
                                      mobileNumber: mobileNumberController.text,
                                      bloodGroup: bloodGroupController
                                          .selectedValue.value,
                                      mailAddress: emailController.text,
                                      gender: selectedGender.value,
                                    ),
                                  );
                                },
                                buttonText: 'Register',
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const Positioned(
            bottom: 15,
            left: 0,
            right: 0,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'By creating an account, you agree to the Terms of use and Privacy Policy.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.black,
                  fontFamily: 'Inter',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget genderWidget(String imageUrl, String textValue, Gender genderType) {
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
                        selectedGender.value == genderType
                            ? Colors.red.withOpacity(0.3)
                            : Colors.transparent,
                        BlendMode.darken,
                      ),
                    ),
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: selectedGender.value == genderType
                          ? Colors.red
                          : Colors.white12,
                    ),
                  ),
                  child: Visibility(
                    visible: selectedGender.value == genderType,
                    child: const Icon(
                      Icons.check,
                      size: 40,
                      color: Colors.red,
                    ),
                  ),
                ),
                Text(
                  textValue,
                  style: const TextStyle(
                    color: Colors.black,
                    fontFamily: 'Inter',
                    fontSize: 14,
                  ),
                )
              ],
            );
          },
        ),
      ],
    );
  }
}
