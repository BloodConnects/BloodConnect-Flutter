import 'dart:convert';
import 'package:blood_donation_app/api/module/api_constants.dart';
import 'package:blood_donation_app/api/module/userModel.dart';
import 'module/BaseResponse.dart';
import 'package:http/http.dart' as http;

Future<BaseResponse<String>> checkUser(String uid) async {
  var params = jsonEncode(UserModel(uid: uid).toJson());
  var headers = {
    'Content-Type': 'application/json',
  };
  return safeApiCall<String>(() =>
      http.post(Uri.parse(ApiConstants.baseUrl+ApiConstants.checkUser),body: params,headers: headers)
  );
}

Future<BaseResponse<UserModel>> register(UserModel user) async {
  var params = jsonEncode(user.toJson());
  var headers = {
    'Content-Type': 'application/json',
  };
  return safeApiCall(() =>
      http.post(Uri.parse(ApiConstants.baseUrl+ApiConstants.user),body: params,headers: headers)
  );
}

Future<BaseResponse<T>> safeApiCall<T>(Future<http.Response> Function() apiCall) async {
  try {
    final response = await apiCall();
    final decodedResponse = jsonDecode(response.body) as Map<String, dynamic>;
    final data = (T as BaseDataClass).fromJson(decodedResponse['data']) ;
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
