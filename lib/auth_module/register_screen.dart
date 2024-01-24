import 'package:blood_donation_app/auth_module/add_location_screen.dart';
import 'package:blood_donation_app/controller/controller.dart';
import 'package:blood_donation_app/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterationScreen extends StatelessWidget {
  List<Map<String, String>> genderList = [
    {'name': 'Male', 'image': 'Assets/Images/male.png'},
    {'name': 'Female', 'image': 'Assets/Images/female.png'},
    {'name': 'Other', 'image': 'Assets/Images/other.png'},
  ];
  RxString selectedGender = ''.obs;

  @override
  Widget build(BuildContext context) {
    TextEditingController fullNameController = TextEditingController();
    TextEditingController mobileNumberController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    Controller myController = Get.put(Controller());

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
                              TextField(
                                controller: fullNameController,
                                keyboardType: TextInputType.text,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                  ),
                                  labelText: 'Full Name',
                                  hintText: 'Enter your fullname',
                                  prefixIcon: Icon(Icons.person),
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              TextField(
                                controller: mobileNumberController,
                                keyboardType: TextInputType.phone,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                  ),
                                  labelText: 'Mobile Number',
                                  hintText: 'Enter your Mobile Number',
                                  prefixIcon: Icon(Icons.phone),
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Obx(() {
                                return DropdownButtonFormField<String>(
                                  value: myController.selectedValue.value,
                                  items: const [
                                    'A positive',
                                    'A negative',
                                    'B positive',
                                    'B negative',
                                    'O positive ',
                                    'O negative',
                                    'AB positive',
                                    'AB negative'
                                  ].map((String value) {
                                    return DropdownMenuItem(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                  onChanged: (newValue) {
                                    myController.onSelected(newValue!);
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
                              TextField(
                                controller: emailController,
                                keyboardType: TextInputType.emailAddress,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                  ),
                                  labelText: 'Email Address',
                                  hintText: 'Enter your Email Number',
                                  prefixIcon: Icon(Icons.email),
                                ),
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
                              Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: SizedBox(
                                    width: double.infinity,
                                    child: Wrap(
                                      spacing: 8,
                                      children: genderList
                                          .map(
                                            (gender) => GestureDetector(
                                              onTap: () {
                                                selectedGender.value =
                                                    gender['name']!;
                                              },
                                              child: genderWidget(
                                                gender['image']!,
                                                gender['name']!,
                                              ),
                                            ),
                                          )
                                          .toList(),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                height: 40,
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return const AddLocationScreen();
                                      },
                                    );
                                  },
                                  style: const ButtonStyle(
                                    shape: MaterialStatePropertyAll(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(8),
                                        ),
                                      ),
                                    ),
                                    backgroundColor:
                                        MaterialStatePropertyAll(Colors.red),
                                  ),
                                  child: const Text(
                                    'Register',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Inter',
                                    ),
                                  ),
                                ),
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

  Widget genderWidget(String imageUrl, String genderType) {
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
                  genderType,
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
