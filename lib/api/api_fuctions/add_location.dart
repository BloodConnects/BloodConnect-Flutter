import 'package:blood_donation_app/api/model/LocationModel.dart';
import 'package:blood_donation_app/api/model/UserRepositry.dart';
import 'package:blood_donation_app/api/model/userModel.dart';
import 'package:blood_donation_app/ui/home_screen.dart';
import 'package:blood_donation_app/share_preference/share_preference_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../enum_classes/api_status.dart';

class AddLocation{
  void addLocationFunction(LocationModel locationModel, {required Function onClose})async{
    var response = await addLocation(locationModel);

    switch (response.status) {
      case ApiStatus.SUCCESS:
        {
          SharePreferenceService().setLocationModel(response.data!);
          onClose();
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