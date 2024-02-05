import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../api/model/userModel.dart';

class SharePreferenceService extends GetxService {
  static const String isSignIn = 'isSignIn';
  static const String userModel = 'userModel';

  Future<UserModel> getUserModel() async {
    var pref = await SharedPreferences.getInstance();
    var temp = pref.getString(SharePreferenceService.userModel);
    var userModel = UserModel.fromJson(jsonDecode(temp!));
    return userModel;
  }

  void setUserModel(UserModel userModel)async{
    var pref = await SharedPreferences.getInstance();
    var temp = userModel.toJson();
    pref.setString(SharePreferenceService.userModel, jsonEncode(temp));
  }

  void setDeviceToken(String token)async{
    var user = await getUserModel();
    user.deviceToken = token;
    setUserModel(user);
  }

  Future<String?> getUserToken()async{
    UserModel userModel = await getUserModel();
    return userModel.userToken;
  }
}
