import 'package:blood_donation_app/api/model/userModel.dart';
import 'package:blood_donation_app/share_preference/share_preference_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../auth_screens/register_screen.dart';
import '../../enum_classes/api_status.dart';
import '../../screens/home_screen.dart';
import '../model/UserRepositry.dart';
import '../model/BaseResponse.dart';

class CheckUser {
  Future<void> checkUserByFirebaseUser(User user) async {
    var data = await checkUser(user.uid);
    switch (data.status) {
      case ApiStatus.SUCCESS:
        {
          if (data.success) {
            var pref = await SharedPreferences.getInstance();
            pref.setBool(SharePreferenceService.isSignIn, true);
            Get.offAll(const HomeScreen());
          } else {
            //fullname = user.display
            Get.to(
              RegisterationScreen(
                UserModel(
                  mobileNumber: user.phoneNumber,
                  mailAddress: user.email,
                  fullName: user.displayName,
                  profilePictureUrl: user.photoURL,
                  uid: user.uid,
                ),
              ),
            );
          }
          break;
        }
      case ApiStatus.FAIL:
        {
          Get.to(data.message);
          break;
        }
      case ApiStatus.INTERNAL_SERVER_ERROR:
        {
          Get.to(data.message);
          break;
        }
      case ApiStatus.UNAUTH:
        {
          Get.to(data.message);
          break;
        }
    }
  }
}
