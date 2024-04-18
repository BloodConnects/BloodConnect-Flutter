import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BloodRequestController extends GetxController {
  RxString selectedBloodGroup = 'B Positive'.obs;
  RxString selectedGender = 'Male'.obs;
  RxString selectedBloodUnits = '500 ml'.obs;
  RxString selectedReason = 'Accident'.obs;
  RxString fullAddress = ''.obs;

  void onSelectedReason(String reason) {
    selectedReason.value = reason;
  }

  void onSelectedBloodUnits(String bloodUnits) {
    selectedBloodUnits.value = bloodUnits;
  }

  void onSelectedGender(String gender) {
    selectedGender.value = gender;
  }

  void onSelectedBloodGroup(String bloodGroup) {
    selectedBloodGroup.value = bloodGroup;
  }
}
