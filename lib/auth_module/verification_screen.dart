import 'package:blood_donation_app/auth_module/register_screen.dart';
import 'package:blood_donation_app/auth_module/verification_card.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../api/UserRepositry.dart';
import '../api/module/BaseResponse.dart';
import '../screens/home_screen.dart';

class VerificationScreen extends StatelessWidget {
  final String verificationId;
  final FirebaseAuth auth = FirebaseAuth.instance;
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
            Get.back();
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
                    fontSize: 12, color: Colors.black, fontFamily: 'Inter'),
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
                    color: Colors.white),
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
                              onFilled: i == 5 ? () => verityOtp(verificationId,codeControllers.map((controller) => controller.text.trim()).join()) : null,
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
                            verityOtp(verificationId,codeControllers.map((controller) => controller.text.trim()).join());
                          },
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                              const RoundedRectangleBorder(
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
                    style: TextStyle(
                        fontSize: 12, color: Colors.black, fontFamily: 'Inter'),
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

  Future<void> verityOtp(String verificationId,String otp) async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: verificationId, smsCode: otp);
    await auth.signInWithCredential(credential);
    if(auth.currentUser?.uid!=null) {
      checkUserByUid(auth.currentUser!.uid);
    } else {
      Get.snackbar("","Invalid OTP or User");
    }
  }

  Future<void> checkUserByUid(String uid) async {
    var data = await checkUser(uid);
    switch(data.status) {
      case ApiStatus.SUCCESS: {
        if(data.success) {
          Get.to(const HomeScreen());
        } else {
          Get.to(RegisterationScreen());
        }
        break;
      }
      case ApiStatus.FAIL: {
        Get.to(data.message);
        break;
      }
      case ApiStatus.INTERNAL_SERVER_ERROR: {
        Get.to(data.message);
        break;
      }
      case ApiStatus.UNAUTH: {
        Get.to(data.message);
        break;
      }
    }
  }
}
