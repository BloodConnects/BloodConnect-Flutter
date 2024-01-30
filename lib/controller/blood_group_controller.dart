import 'package:get/get.dart';

import '../enum_classes/blood_group.dart';

class BloodGroupController extends GetxController {
  Rx<BloodGroup> selectedValue = BloodGroup.abPositive.obs;

  void onSelected(BloodGroup bloodGroup) {
    selectedValue.value = bloodGroup;
  }
}
