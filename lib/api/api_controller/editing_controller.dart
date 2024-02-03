import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import '../../enum_classes/blood_group.dart';
import '../../enum_classes/gender.dart';
import '../../screens/profile/edit_profille_screen.dart';
import '../model/userModel.dart';

class EditingController extends GetxController {
  var nameController = TextEditingController();
  var bloodGroupController = TextEditingController();
  var genderController = TextEditingController();
  var mobileController = TextEditingController();
  var emailAddressController = TextEditingController();
  var profilePicture = RxString('');
  var birthDateController  = TextEditingController();
  var heightController = TextEditingController();
  var weightController = TextEditingController();

  Rx<BloodGroup> selectedBlood = BloodGroup.abPositive.obs;

  void onSelected(BloodGroup bloodGroup) {
    selectedBlood.value = bloodGroup;
  }

  Rx<Gender> selectedGender = Gender.Male.obs;

  void onSelectedGender(Gender gender) {
    selectedGender.value = gender;
  }

  late UserModel userModel;

  @override
  void onInit() async {
    userModel = await getUserModel();
    nameController.text = userModel.fullName ?? '';
    selectedBlood.value = userModel.bloodGroup ?? BloodGroup.unknown;
    selectedGender.value = userModel.gender ?? Gender.Male;
    mobileController.text = userModel.mobileNumber ?? '';
    emailAddressController.text = userModel.mailAddress ?? '';
    if((userModel.profilePictureUrl??'').isNotEmpty) {
      profilePicture.value = userModel.profilePictureUrl.toString();
    } else {
      profilePicture.value = 'https://images.unsplash.com/photo-1662695090012-24ccea960995?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D';
    }
    birthDateController.text = (userModel.birthDate ?? 0).toString();
    heightController.text = (userModel.height ?? 0.0).toString();
    weightController.text = (userModel.weight ?? 0.0).toString();
    super.onInit();
  }
}
