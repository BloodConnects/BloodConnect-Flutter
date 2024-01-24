class BloodGroupModel{
  BloodGroupModel({
    required this.image,
  });

  String image;

  factory BloodGroupModel.fromJson(Map<String, dynamic> json) =>
      BloodGroupModel(
          image: json['image'],
      );

  Map<String, dynamic> toJson() => {
    'image': image,
  };

  BloodGroupModel copyWith({
    int? quantity,
  }) => BloodGroupModel(
      image: image,
  );
}

