import 'dart:convert';
import 'package:blood_donation_app/api/api_constant/api_constants.dart';
import 'package:get/get.dart';
import '../model/userModel.dart';
import 'package:http/http.dart' as http;

class DonorListController extends GetxController {
  var donor = <UserModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchApiFile();
  }

  Future<void> fetchApiFile() async {
    try {
      final response = await http.get(Uri.parse(ApiConstants.baseUrl + ApiConstants.donor));
      if (response.statusCode == 200) {
        final dynamic jsonResponse = jsonDecode(response.body);
        final List<dynamic> donorData = jsonResponse['data']; // Extract donors list from 'data' key
        if (donorData != null && donorData is List<dynamic>) {
          List<UserModel> userModelList = donorData.map((donor) => UserModel.fromJson(donor)).toList();
          donor.value = userModelList;
        } else {
          throw Exception('Invalid donor data in API response: $donorData');
        }
      } else {
        throw Exception('Failed to load API: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load API: $e');
    }
  }

}
