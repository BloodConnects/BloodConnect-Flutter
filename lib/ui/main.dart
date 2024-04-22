import 'package:blood_donation_app/ui/home_screen.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'ThemeProvider.dart';

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

  runApp(ChangeNotifierProvider<ThemeProvider>(
    create: (_) => ThemeProvider(),
    child: const MyApp(),
  ),);
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print("Handling a background message: ${message.messageId}");
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
        builder: (context, themeProvider, _) {
          return GetMaterialApp(
              title: 'Flutter Demo',
              debugShowCheckedModeBanner: false,
              theme: themeProvider.themeData,
              home: HomeScreen()
          );
        }
    );
  }
}