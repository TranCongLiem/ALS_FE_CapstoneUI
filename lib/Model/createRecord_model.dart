import 'dart:ffi';

class CreateRecordResponeModel {
  Bool? success;
  String? message;
  CreateRecordResponeModel({this.success, this.message});

  factory CreateRecordResponeModel.fromJson(Map<String, dynamic> json) {
    return CreateRecordResponeModel(
      success: json["success"],
      message: json["message"],
    );
    //message: json["role"] ? "Success" : "Invalid Phone Number or Password");
  }
}

class CreateRecordQuestModel {
  String userId;
  String recordName;
  String linkAudio;

  CreateRecordQuestModel({required this.userId, required this.recordName, required this.linkAudio});
  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'userId': userId,
      'recordName': recordName,
      'linkAudio': linkAudio.trim(),
    };
    return map;
  }
}
