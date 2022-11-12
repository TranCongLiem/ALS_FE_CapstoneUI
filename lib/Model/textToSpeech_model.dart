class TextToSpeechRequestModel {
  String text;
  String voice;

  TextToSpeechRequestModel({required this.text,required this.voice});
  
  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'text':text,
      'voice':voice,
    };
    return map;
  }
}


class TextToSpeechResponeModel {
  bool? success;
  String? message;
  TextToSpeechResponeModel({this.success, this.message});

  factory TextToSpeechResponeModel.fromJson(Map<String, dynamic> json) {
    return TextToSpeechResponeModel(
      success: json["success"],
      message: json["message"],
    );
    //message: json["role"] ? "Success" : "Invalid Phone Number or Password");
  }
}