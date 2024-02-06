import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../api/model/LocationModel.dart';
import '../api/model/userModel.dart';

class SharePreferenceService extends GetxService {
  static const String isSignIn = 'isSignIn';
  static const String userModel = 'userModel';
  static const String locationModel = 'locationModel';

  Future<UserModel?> getUserModel() async {
    var pref = await SharedPreferences.getInstance();
    var temp = pref.getString(SharePreferenceService.userModel);
    if(temp == null) return null;
    var userModel = UserModel.fromJson(jsonDecode(temp));
    return userModel;
  }

  void setUserModel(UserModel userModel)async{
    var pref = await SharedPreferences.getInstance();
    var temp = userModel.toJson();
    pref.setString(SharePreferenceService.userModel, jsonEncode(temp));
  }

  void setDeviceToken(String token)async{
    var user = await getUserModel();
    if(user == null) return ;
    user.deviceToken = token;
    setUserModel(user);
  }

  Future<String?> getUserToken()async{
    var userModel = await getUserModel();
    if(userModel == null) return '';
    return userModel.userToken;
  }

  Future<LocationModel?> getLocationModel()async{
    var pref = await SharedPreferences.getInstance();
    var temp = pref.getString(SharePreferenceService.locationModel);
    if(temp == null) return null;
    return LocationModel.fromJson(jsonDecode(temp));
  }

  void setLocationModel(LocationModel locationModel)async{
    var pref = await SharedPreferences.getInstance();
    var temp = locationModel.toJson();
    pref.setString(SharePreferenceService.locationModel, jsonEncode(temp));
  }
}
