class ImagesModel{
  ImagesModel({
    required this.image,
    required this.value
  });

  String image;
  int value;

  factory ImagesModel.fromJson(Map<String, dynamic> json) =>
      ImagesModel(
        image: json['image'],
        value: json['value'],
      );

  Map<String, dynamic> toJson() => {
    'image': image,
    'value': value,
  };

  ImagesModel copyWith({
    int? quantity,
  }) => ImagesModel(
    image: image,
    value: value,
  );
}