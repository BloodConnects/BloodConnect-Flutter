import 'package:blood_donation_app/data/api/model/UserRepositry.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../enum_classes/blood_group.dart';
import '../../enum_classes/gender.dart';

part 'userModel.g.dart';

@JsonSerializable()
class UserModel {
  String? uid;
  String? fullName;
  String? countryCode;
  String? mobileNumber;
  String? mailAddress;
  BloodGroup? bloodGroup;
  Gender? gender;
  int? birthDate;
  double? weight;
  String? locationKey;
  String? profilePictureUrl;
  String? deviceToken;
  String? userToken;
  double? height;

  UserModel(
      {this.uid,
        this.fullName,
        this.countryCode,
        this.mobileNumber,
        this.mailAddress,
        this.bloodGroup,
        this.gender,
        this.birthDate,
        this.weight,
        this.locationKey,
        this.profilePictureUrl,
        this.deviceToken,
        this.userToken,
        this.height
      });

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this).toSafeJson();

}

abstract class BaseDataClass<T>{
  T fromJson(Map<String, dynamic> json);
}