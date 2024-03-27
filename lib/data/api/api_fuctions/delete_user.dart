import 'dart:convert';

import 'package:blood_donation_app/ui/auth/opening_screen.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../domain/share_preference/share_preference_service.dart';
import '../../enum_classes/api_status.dart';
import '../model/UserRepositry.dart';
import '../model/userModel.dart';

class DeleteUser{
  void deletAccount() async {
    var response = await deleteUser();

    switch (response.status) {
      case ApiStatus.SUCCESS:
        var pref = await SharedPreferences.getInstance();
        pref.remove(SharePreferenceService.userModel);
        pref.remove(SharePreferenceService.isSignIn);
        Get.offAll(OpeningScreen());
        break;
      default:
        Get.snackbar('', response.message);
    }
  }
}