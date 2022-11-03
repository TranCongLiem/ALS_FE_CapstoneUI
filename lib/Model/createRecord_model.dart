import 'dart:ffi';

class CreateRecordResponeModel {
  bool? success;
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

class CreateRecordReQuestModel {
  String userId;
  String recordName;
  String linkAudio;

  CreateRecordReQuestModel({required this.userId, required this.recordName, required this.linkAudio});
  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'userId': userId,
      'recordName': recordName,
      'linkAudio': linkAudio.trim(),
    };
    return map;
  }
}
