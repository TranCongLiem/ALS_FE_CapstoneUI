class GetProfileUserByIdRequestModel {
  String userId;

  GetProfileUserByIdRequestModel({required this.userId});
  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'userId': userId.trim(),
    };
    return map;
  }
}

class GetProfileUserByIdResponeModel {
  String? fullName;
  String? address;
  String? imageUser;
  String? relationshipWith;
  GetProfileUserByIdResponeModel(
      {this.fullName, this.address, this.imageUser, this.relationshipWith});

  factory GetProfileUserByIdResponeModel.fromJson(Map<String, dynamic> json) {
    return GetProfileUserByIdResponeModel(
      fullName: json["fullName"],
      address: json["address"],
      imageUser: json["imageUser"],
      relationshipWith: json["relationshipWith"],
    );
  }
}

class GetRelatinshipWithUserByIdRequestModel {
  String userId;

  GetRelatinshipWithUserByIdRequestModel({required this.userId});
  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'userId': userId.trim(),
    };
    return map;
  }
}

class GetRelatinshipWithUserByIdResponeModel {
  String? RelationshipWith;

  GetRelatinshipWithUserByIdResponeModel({this.RelationshipWith});

  factory GetRelatinshipWithUserByIdResponeModel.fromJson(
      Map<String, dynamic> json) {
    return GetRelatinshipWithUserByIdResponeModel(
      RelationshipWith: json["relationshipWith"],
    );
  }
}

class GetPhoneByIdRequestModel {
  String userId;

  GetPhoneByIdRequestModel({required this.userId});
  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'userId': userId.trim(),
    };
    return map;
  }
}

class GetPhoneByIdResponeModel {
  String? phoneNumber;

  GetPhoneByIdResponeModel({this.phoneNumber});

  factory GetPhoneByIdResponeModel.fromJson(Map<String, dynamic> json) {
    return GetPhoneByIdResponeModel(
      phoneNumber: json["phoneNumber"],
    );
  }
}
