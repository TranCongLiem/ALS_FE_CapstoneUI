class UpdatePostResponeModel {
  bool? success;
  String? message;
  UpdatePostResponeModel({this.success, this.message});

  factory UpdatePostResponeModel.fromJson(Map<String, dynamic> json) {
    return UpdatePostResponeModel(
      success: json["success"],
      message: json["message"],
    );
    //message: json["role"] ? "Success" : "Invalid Phone Number or Password");
  }
}

class UpdatePostReQuestModel {
  String postId;
  bool? isPublic;

  UpdatePostReQuestModel({required this.postId, required this.isPublic});
  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'postId': postId,
      'isPublic': isPublic,
    };
    return map;
  }
}
