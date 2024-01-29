import 'package:blood_donation_app/auth_module/add_location_screen.dart';
import 'package:blood_donation_app/auth_module/opening_screen.dart';
import 'package:blood_donation_app/auth_module/register_screen.dart';
import 'package:blood_donation_app/auth_module/verification_screen.dart';
import 'package:blood_donation_app/auth_module/firebase_options.dart';
import 'package:blood_donation_app/custom_cards/custom_donor_container.dart';
import 'package:blood_donation_app/screens/blood_request_form_answer.dart';
import 'package:blood_donation_app/custom_cards/custom_dialog_box.dart';
import 'package:blood_donation_app/screens/blood_request_screen.dart';
import 'package:blood_donation_app/screens/donor_list_screen.dart';
import 'package:blood_donation_app/screens/edit_profille_screen.dart';
import 'package:blood_donation_app/screens/explore_screen.dart';
import 'package:blood_donation_app/screens/find_donor_screen.dart';
import 'package:blood_donation_app/screens/home_screen.dart';
import 'package:blood_donation_app/screens/maps.dart';
import 'package:blood_donation_app/screens/profile_screen.dart';
import 'package:blood_donation_app/screens/user_profile_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

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

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: HomeScreen()
    );
  }
}
