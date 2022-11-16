class ListChat {
  String? userId;
  String? imageUser;
  String? fullName;
  String? lastMessage;
  String? updateAt;
  bool? hasSeen;

  // CategoryExercise(
  //   this.categoryId,
  //   this.categoryName,
  //   this.categoryImage
  // );
  ListChat({
    this.userId,
    this.imageUser,
    this.fullName,
    this.updateAt,
    this.hasSeen,
  });
  ListChat.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    imageUser = json['imageUser'];
    fullName = json['fullName'];
    lastMessage = json['lastMessage'];
    updateAt = json['updateAt'];
    hasSeen = json['hasSeen'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['imageUser'] = this.imageUser;
    data['fullName'] = this.fullName;
    data['lastMessage'] = this.lastMessage;
    data['updateAt'] = this.updateAt;
    data['hasSeen'] = this.hasSeen;
    return data;
  }
}

class UpdateHasSeenResponeModel {
  bool? success;
  String? message;
  UpdateHasSeenResponeModel({this.success, this.message});

  factory UpdateHasSeenResponeModel.fromJson(Map<String, dynamic> json) {
    return UpdateHasSeenResponeModel(
      success: json["success"],
      message: json["message"],
    );
    //message: json["role"] ? "Success" : "Invalid Phone Number or Password");
  }
}

class UpdateHasSeenReQuestModel {
  String? userIdFrom;
  String? userIdTo;

  UpdateHasSeenReQuestModel({required this.userIdFrom, required this.userIdTo});
  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'userIdFrom': userIdFrom,
      'userIdTo': userIdTo,
    };
    return map;
  }
}

class UpdateUserChatResponeModel {
  bool? success;
  String? message;
  UpdateUserChatResponeModel({this.success, this.message});

  factory UpdateUserChatResponeModel.fromJson(Map<String, dynamic> json) {
    return UpdateUserChatResponeModel(
      success: json["success"],
      message: json["message"],
    );
    //message: json["role"] ? "Success" : "Invalid Phone Number or Password");
  }
}

class UpdateUserChatReQuestModel {
  String? userIdFrom;
  String? userIdTo;
  String? lastMessage;

  UpdateUserChatReQuestModel(
      {required this.userIdFrom,
      required this.userIdTo,
      required this.lastMessage});
  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'userIdFrom': userIdFrom,
      'userIdTo': userIdTo,
      'lastMessage': lastMessage,
    };
    return map;
  }
}


