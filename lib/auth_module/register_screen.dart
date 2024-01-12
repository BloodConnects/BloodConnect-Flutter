import 'package:blood_donation_app/auth_module/controller.dart';
import 'package:blood_donation_app/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

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
                                  spreadRadius: 1.0)
                            ],
                            color: Colors.white),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextField(
                                controller: fullNameController,
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.black)),
                                    hintText: 'Enter your fullname',
                                    prefixIcon: Icon(Icons.person)),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              TextField(
                                controller: mobileNumberController,
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.black)),
                                    hintText: 'Enter your Mobile Number',
                                    prefixIcon: Icon(Icons.phone)),
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
                                      prefixIcon:
                                          Icon(Icons.bloodtype_rounded)),
                                );
                              }),
                              const SizedBox(
                                height: 8,
                              ),
                              TextField(
                                controller: emailController,
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.black)),
                                    hintText: 'Enter your Email Number',
                                    prefixIcon: Icon(Icons.email)),
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
                              Row(
                                children: [
                                  // GestureDetector(
                                  //   child: Image.asset(
                                  //     'Assets/Images/female.png',
                                  //     height: 40,
                                  //     width: 40,
                                  //   ),
                                  //   onTap: () {
                                  //     Image.asset('Assets/Images/female.png',
                                  //     height: 40,
                                  //     width: 40,
                                  //     color: Colors.blue.withOpacity(0.5),);
                                  //     // Stack(
                                  //     //   children: [
                                  //     //     Positioned(
                                  //     //       top: 100,
                                  //     //       right: 50,
                                  //     //       bottom: 20,
                                  //     //       child: Image.asset(
                                  //     //           'Assets/Images/tick_mark.png'),
                                  //     //     ),
                                  //     //   ],
                                  //     // );
                                  //   },
                                  // ),
                                  // Chip(
                                  //   label: Text('Female'),
                                  //   avatar: CircleAvatar(
                                  //     backgroundImage: AssetImage(
                                  //         'Assets/Images/female.png'),
                                  //   ),
                                  //   side: BorderSide.none,
                                  // ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Image.asset(
                                    'Assets/Images/male.png',
                                    height: 39,
                                    width: 39,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  // CircleAvatar(
                                  //   radius: 30,
                                  //   child: Icon(
                                  //     Icons.fem
                                  //   ),
                                  // )
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                height: 40,
                                width: double.infinity,
                                child: ElevatedButton(
                                    onPressed: () {
                                      Get.to(const HomeScreen());
                                    },
                                    style: const ButtonStyle(
                                        shape: MaterialStatePropertyAll(
                                            RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(8)))),
                                        backgroundColor:
                                            MaterialStatePropertyAll(
                                                Colors.red)),
                                    child: const Text(
                                      'Register',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Inter',
                                      ),
                                    )),
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
                'By creating an account, you agree to the Terms of use ard Privacy Policy.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12, color: Colors.black, fontFamily: 'Inter'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
