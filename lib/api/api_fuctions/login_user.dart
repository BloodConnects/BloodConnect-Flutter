import 'dart:convert';

import 'package:blood_donation_app/api/model/UserRepositry.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../enum_classes/api_status.dart';
import '../../screens/home_screen.dart';
import '../../share_preference/share_preference_service.dart';
import '../model/userModel.dart';

class LoginUser{
  void loginUser(UserModel userModel) async {
    var response = await login(userModel);
    switch (response.status) {
      case ApiStatus.SUCCESS:
        {
          var pref = await SharedPreferences.getInstance();
          pref.setBool(SharePreferenceService.isSignIn, true);
          SharePreferenceService().setUserModel(response.data!!);
          Get.offAll( HomeScreen());
          break;
        }
      case ApiStatus.FAIL:
        {
          Get.snackbar("title", response.message);
          break;
        }
      case ApiStatus.INTERNAL_SERVER_ERROR:
        {
          Get.snackbar("title", response.message);
          break;
        }
      case ApiStatus.UNAUTH:
        {
          Get.snackbar("title", response.message);
          break;
        }
    }
  }
}