import 'dart:convert';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../enum_classes/api_status.dart';
import '../../ui/home_screen.dart';
import '../../share_preference/share_preference_service.dart';
import '../model/UserRepositry.dart';
import '../model/userModel.dart';

class RegisterUser {
  void registerUser(UserModel userModel) async {
    var response = await register(userModel);
    switch (response.status) {
      case ApiStatus.SUCCESS:
        {
          // var userModel = response.data;
          var pref = await SharedPreferences.getInstance();
          pref.setBool(SharePreferenceService.isSignIn, true);
          SharePreferenceService().setUserModel(response.data!);
          Get.offAll( HomeScreen());
          break;
        }
      case ApiStatus.FAIL:
        {
          Get.snackbar("", response.message);
          break;
        }
      case ApiStatus.INTERNAL_SERVER_ERROR:
        {
          Get.snackbar("", response.message);
          break;
        }
      case ApiStatus.UNAUTH:
        {
          Get.snackbar("", response.message);
          break;
        }
    }
  }
}
