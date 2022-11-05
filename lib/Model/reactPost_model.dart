class CreateReactPostResponeModel {
  bool? success;
  String? message;
  CreateReactPostResponeModel({this.success, this.message});

  factory CreateReactPostResponeModel.fromJson(Map<String, dynamic> json) {
    return CreateReactPostResponeModel(
      success: json["success"],
      message: json["message"],
    );
    //message: json["role"] ? "Success" : "Invalid Phone Number or Password");
  }
}

class CreateReactPostReQuestModel {
  String userId;
  String postId;

  CreateReactPostReQuestModel({required this.userId, required this.postId});
  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'userId': userId,
      'postId': postId,
    };
    return map;
  }
}

class UpdateReactPostResponeModel {
  bool? success;
  String? message;
  UpdateReactPostResponeModel({this.success, this.message});

  factory UpdateReactPostResponeModel.fromJson(Map<String, dynamic> json) {
    return UpdateReactPostResponeModel(
      success: json["success"],
      message: json["message"],
    );
    //message: json["role"] ? "Success" : "Invalid Phone Number or Password");
  }
}

class UpdateReactPostReQuestModel {
  String userId;
  String postId;
  bool status;

  UpdateReactPostReQuestModel({required this.userId, required this.postId, required this.status});
  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'userId': userId,
      'postId': postId,
      'status': status,
    };
    return map;
  }
}

class CheckExistReactUserRequestModel {
  String userId;
  String postId;
  CheckExistReactUserRequestModel({required this.userId,required this.postId});

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'userId': userId,
      'postId': postId,
    };
    return map;
  }
}

class CheckExistReactUserResponeModel {
   bool check;
  //CheckExistReactUserResponeModel();
   CheckExistReactUserResponeModel({required this.check});

    factory CheckExistReactUserResponeModel.fromJson(Map<String, dynamic> json) {
    return CheckExistReactUserResponeModel(
      check: json["check"],
    );
  }
}
