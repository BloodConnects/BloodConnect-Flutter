import 'dart:convert';
import 'package:blood_donation_app/api/api_constant/api_constants.dart';
import 'package:blood_donation_app/api/model/LocationModel.dart';
import 'package:blood_donation_app/share_preference/share_preference_service.dart';
import '../../enum_classes/api_status.dart';
import 'BaseResponse.dart';
import 'userModel.dart';
import 'package:http/http.dart' as http;

Future<BaseResponse<String>> checkUser(String uid) async {
  var params = jsonEncode(UserModel(uid: uid).toJson().toSafeJson());
  var headers = {
    'Content-Type': 'application/json',
  };
  try {
    final response = await http.post(
        Uri.parse(ApiConstants.baseUrl + ApiConstants.checkUser),
        body: params,
        headers: headers);
    final decodedResponse = jsonDecode(response.body) as Map<String, dynamic>;
    final data = decodedResponse['data'] as String?;
    final success = decodedResponse['success'] as bool;
    if (response.statusCode == 200) {
      return BaseResponse(
          success: success,
          status: ApiStatus.SUCCESS,
          message: decodedResponse['message'],
          data: data);
    } else if (response.statusCode == 101) {
      return BaseResponse(
          success: success,
          status: ApiStatus.FAIL,
          message: decodedResponse['message'],
          data: null);
    } else if (response.statusCode == 500) {
      return BaseResponse(
          success: success,
          status: ApiStatus.INTERNAL_SERVER_ERROR,
          message: decodedResponse['message'],
          data: null);
    } else if (response.statusCode == 401) {
      return BaseResponse(
          success: success,
          status: ApiStatus.UNAUTH,
          message: decodedResponse['message'],
          data: null);
    } else {
      return BaseResponse(
          success: false,
          status: ApiStatus.FAIL,
          message: decodedResponse['message'],
          data: null);
    }
  } catch (e) {
    print(e);
    return BaseResponse(
        success: false,
        status: ApiStatus.FAIL,
        message: e.toString(),
        data: null);
  }
}

Future<BaseResponse<UserModel>> register(UserModel user) async {
  var params = jsonEncode(user.toJson().toSafeJson());
  var headers = {
    'Content-Type': 'application/json',
  };
  try {
    final response = await http.post(
        Uri.parse(ApiConstants.baseUrl + ApiConstants.user),
        body: params,
        headers: headers);
    final decodedResponse = jsonDecode(response.body) as Map<String, dynamic>;
    UserModel? data;
    if (decodedResponse['data'] != null) {
      data = UserModel.fromJson(decodedResponse['data']);
    }
    final success = decodedResponse['success'] as bool;
    if (response.statusCode == 200) {
      return BaseResponse(
          success: success,
          status: ApiStatus.SUCCESS,
          message: decodedResponse['message'],
          data: data);
    } else if (response.statusCode == 101) {
      return BaseResponse(
          success: success,
          status: ApiStatus.FAIL,
          message: decodedResponse['message'],
          data: null);
    } else if (response.statusCode == 500) {
      return BaseResponse(
          success: success,
          status: ApiStatus.INTERNAL_SERVER_ERROR,
          message: decodedResponse['message'],
          data: null);
    } else if (response.statusCode == 401) {
      return BaseResponse(
          success: success,
          status: ApiStatus.UNAUTH,
          message: decodedResponse['message'],
          data: null);
    } else {
      return BaseResponse(
          success: false,
          status: ApiStatus.FAIL,
          message: decodedResponse['message'],
          data: null);
    }
  } catch (e) {
    print(e);
    return BaseResponse(
        success: false,
        status: ApiStatus.FAIL,
        message: e.toString(),
        data: null);
  }
}

