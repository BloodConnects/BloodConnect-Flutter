import 'package:blood_donation_app/auth_module/opening_screen.dart';
import 'package:blood_donation_app/auth_module/verification_screen.dart';
import 'package:blood_donation_app/firebase_options.dart';
import 'package:blood_donation_app/screens/explore_screen.dart';
import 'package:blood_donation_app/screens/home_screen.dart';
import 'package:blood_donation_app/screens/maps.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: 'AIzaSyDi_qmovXVUH85RFEVZcx9B69EIJvK8cy0',
      appId: '1:1048254137318:web:e3ef4d9907cdd6209b0c27',
      messagingSenderId: '1048254137318',
      projectId: 'raktacare',
    ),
  );

  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform
  // );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: OpeningScreen()
    );
  }
}
