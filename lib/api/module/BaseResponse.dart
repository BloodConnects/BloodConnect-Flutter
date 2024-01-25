class BaseResponse<T> {
  late bool success;
  late String message;
  late ApiStatus status;
  T? data;

  BaseResponse({required this.success, required this.status, required this.message, this.data});

  BaseResponse.fromJson(Map<String, dynamic> json) {
    success = json['success']??false;
    message = json['message']??"";
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = this.success;
    data['message'] = this.message;
    data['data'] = this.data;
    return data;
  }

}

enum ApiStatus {
  SUCCESS,
  FAIL,
  INTERNAL_SERVER_ERROR,
  UNAUTH
}