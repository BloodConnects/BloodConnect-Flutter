import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/api/model/userModel.dart';
import '../../domain/share_preference/share_preference_service.dart';
import '../home_screen.dart';
import 'opening_screen.dart';

class SplashScreenViewModel extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;
  final UserModel userModel = UserModel();

  @override
  void onInit() {
    animationInitialization();
    navigation();
    super.onInit();
  }

  animationInitialization() {
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 4));
    animation =
        CurvedAnimation(parent: animationController, curve: Curves.easeOut)
            .obs
            .value;
    animation.addListener(() => update());
    animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        // Animation has completed, navigate to the next page
        navigation();
      }
    });
    animationController.forward();
  }

  void navigation() async {
    var pref = await SharedPreferences.getInstance();


    if (pref.getBool(SharePreferenceService.isSignIn) == true) {
      Get.offAll(HomeScreen());
    } else {
      Get.off(OpeningScreen());
    }
  }
}