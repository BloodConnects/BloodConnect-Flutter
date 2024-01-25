import 'package:blood_donation_app/api/module/userModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Controller extends GetxController {
  RxString selectedValue = 'A positive'.obs;
  var currentTab = 0.obs;
  late PageController pageController;

  @override
  void onInit() {
    super.onInit();
    pageController = PageController();
  }

  @override
  void dispose(){
    super.dispose();
    pageController.dispose();
  }

  @override
  void onClose(){
    pageController.dispose();
    super.onClose();
  }

  void onSelected(String value) {
    selectedValue.value = value;
  }

  void navigationTapped(int tab){
    pageController.jumpToPage(tab);
  }

  void onTabChanged(int tab){
    currentTab.value = tab;
  }
}

class BloodGroupController extends GetxController {
  Rx<BloodGroup> selectedValue = BloodGroup.abPositive.obs;

  void onSelected(BloodGroup bloodGroup) {
    selectedValue.value = bloodGroup;
  }

}
