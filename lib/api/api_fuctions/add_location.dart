// import 'package:blood_donation_app/api/model/UserRepositry.dart';
// import 'package:blood_donation_app/api/model/userModel.dart';
// import 'package:blood_donation_app/screens/home_screen.dart';
// import 'package:blood_donation_app/share_preference/share_preference_service.dart';
// import 'package:get/get.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// import '../../enum_classes/api_status.dart';
//
// class AddLocation{
//   void addLocation(UserModel userModel)async{
//     var response = await location(userModel);
//
//     switch (response.status) {
//       case ApiStatus.SUCCESS:
//         {
//           var pref = await SharedPreferences.getInstance();
//           pref.getBool(SharePreferenceService.isSignIn);
//           SharePreferenceService().getUserModel();
//           if(userModel.locationKey!.isNotEmpty){
//             Get.offAll(const HomeScreen());
//           }else{
//             Get.offAll(AddLocation());
//           }
//           break;
//         }
//       case ApiStatus.FAIL:
//         {
//           Get.snackbar("title", response.message);
//           break;
//         }
//       case ApiStatus.INTERNAL_SERVER_ERROR:
//         {
//           Get.snackbar("title", response.message);
//           break;
//         }
//       case ApiStatus.UNAUTH:
//         {
//           Get.snackbar("title", response.message);
//           break;
//         }
//     }
//   }
// }