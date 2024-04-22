import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RadioButtonController extends GetxController{
  RxInt selectedVale = 0.obs;

  void onSelectValue(int index){
    selectedVale.value = index;
  }

  Color borderColor(int value){
    return selectedVale.value == value ? Colors.red[500]! : Colors.black45;
  }

  Color? textColor(int value){
    if(selectedVale.value == value){
      return Colors.red[900];
    }else{
      return Colors.black;
    }
  }

  void resetSelectedButton(){
    selectedVale.value = 0;
  }
}