import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import '../../../ui/auth/register_screen.dart';
import '../../enum_classes/api_status.dart';
import '../model/UserRepositry.dart';
import '../model/BaseResponse.dart';
import '../model/userModel.dart';
import 'login_user.dart';

class CheckUser {
  Future<void> checkUserByFirebaseUser(User user) async {
    var data = await checkUser(user.uid);
    switch (data.status) {
      case ApiStatus.SUCCESS:
        {
          if (data.success) {
            LoginUser().loginUser(UserModel(uid: user.uid));
          } else {
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
