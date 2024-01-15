import 'package:blood_donation_app/auth_module/register_screen.dart';
import 'package:blood_donation_app/auth_module/verification_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerificaationScreen extends StatelessWidget {
  final String verificationId;
  const VerificaationScreen({
    super.key, required this.verificationId,
  });

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
                          VerificationCard(context: context),
                          VerificationCard(context: context),
                          VerificationCard(context: context),
                          VerificationCard(context: context),
                          VerificationCard(context: context),
                          VerificationCard(context: context),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 40,
                        width: double.infinity,
                        child: ElevatedButton(
                            onPressed: () async {
                              // Get.to(const RegisterScreen());
                              // String code = codeController.text;
                              // AuthCredential credential = PhoneAuthProvider.credential(verificationId: verificationId, smsCode: code);
                              // await FirebaseAuth.instance.signInWithCredential(credential);
                              Get.to(RegisterationScreen());
                            },
                            style: const ButtonStyle(
                                shape: MaterialStatePropertyAll(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8)))),
                                backgroundColor:
                                    MaterialStatePropertyAll(Colors.red)),
                            child: const Text(
                              'Verify',
                              style: TextStyle(
                                  color: Colors.white, fontFamily: 'Inter'),
                            )),
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
                      onPressed: () {},
                      child: const Text(
                        'Resend Code',
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 12,
                            fontFamily: 'Inter'),
                      ))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
