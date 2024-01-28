import 'dart:convert';
import 'package:blood_donation_app/api/module/api_constants.dart';
import 'package:blood_donation_app/api/module/userModel.dart';
import 'module/BaseResponse.dart';
import 'package:http/http.dart' as http;

Future<BaseResponse<String>> checkUser(String uid) async {
  var params = jsonEncode(UserModel(uid: uid).toJson().toSafeJson());
  var headers = {
    'Content-Type': 'application/json',
  };
  try {
    final response = await http.post(Uri.parse(ApiConstants.baseUrl+ApiConstants.user),body: params,headers: headers);
    final decodedResponse = jsonDecode(response.body) as Map<String, dynamic>;
    final data = decodedResponse['data'] as String;
    final success = decodedResponse['success'] as bool;
    if(response.statusCode==200) {
      return BaseResponse(success: success,status: ApiStatus.SUCCESS, message: decodedResponse['message'], data: data);
    } else if(response.statusCode==101) {
      return BaseResponse(success: success,status: ApiStatus.FAIL, message: decodedResponse['message'], data: null);
    } else if(response.statusCode==500) {
      return BaseResponse(success: success,status: ApiStatus.INTERNAL_SERVER_ERROR, message: decodedResponse['message'], data: null);
    } else if(response.statusCode==401) {
      return BaseResponse(success: success,status: ApiStatus.UNAUTH, message: decodedResponse['message'], data: null);
    } else {
      return BaseResponse(success: false,status: ApiStatus.FAIL, message: decodedResponse['message'], data: null);
    }
  } catch (e) {
    print(e);
    return BaseResponse(success: false,status: ApiStatus.FAIL,message:e.toString(),data:null);
  }
}

Future<BaseResponse<UserModel>> register(UserModel user) async {
  var params = jsonEncode(user.toJson().toSafeJson());
  var headers = {
    'Content-Type': 'application/json',
  };
  try {
    final response = await http.post(Uri.parse(ApiConstants.baseUrl+ApiConstants.user),body: params,headers: headers);
    final decodedResponse = jsonDecode(response.body) as Map<String, dynamic>;
    UserModel? data;
    if (decodedResponse['data']!=null){
      data = UserModel.fromJson(decodedResponse['data']);
    }
    final success = decodedResponse['success'] as bool;
    if(response.statusCode==200) {
      return BaseResponse(success: success,status: ApiStatus.SUCCESS, message: decodedResponse['message'], data: data);
    } else if(response.statusCode==101) {
      return BaseResponse(success: success,status: ApiStatus.FAIL, message: decodedResponse['message'], data: null);
    } else if(response.statusCode==500) {
      return BaseResponse(success: success,status: ApiStatus.INTERNAL_SERVER_ERROR, message: decodedResponse['message'], data: null);
    } else if(response.statusCode==401) {
      return BaseResponse(success: success,status: ApiStatus.UNAUTH, message: decodedResponse['message'], data: null);
    } else {
      return BaseResponse(success: false,status: ApiStatus.FAIL, message: decodedResponse['message'], data: null);
    }
  } catch (e) {
    print(e);
    return BaseResponse(success: false,status: ApiStatus.FAIL,message:e.toString(),data:null);
  }
}

extension JsonExtensions on Map<String, dynamic> {
  Map<String, dynamic> toSafeJson() {
    return Map.fromEntries(entries.where((entry) => entry.value != null),);
  }
}