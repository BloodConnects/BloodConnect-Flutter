import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RadioButtonController extends GetxController{
  RxInt selectedVale = 0.obs;

  void onSelectValue(int index){
    selectedVale.value = index;
  }

  Color? backgroundColorOfContainer(int value){
    if(selectedVale.value == value){
      return Colors.red[200];
    }else{
      return Colors.transparent;
    }
  }

  Color? textColor(int value){
    if(selectedVale.value == value){
      return Colors.red[900];
    }else{
      return Colors.black;
    }
  }
}