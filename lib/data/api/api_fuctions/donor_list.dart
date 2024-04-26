import 'dart:convert';
import 'package:blood_donation_app/data/api/model/blood_group_model.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../domain/share_preference/share_preference_service.dart';
import '../../enum_classes/blood_group.dart';
import '../api_constant/api_constants.dart';
import '../model/userModel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class DonorListController extends GetxController {
  var donor = <UserModel>[].obs;
  RxList<Marker> markers = <Marker>[].obs;

  Future<void> fetchApiFile(BloodGroup? bloodGroup,LatLng latLng) async {
    try {
      Map<String, dynamic> jsonData = {
        "offset": 0,
        "limit": 10,
        "location": {
          "latitude": latLng.latitude,
          "longitude": latLng.longitude
        }
      };
      if (bloodGroup!=null) {
        jsonData["bloodGroup"] = bloodGroup.name;
      }

      String params = convert.jsonEncode(jsonData);
      var headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${await SharePreferenceService().getUserToken()}'
      };
      final response =
          await http.post(Uri.parse(ApiConstants.baseUrl + ApiConstants.donor),headers: headers,body: params);

      if (response.statusCode == 200) {
        final dynamic jsonResponse = jsonDecode(response.body);
        final List<dynamic> donorData = jsonResponse['data'];
        List<UserModel> userModelList = donorData.map((donor) => UserModel.fromJson(donor)).toList();
        donor.value = userModelList;
      } else {
        throw Exception('Failed to load API: ${response.statusCode}');
      }
      for (var element in donor) {
        markers.add(Marker(markerId: MarkerId(element.uid.toString()),position: LatLng(element.location?.latitude??0.0,element.location?.longitude??0.0)));
      }
    } catch (e) {
      throw Exception('Failed to load API: $e');
    }
  }
}
