import 'package:blood_donation_app/auth_module/login_screen.dart';
import 'package:blood_donation_app/auth_module/opening_screen.dart';
import 'package:blood_donation_app/auth_module/register_screen.dart';
import 'package:blood_donation_app/auth_module/verification_screen.dart';
import 'package:blood_donation_app/profile_screen.dart';
import 'package:blood_donation_app/screens/explore_screen.dart';
import 'package:blood_donation_app/screens/home.dart';
import 'package:blood_donation_app/screens/home_screen.dart';
import 'package:blood_donation_app/screens/notification_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: 'AIzaSyDQ0cG0LrHW7h7xh87-tq91pA3ybmaPq4E',
      appId: '1:653102459356:web:e6886b58676005dc63c719',
      messagingSenderId: '653102459356',
      projectId: 'blood-donation-2abe5',
    ),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        home: OpeningScreen());
  }
}
