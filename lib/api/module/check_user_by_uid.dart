import 'package:blood_donation_app/api/module/userModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import '../../auth_module/register_screen.dart';
import '../../screens/home_screen.dart';
import '../UserRepositry.dart';
import 'BaseResponse.dart';

class CheckUser {
  Future<void> checkUserByFirebaseUser(User user) async {
    var data = await checkUser(user.uid);
    switch (data.status) {
      case ApiStatus.SUCCESS:
        {
          if (data.success) {
            Get.to(const HomeScreen());
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
