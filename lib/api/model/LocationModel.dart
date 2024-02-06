import 'package:blood_donation_app/api/model/UserRepositry.dart';
import 'package:json_annotation/json_annotation.dart';
part 'LocationModel.g.dart';

@JsonSerializable()
class LocationModel {
  String? locationKey;
  String? userUid;
  double? latitude;
  double? longitude;
  String? houseNo;
  String? street;
  String? address;
  String? city;
  String? state;
  String? country;
  String? postalCode;
  LocationType? type;

  LocationModel(
      {this.locationKey,
        this.userUid,
        this.latitude,
        this.longitude,
        this.houseNo,
        this.street,
        this.address,
        this.city,
        this.state,
        this.country,
        this.postalCode,
        this.type});

  factory LocationModel.fromJson(Map<String, dynamic> json) => _$LocationModelFromJson(json);

  Map<String, dynamic> toJson() => _$LocationModelToJson(this).toSafeJson();
}

enum LocationType {
  HOME,
  CURRENT
}