import '../../enum_classes/blood_group.dart';

class BloodGroupModel{
  BloodGroupModel({
    required this.bloodGroup,
    required this.image,
  });

  String image;
  BloodGroup bloodGroup;

  Map<String, dynamic> toJson() => {
    'image': image,
  };

  BloodGroupModel copyWith({
    int? quantity,
  }) => BloodGroupModel(
      image: image, bloodGroup: bloodGroup,
  );
}

