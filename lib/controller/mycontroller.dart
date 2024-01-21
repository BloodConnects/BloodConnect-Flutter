import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyController extends GetxController {
  var selectedIndex = 0.obs;
  final int numPages = 3;
  final Duration pageDuration = const Duration(seconds: 3);
  late Timer timer;
  int currentPage = 0;
  final PageController pageController = PageController();
  RxBool isSecondContainerVisible = false.obs;
  RxBool isCheckBoxClicked = false.obs;
  RxString selectedBloodGroup = 'A positive'.obs;

  void onSelectedBloodGroup(String value) {
    selectedBloodGroup.value = value;
  }

  void toggleCheckBoxClicked(){
    isCheckBoxClicked.toggle();
  }

  void toggleSecondContainerVisibility() {
    isSecondContainerVisible.toggle();
  }

  @override
  void onInit() {
    super.onInit();
    _startTimer();
  }

  void onChangendex(int index) {
    selectedIndex.value = index;
  }

  @override
  void onClose(){
    timer.cancel();
    pageController.dispose();
    super.onClose();
  }

  void _startTimer() {
    timer = Timer.periodic(
      pageDuration,
      (timer) {
        if (currentPage < numPages - 1) {
          currentPage++;
        } else {
          currentPage = 0;
        }
        pageController.animateToPage(
          currentPage,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeOut,
        );
      },
    );
  }
}
