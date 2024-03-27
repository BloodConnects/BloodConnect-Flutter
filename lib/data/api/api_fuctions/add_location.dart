import 'package:get/get.dart';
import '../../../domain/share_preference/share_preference_service.dart';
import '../../enum_classes/api_status.dart';
import '../model/LocationModel.dart';
import '../model/UserRepositry.dart';

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