import 'package:blood_donation_app/api/UserRepositry.dart';
import 'package:json_annotation/json_annotation.dart';

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
  int? weight;
  String? locationKey;
  String? profilePictureUrl;
  String? deviceToken;
  String? userToken;

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
        this.userToken
      });

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this).toSafeJson();

}

enum BloodGroup {
  oPositive,
  oNegative,
  aPositive,
  aNegative,
  bPositive,
  bNegative,
  abPositive,
  abNegative,
  unknown;

  String toDisplayText() {
    switch(this) {
      case BloodGroup.oPositive:{
        return "O Positive";
      }
      case BloodGroup.oNegative:{
        return "O Negative";
      }
      case BloodGroup.aPositive:{
        return "A Positive";
      }
      case BloodGroup.aNegative:{
        return "A Negative";
      }
      case BloodGroup.bPositive:{
        return "B Positive";
      }
      case BloodGroup.bNegative:{
        return "B Negative";
      }
      case BloodGroup.abPositive:{
        return "AB Positive";
      }
      case BloodGroup.abNegative:{
        return "AB Negative";
      }
      default: return "unknown";
    }
  }
  
}

enum Gender {
  Male,
  Female,
  Other;

 
}

abstract class BaseDataClass<T>{
  T fromJson(Map<String, dynamic> json);
}