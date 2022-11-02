import 'dart:ffi';

class CreatePostResponeModel {
  bool? success;
  String? message;
  CreatePostResponeModel({this.success, this.message});

  factory CreatePostResponeModel.fromJson(Map<String, dynamic> json) {
    return CreatePostResponeModel(
      success: json["success"],
      message: json["message"],
    );
    //message: json["role"] ? "Success" : "Invalid Phone Number or Password");
  }
}

class CreatePostReQuestModel {
  String userId;
  String image;
  String caption;

  CreatePostReQuestModel({required this.userId, required this.image, required this.caption});
  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'userId': userId,
      'image': image,
      'caption': caption.trim(),
    };
    return map;
  }
}
