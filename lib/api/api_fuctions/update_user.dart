import 'package:blood_donation_app/share_preference/share_preference_service.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../enum_classes/api_status.dart';
import '../model/UserRepositry.dart';
import '../model/userModel.dart';

class UpdateUser{
  void updateUserData(UserModel userModel) async {
    var response = await updateData(userModel);

    switch (response.status) {
      case ApiStatus.SUCCESS:
        var pref = await SharedPreferences.getInstance();
        SharePreferenceService().setUserModel(response.data!);
        Get.back();
        break;
      default:
        Get.snackbar('', response.message);
    }
  }
}