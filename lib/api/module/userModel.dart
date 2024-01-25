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
  Null? location;
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
        this.location,
        this.profilePictureUrl,
        this.deviceToken,
        this.userToken
      });

  UserModel.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    fullName = json['fullName'];
    countryCode = json['countryCode'];
    mobileNumber = json['mobileNumber'];
    mailAddress = json['mailAddress'];
    bloodGroup = json['bloodGroup'] as BloodGroup;
    gender = json['gender'] as Gender;
    birthDate = json['birthDate'];
    weight = json['weight'];
    locationKey = json['locationKey'];
    location = json['location'];
    profilePictureUrl = json['profilePictureUrl'];
    deviceToken = json['deviceToken'];
    userToken = json['userToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if(uid!=null) data['uid'] = this.uid;
    if(fullName!=null) data['fullName'] = this.fullName;
    if(countryCode!=null) data['countryCode'] = this.countryCode;
    if(mobileNumber!=null) data['mobileNumber'] = this.mobileNumber;
    if(mailAddress!=null) data['mailAddress'] = this.mailAddress;
    if(bloodGroup!=null) data['bloodGroup'] = this.bloodGroup;
    if(gender!=null) data['gender'] = this.gender;
    if(birthDate!=null) data['birthDate'] = this.birthDate;
    if(weight!=null) data['weight'] = this.weight;
    if(locationKey!=null) data['locationKey'] = this.locationKey;
    if(location!=null) data['location'] = this.location;
    if(profilePictureUrl!=null) data['profilePictureUrl'] = this.profilePictureUrl;
    if(deviceToken!=null) data['deviceToken'] = this.deviceToken;
    if(userToken!=null) data['userToken'] = this.userToken;
    return data;
  }
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
  Other,
}