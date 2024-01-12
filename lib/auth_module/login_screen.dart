import 'package:blood_donation_app/auth_module/auth_service.dart';
import 'package:blood_donation_app/auth_module/verification_screen.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  TextEditingController mobileNumberController = TextEditingController();
  late String countryCode;
  FirebaseAuth auth = FirebaseAuth.instance;
  String verificationIdReceived = '';
  bool otpCodeVisible = false;

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
          Container(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            color: Colors.transparent,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: SingleChildScrollView(
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
                          fontFamily: 'Inter',),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
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
                        padding: const EdgeInsets.only(
                            left: 10, right: 10, top: 10, bottom: 10),
                        child: Column(
                          children: [
                            Container(
                              height: 55,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: const Border.symmetric(
                                  horizontal: BorderSide(
                                    color: Colors.grey,
                                  ),
                                  vertical: BorderSide(
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  CountryCodePicker(
                                    onChanged: (CountryCode code) {
                                      countryCode = code.dialCode ?? '';
                                    },
                                    initialSelection: 'IN',
                                    favorite: ['+91', 'IN'],
                                    showCountryOnly: false,
                                    flagWidth: 12,
                                    showOnlyCountryWhenClosed: false,
                                    alignLeft: false,
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.55,
                                    child: TextField(
                                      controller: mobileNumberController,
                                      keyboardType: TextInputType.number,
                                      decoration: const InputDecoration(
                                        // border: OutlineInputBorder(
                                        //   borderSide: BorderSide(
                                        //     color: Colors.black,
                                        //   ),
                                        // ),
                                        border: InputBorder.none,
                                        hintText: 'Enter Mobile Number',
                                        // prefixIcon: Icon(
                                        //   Icons.phone,
                                        // ),
                                      ),
                                    ),
                                  ),
                                ],
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
                                    // if(countryCode.isNotEmpty){
                                    //   String phoneNumber = '+$countryCode${mobileNumberController.text}';
                                    //   await _authService.verifyPhoneNumber(phoneNumber);
                                    // }else{
                                    //   print('Please select a country code');
                                    // }
                                    Get.to(VerificaationScreen());
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
                                    'Continue',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Inter',
                                    ),
                                  )),
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 17,
                          backgroundColor: Colors.white,
                          child: Image.asset('Assets/Images/google.png'),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        CircleAvatar(
                          radius: 17,
                          backgroundColor: Colors.white,
                          child: Image.asset('Assets/Images/facebook.png'),
                        )
                      ],
                    ),
                    // const Spacer(),
                    // const SizedBox(
                    //   height: 200,
                    // ),

                    // const SizedBox(
                    //   height: 20,
                    // )
                  ],
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
                maxLines: 2,
                style: TextStyle(
                  fontFamily: 'Inter',
                  color: Colors.black,
                  fontSize: 12,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void verifyNumber() {
    mobileNumberController.text;
    auth.verifyPhoneNumber(
        verificationCompleted: (PhoneAuthCredential credential) async {
          await auth.signInWithCredential(credential).then(
            (value) {
              print('You are successfully logged in');
            },
          );
        },
        verificationFailed: (FirebaseAuthException exception) {
          print(exception.message);
        },
        codeSent: (String verificationId, int? resendToken) {
          verificationIdReceived = verificationId;
          otpCodeVisible = true;
        },
        codeAutoRetrievalTimeout: (String verificationId) {});
  }
}
