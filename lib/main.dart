import 'package:blood_donation_app/splash_screen/splash_screen.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'color_schemes.g.dart';

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

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  String? token = await FirebaseMessaging.instance.getToken();
  print("FCM Token: $token");

  runApp(const MyApp());
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print("Handling a background message: ${message.messageId}");
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
        darkTheme: ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
        debugShowCheckedModeBanner: false,
        home: const SplashScreen()
    );
  }
}
