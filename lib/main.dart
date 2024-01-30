import 'package:blood_donation_app/screens/home/blood_request_form_answer.dart';
import 'package:blood_donation_app/screens/home/blood_request_screen.dart';
import 'package:blood_donation_app/screens/home/health_screening.dart';
import 'package:blood_donation_app/screens/profile/edit_profille_screen.dart';
import 'package:blood_donation_app/splash_screen/splash_screen.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_clod_messaging/firebase_message.dart';

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

  String? token = await FirebaseMessaging.instance.getToken();
  print("FCM Token: $token");

  await FirebaseMessagingService().configure();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: HealthScreening()
    );
  }
}
