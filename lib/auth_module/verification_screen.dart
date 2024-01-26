import 'dart:convert';

import 'package:blood_donation_app/api_module/api_constants.dart';
import 'package:blood_donation_app/api_module/login_user.dart';
import 'package:blood_donation_app/auth_module/register_screen.dart';
import 'package:blood_donation_app/auth_module/verification_card.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import '../screens/home_screen.dart';

class VerificationScreen extends StatelessWidget {
  final String verificationId;
  final List<TextEditingController> codeControllers = List.generate(
    6,
        (index) => TextEditingController(),
  );

  VerificationScreen({Key? key, required this.verificationId}) : super(key: key);

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
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              CircleAvatar(
                backgroundColor: Colors.white,
                radius: 80,
                child: Image.asset('Assets/Images/logo.jpg'),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'you can donate for ones in need and request donation for blood if you need.',
                textAlign: TextAlign.center,
                maxLines: 2,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.black,
                  fontFamily: 'Inter',
                ),
              ),
              const SizedBox(
                height: 20,
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
                  padding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          for (var i = 0; i < 6; i++)
                            VerificationCard(
                              context: context,
                              textEditingController: codeControllers[i],
                              focusNode: i == 0 ? FocusNode() : null,
                              onFilled: i == 5 ? () => _verifyCode(context) : null,
                            ),
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
                            _verifyCode(context);
                          },
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(8)),
                              ),
                            ),
                            backgroundColor: MaterialStateProperty.all(Colors.red),
                          ),
                          child: const Text(
                            'Verify',
                            style: TextStyle(color: Colors.white, fontFamily: 'Inter'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "haven't received any code",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 12, color: Colors.black, fontFamily: 'Inter'),
                  ),
                  TextButton(
                    onPressed: () {
                      // Handle code for resending the code
                    },
                    child: const Text(
                      'Resend Code',
                      style: TextStyle(color: Colors.red, fontSize: 12, fontFamily: 'Inter'),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _verifyCode(BuildContext context) async {
    try {
      String smsCode = codeControllers.map((controller) => controller.text.trim()).join();

      if (smsCode.isEmpty || smsCode.length != 6) {
        Get.snackbar('', 'Please enter a valid 6-digit verification code!');
        return;
      }

      AuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: smsCode,
      );

      UserCredential userCredential =
      await FirebaseAuth.instance.signInWithCredential(credential);

      // Check if the user is already authenticated
      User? currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser != null) {
        // User is already logged in, navigate to HomeScreen
        Get.offAll(HomeScreen()); // Off all previous routes
      } else {
        // User is not logged in, navigate to RegisterationScreen
        Get.to(RegisterationScreen());
      }
    } catch (e) {
      print('Verification failed: $e');
      // You might want to show an error message to the user
    }
  }
}
