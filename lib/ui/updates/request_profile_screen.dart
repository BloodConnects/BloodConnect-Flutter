 import 'package:blood_donation_app/ui/color_schemes.g.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../home/blood_request_type_dialog.dart';
import '../utils/dynamic_button.dart';
import '../utils/dynamic_info_widget.dart';

class RequestProfileScreen extends StatelessWidget {
  RequestProfileScreen({super.key});

  var isButtonPressed = false;

  @override
  Widget build(BuildContext context) {
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
          'Profile',
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          children: [
            const Center(
              child: CircleAvatar(
                radius: 70,
                backgroundImage: NetworkImage(
                  'https://firebasestorage.googleapis.com/v0/b/confab-3868.appspot.com/o/Profile%20Pictures%2FAsset%2016.png?alt=media&token=4ed4b1cf-c496-4c24-8844-ec84a7c587cd',
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Center(
              child: Text(
                'Jaypalsinh Barad',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  fontFamily: 'Inter',
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 45,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                          isButtonPressed == true
                              ? lightColorScheme.primary
                              : Colors.white,
                        ),
                        side: MaterialStatePropertyAll(
                          BorderSide(
                            color: isButtonPressed == true
                                ? Colors.white
                                : Colors.black,
                            width: 1,
                          ),
                        ),
                      ),
                      child: Text(
                        'Ignore',
                        style: TextStyle(
                          color: isButtonPressed == true
                              ? Colors.white
                              : Colors.black,
                          fontFamily: 'Inter',
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: SizedBox(
                    height: 45,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                            isButtonPressed == true
                                ? lightColorScheme.primary
                                : Colors.white),
                        side: MaterialStatePropertyAll(
                          BorderSide(
                            color: isButtonPressed == true
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                      ),
                      child: Text(
                        'Accept',
                        style: TextStyle(
                          color: isButtonPressed == true
                              ? Colors.white
                              : Colors.black,
                          fontFamily: 'Inter',
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.grey[300],
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(1.0, 2.0),
                    blurRadius: 2.5,
                    spreadRadius: 2,
                  )
                ],
              ),
              child: const Column(
                  children: [
                    DynamicInfoWidget(
                      title: 'Blood Group',
                      subtitle: 'A Positive',
                    ),
                    DynamicInfoWidget(
                      title: 'Blood Units',
                      subtitle: '1 litre',
                    ),
                    DynamicInfoWidget(
                      title: 'Urgency',
                      subtitle: '50%',
                    ),
                    DynamicInfoWidget(
                      title: 'Reason',
                      subtitle: 'Accident',
                    ),
                  ],
                ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.grey[300],
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(1.0, 2.0),
                    blurRadius: 2.5,
                    spreadRadius: 2,
                  )
                ],
              ),
              child: const Column(
                children: [
                  DynamicInfoWidget(
                    title: 'Age',
                    subtitle: '20 years',
                  ),
                  DynamicInfoWidget(
                    title: 'Gender',
                    subtitle: 'Male',
                  ),
                  DynamicInfoWidget(
                    title: 'Address',
                    subtitle: 'Dholka, Ahmedabad, Gujarat',
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
