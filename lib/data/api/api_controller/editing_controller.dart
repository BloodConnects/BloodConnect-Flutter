import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../domain/share_preference/share_preference_service.dart';
import '../../enum_classes/blood_group.dart';
import '../../enum_classes/gender.dart';
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

  //profile picture
  // RxString profile_picture = ''.obs;

  void loadProfilePicture()async{
    var pref = await SharedPreferences.getInstance();
    pref.getString(SharePreferenceService.profilePicture) ?? '';
  }

  void setProfilePicture(String imageUrl)async{
    var pref = await SharedPreferences.getInstance();
    pref.setString(SharePreferenceService.profilePicture, imageUrl);
    profilePicture.value = imageUrl;
  }

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
    userModel = (await SharePreferenceService().getUserModel())!;
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
    var date = DateTime.fromMillisecondsSinceEpoch(userModel.birthDate ?? DateTime.now().millisecondsSinceEpoch);
    String formattedDate = DateFormat('yyyy-MM-dd').format(date);
    birthDateController.text = formattedDate;
    heightController.text = (userModel.height ?? 0.0).toString();
    weightController.text = (userModel.weight ?? 0.0).toString();
    super.onInit();
  }
}
