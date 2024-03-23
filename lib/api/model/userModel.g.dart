// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'userModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      uid: json['uid'] as String?,
      fullName: json['fullName'] as String?,
      countryCode: json['countryCode'] as String?,
      mobileNumber: json['mobileNumber'] as String?,
      mailAddress: json['mailAddress'] as String?,
      bloodGroup: $enumDecodeNullable(_$BloodGroupEnumMap, json['bloodGroup']),
      gender: $enumDecodeNullable(_$GenderEnumMap, json['gender']),
      birthDate: json['birthDate'] as int?,
      weight: (json['weight'] as num?)?.toDouble(),
      locationKey: json['locationKey'] as String?,
      profilePictureUrl: json['profilePictureUrl'] as String?,
      deviceToken: json['deviceToken'] as String?,
      userToken: json['userToken'] as String?,
      height: (json['height'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'uid': instance.uid,
      'fullName': instance.fullName,
      'countryCode': instance.countryCode,
      'mobileNumber': instance.mobileNumber,
      'mailAddress': instance.mailAddress,
      'bloodGroup': _$BloodGroupEnumMap[instance.bloodGroup],
      'gender': _$GenderEnumMap[instance.gender],
      'birthDate': instance.birthDate,
      'weight': instance.weight,
      'locationKey': instance.locationKey,
      'profilePictureUrl': instance.profilePictureUrl,
      'deviceToken': instance.deviceToken,
      'userToken': instance.userToken,
      'height': instance.height,
    };

const _$BloodGroupEnumMap = {
  BloodGroup.oPositive: 'oPositive',
  BloodGroup.oNegative: 'oNegative',
  BloodGroup.aPositive: 'aPositive',
  BloodGroup.aNegative: 'aNegative',
  BloodGroup.bPositive: 'bPositive',
  BloodGroup.bNegative: 'bNegative',
  BloodGroup.abPositive: 'abPositive',
  BloodGroup.abNegative: 'abNegative',
  BloodGroup.unknown: 'unknown',
};

const _$GenderEnumMap = {
  Gender.Male: 'Male',
  Gender.Female: 'Female',
  Gender.Other: 'Other',
};
