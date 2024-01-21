import 'package:get/get.dart';

class UrgencySliderController extends GetxController{
  RxDouble urgentSliderValue = 0.0.obs;

  void updateUrgentSlider(double value){
    urgentSliderValue.value = value;
  }
}