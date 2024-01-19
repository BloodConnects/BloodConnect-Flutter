import 'package:get/get.dart';

class SliderController extends GetxController{
  RxDouble sliderValue = 15.0.obs;

  void updateSlider(double value){
    sliderValue.value = value;
  }
}