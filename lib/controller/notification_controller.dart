import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class NotificationScreenController extends GetxController {
  final RxBool _requestedIsButtonPressed = true.obs;
  final RxBool _articlesButtonPressed = false.obs;
  final RxBool _eventButtonPressed = false.obs;

  RxBool get requestedIsButtonPressed => _requestedIsButtonPressed;
  RxBool get articlesButtonPressed => _articlesButtonPressed;
  RxBool get eventButtonPressed => _eventButtonPressed;

  void toggleRequestedButton() {
    _requestedIsButtonPressed.toggle();
    _articlesButtonPressed.value = false;
    _eventButtonPressed.value = false;
  }

  void toggleArticlesButton() {
    _requestedIsButtonPressed.value = false;
    _articlesButtonPressed.toggle();
    _eventButtonPressed.value = false;
  }

  void toggleEventButton() {
    _requestedIsButtonPressed.value = false;
    _articlesButtonPressed.value = false;
    _eventButtonPressed.toggle();
  }

  var currentTab = 0.obs;
  final PageController pageController = PageController();

  @override
  void onInit() {
    super.onInit();
    // pageController = PageController();
    pageController.addListener(() {
      currentTab.value = pageController.page?.round() ?? 0;
    });
  }

  @override
  void dispose(){
    pageController.dispose();
    super.dispose();
  }

  @override
  void onClose(){
    pageController.dispose();
    super.onClose();
  }

  void navigationTapped(int tab){
    pageController.jumpToPage(tab);
  }

  void onTabChanged(int tab){
    // currentTab.value = tab;
    pageController.animateToPage(tab,
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
  }
}