Future<BaseResponse<UserModel>> login(UserModel user) async {
  var params = jsonEncode(user.toJson().toSafeJson());
  var headers = {
    'Content-Type': 'application/json',
  };
  try {
    final response = await http.post(
        Uri.parse(ApiConstants.baseUrl + ApiConstants.login),
        body: params,
        headers: headers);
    final decodedResponse = jsonDecode(response.body) as Map<String, dynamic>;
    UserModel? data;
    if (decodedResponse['data'] != null) {
      data = UserModel.fromJson(decodedResponse['data']);
    }
    final success = decodedResponse['success'] as bool;
    if (response.statusCode == 200) {
      return BaseResponse(
          success: success,
          status: ApiStatus.SUCCESS,
          message: decodedResponse['message'],
          data: data);
    } else if (response.statusCode == 101) {
      return BaseResponse(
          success: success,
          status: ApiStatus.FAIL,
          message: decodedResponse['message'],
          data: null);
    } else if (response.statusCode == 500) {
      return BaseResponse(
          success: success,
          status: ApiStatus.INTERNAL_SERVER_ERROR,
          message: decodedResponse['message'],
          data: null);
    } else if (response.statusCode == 401) {
      return BaseResponse(
          success: success,
          status: ApiStatus.UNAUTH,
          message: decodedResponse['message'],
          data: null);
    } else {
      return BaseResponse(
          success: false,
          status: ApiStatus.FAIL,
          message: decodedResponse['message'],
          data: null);
    }
  } catch (e) {
    print(e);
    return BaseResponse(
        success: false,
        status: ApiStatus.FAIL,
        message: e.toString(),
        data: null);
  }
}

Future<BaseResponse<UserModel>> updateData(UserModel userModel) async {
  try {
    var params = jsonEncode(userModel.toJson().toSafeJson());
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${await SharePreferenceService().getUserToken()}'
    };
    var response = await http.put(
      Uri.parse(ApiConstants.baseUrl + ApiConstants.user),
      headers: headers,
      body: params,
    );
    final decodedResponse = jsonDecode(response.body) as Map<String, dynamic>;

    UserModel? data;
    if (decodedResponse['data'] != null) {
      data = UserModel.fromJson(decodedResponse['data']);
    }
    final success = decodedResponse['success'] as bool;
    if (response.statusCode == 200) {
      return BaseResponse(
          success: success,
          status: ApiStatus.SUCCESS,
          message: decodedResponse['message'],
          data: data);
    } else if (response.statusCode == 101) {
      return BaseResponse(
          success: success,
          status: ApiStatus.FAIL,
          message: decodedResponse['message'],
          data: null);
    } else if (response.statusCode == 500) {
      return BaseResponse(
          success: success,
          status: ApiStatus.INTERNAL_SERVER_ERROR,
          message: decodedResponse['message'],
          data: null);
    } else if (response.statusCode == 401) {
      return BaseResponse(
          success: success,
          status: ApiStatus.UNAUTH,
          message: decodedResponse['message'],
          data: null);
    } else {
      return BaseResponse(
          success: false,
          status: ApiStatus.FAIL,
          message: decodedResponse['message'],
          data: null);
    }
  } catch (e) {
    print(e);
    return BaseResponse(
        success: false,
        status: ApiStatus.FAIL,
        message: e.toString(),
        data: null);
  }
}

Future<BaseResponse<UserModel>> deleteUser() async {
  try {
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${await SharePreferenceService().getUserToken()}'
    };
    var response = await http.delete(
      Uri.parse(ApiConstants.baseUrl + ApiConstants.user),
      headers: headers,
    );
    final decodedResponse = jsonDecode(response.body) as Map<String, dynamic>;
    final success = decodedResponse['success'] as bool;
    if (response.statusCode == 200) {
      return BaseResponse(
          success: success,
          status: ApiStatus.SUCCESS,
          message: decodedResponse['message'],
          data: null);
    } else if (response.statusCode == 101) {
      return BaseResponse(
          success: success,
          status: ApiStatus.FAIL,
          message: decodedResponse['message'],
          data: null);
    } else if (response.statusCode == 500) {
      return BaseResponse(
          success: success,
          status: ApiStatus.INTERNAL_SERVER_ERROR,
          message: decodedResponse['message'],
          data: null);
    } else if (response.statusCode == 401) {
      return BaseResponse(
          success: success,
          status: ApiStatus.UNAUTH,
          message: decodedResponse['message'],
          data: null);
    } else {
      return BaseResponse(
          success: false,
          status: ApiStatus.FAIL,
          message: decodedResponse['message'],
          data: null);
    }
  } catch (e) {
    print(e);
    return BaseResponse(
      success: false,
      status: ApiStatus.FAIL,
      message: e.toString(),
      data: null,
    );
  }
}

