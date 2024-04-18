import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
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

  void navigationTapped(int tab){
    pageController.jumpToPage(tab);
    currentTab.value = tab;
  }

  void onTabChanged(int tab){
    currentTab.value = tab;
    pageController.jumpToPage(tab);
  }
}
