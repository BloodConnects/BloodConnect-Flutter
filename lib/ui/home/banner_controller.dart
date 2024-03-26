import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/api/model/UserRepositry.dart';
import '../../domain/share_preference/share_preference_service.dart';

class BannerController extends GetxController {
  var selectedIndex = 0.obs;
  final int numPages = 3;
  final Duration pageDuration = const Duration(seconds: 3);
  late Timer timer;
  int currentPage = 0;
  final PageController pageController = PageController();
  RxBool isSecondContainerVisible = false.obs;
  RxBool isCheckBoxClicked = false.obs;
  RxString selectedBloodGroup = 'A positive'.obs;

  late ValueChanged<int> showDialogs;

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
  void onInit() async{
    super.onInit();
    _startTimer();

    var useLocation = await SharePreferenceService().getLocationModel();
    if(useLocation == null){
      var response = await getLocation();
      if(response.success && response.data != null){
        SharePreferenceService().setLocationModel(response.data!);
      }else{
        showDialogs(0);
      }
    }
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