Future<BaseResponse<LocationModel>> addLocation(LocationModel locationModel) async {
  try {
    var params = jsonEncode(locationModel.toJson().toSafeJson());
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${await SharePreferenceService().getUserToken()}'
    };
    var response = await http.post(
      Uri.parse(ApiConstants.baseUrl + ApiConstants.location),
      headers: headers,
      body: params,
    );
    final decodedResponse = jsonDecode(response.body) as Map<String, dynamic>;

    LocationModel? data;
    if (decodedResponse['data'] != null) {
      data = LocationModel.fromJson(decodedResponse['data']);
    }
    final success = decodedResponse['success'] as bool;
    if (response.statusCode == 200) {
      return BaseResponse(
          success: success,
          status: ApiStatus.SUCCESS,
          message: decodedResponse['message'],
          data: data);
    } else if (response.statusCode == 101) {
      return BaseResponse(
          success: success,
          status: ApiStatus.FAIL,
          message: decodedResponse['message'],
          data: null);
    } else if (response.statusCode == 500) {
      return BaseResponse(
          success: success,
          status: ApiStatus.INTERNAL_SERVER_ERROR,
          message: decodedResponse['message'],
          data: null);
    } else if (response.statusCode == 401) {
      return BaseResponse(
          success: success,
          status: ApiStatus.UNAUTH,
          message: decodedResponse['message'],
          data: null);
    } else {
      return BaseResponse(
          success: false,
          status: ApiStatus.FAIL,
          message: decodedResponse['message'],
          data: null);
    }
  } catch (e) {
    print(e);
    return BaseResponse(
        success: false,
        status: ApiStatus.FAIL,
        message: e.toString(),
        data: null);
  }
}

Future<BaseResponse<LocationModel>> getLocation() async {
  try {
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${await SharePreferenceService().getUserToken()}'
    };
    var response = await http.get(
      Uri.parse(ApiConstants.baseUrl + ApiConstants.location),
      headers: headers,
    );
    final decodedResponse = jsonDecode(response.body) as Map<String, dynamic>;

    LocationModel? data;
    if (decodedResponse['data'] != null) {
      data = LocationModel.fromJson(decodedResponse['data']);
    }
    final success = decodedResponse['success'] as bool;
    if (response.statusCode == 200) {
      return BaseResponse(
          success: success,
          status: ApiStatus.SUCCESS,
          message: decodedResponse['message'],
          data: data);
    } else if (response.statusCode == 101) {
      return BaseResponse(
          success: success,
          status: ApiStatus.FAIL,
          message: decodedResponse['message'],
          data: null);
    } else if (response.statusCode == 500) {
      return BaseResponse(
          success: success,
          status: ApiStatus.INTERNAL_SERVER_ERROR,
          message: decodedResponse['message'],
          data: null);
    } else if (response.statusCode == 401) {
      return BaseResponse(
          success: success,
          status: ApiStatus.UNAUTH,
          message: decodedResponse['message'],
          data: null);
    } else {
      return BaseResponse(
          success: false,
          status: ApiStatus.FAIL,
          message: decodedResponse['message'],
          data: null);
    }
  } catch (e) {
    print(e);
    return BaseResponse(
        success: false,
        status: ApiStatus.FAIL,
        message: e.toString(),
        data: null);
  }
}

extension JsonExtensions on Map<String, dynamic> {
  Map<String, dynamic> toSafeJson() {
    return Map.fromEntries(
      entries.where((entry) => entry.value != null),
    );
  }
}
