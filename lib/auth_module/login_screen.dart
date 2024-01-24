import 'package:blood_donation_app/auth_module/facebook_sign_in.dart';
import 'package:blood_donation_app/auth_module/google_sign_in.dart';
import 'package:blood_donation_app/auth_module/verification_screen.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginScreen extends StatelessWidget {
  TextEditingController mobileNumberController = TextEditingController();
  String countryCode = "+1";
  FirebaseAuth auth = FirebaseAuth.instance;
  String verificationIdReceived = '';
  bool otpCodeVisible = false;

  @override
  Widget build(BuildContext context) {
    GoogleSignInProvider _googleSignInProvider = GoogleSignInProvider();
    FacebookSignInProvider _facebookSignInProvider = FacebookSignInProvider();



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
                        fontFamily: 'Inter',
                      ),
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
                            TextFormField(
                              controller: mobileNumberController,
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                labelText: 'Mobile Number',
                                border: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                  ),
                                ),
                                suffixIcon: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.clear)),
                                hintText: 'Enter Mobile Number',
                                prefixIcon: FutureBuilder<String>(
                                  future: _getCountryPhoneCode(),
                                  builder: (context,snapshot) {
                                    return CountryCodePicker(
                                      onChanged: (CountryCode code) {
                                        countryCode = code.dialCode ?? '';
                                      },
                                      showDropDownButton: false,
                                      showFlag: false,
                                      showCountryOnly: false,
                                      showOnlyCountryWhenClosed: false,
                                      alignLeft: false,
                                      initialSelection:snapshot.data
                                    );
                                  }
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
                                    if (countryCode.isNotEmpty) {
                                      String phoneNumber =
                                          '$countryCode${mobileNumberController.text}';
                                      verifyNumber(phoneNumber);
                                    } else {
                                      print('Plase select a country code');
                                    }
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
                        GestureDetector(
                          onTap: () async {
                            // Call the Google Sign-In method
                            final user =
                                await _googleSignInProvider.signInWithGoogle();

                            if (user != null) {
                              print('User signed in: ${user.displayName}');
                              //after login check uid if already registered then go to home screen otherwise register screen
                            } else {
                              print('Google Sign-In failed.');
                            }
                          },
                          child: CircleAvatar(
                            radius: 17,
                            backgroundColor: Colors.white,
                            child: Image.asset('Assets/Images/google.png'),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                          onTap: () async {
                            final user = await _facebookSignInProvider
                                .signInWithFacebook();
                            if (user != null) {
                              print('User Signed in: ${user.displayName}');
                            } else {
                              print('Facebook Sign-In failed.');
                            }
                          },
                          child: CircleAvatar(
                            radius: 17,
                            backgroundColor: Colors.white,
                            child: Image.asset('Assets/Images/facebook.png'),
                          ),
                        )
                      ],
                    ),
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

  void verifyNumber(String phoneNumber) async {
    auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
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
        Get.to(VerificaationScreen(
          verificationId: verificationIdReceived,
        ));
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  Future<String> _getCountryPhoneCode() async {
    var response = await http.get(Uri.parse('http://ip-api.com/json'));
    var jsonResponse = json.decode(response.body);
    final isoCode = jsonResponse['countryCode'];
    print("country code " + isoCode);
    final countryList = CountryCodePicker().countryList;
    return countryList
        .firstWhere((element) => element["code"] == isoCode,
        orElse: () => countryList.first)
    ["dial_code"]!;
  }

}
