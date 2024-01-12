import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePageViewController extends GetxController{
  late PageController pageController;
  var currentProfile = 0.obs;

  RxInt selectedCategoryIndex = 0.obs;

  @override
  void onInit(){
    super.onInit();
    pageController = PageController();
  }

  void onClick(int index){
    selectedCategoryIndex.value = index;
  }

  @override 
  void onClose(){
    pageController.dispose();
    super.onClose();
  }
}