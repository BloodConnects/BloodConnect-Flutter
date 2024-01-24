class ApiClass{
  String text;

  ApiClass({
    required this.text
});

  factory ApiClass.fromJson(Map<String, dynamic> json){
    return ApiClass(text: json['text']);
  }
}