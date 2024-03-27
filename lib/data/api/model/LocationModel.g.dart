// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'LocationModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocationModel _$LocationModelFromJson(Map<String, dynamic> json) =>
    LocationModel(
      locationKey: json['locationKey'] as String?,
      userUid: json['userUid'] as String?,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      houseNo: json['houseNo'] as String?,
      street: json['street'] as String?,
      address: json['address'] as String?,
      city: json['city'] as String?,
      state: json['state'] as String?,
      country: json['country'] as String?,
      postalCode: json['postalCode'] as String?,
      type: $enumDecodeNullable(_$LocationTypeEnumMap, json['type']),
    );

Map<String, dynamic> _$LocationModelToJson(LocationModel instance) =>
    <String, dynamic>{
      'locationKey': instance.locationKey,
      'userUid': instance.userUid,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'houseNo': instance.houseNo,
      'street': instance.street,
      'address': instance.address,
      'city': instance.city,
      'state': instance.state,
      'country': instance.country,
      'postalCode': instance.postalCode,
      'type': _$LocationTypeEnumMap[instance.type],
    };

const _$LocationTypeEnumMap = {
  LocationType.HOME: 'HOME',
  LocationType.CURRENT: 'CURRENT',
};
