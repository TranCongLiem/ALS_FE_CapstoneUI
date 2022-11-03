class GetProfileUserByIdRequestModel {
  String userId;

  GetProfileUserByIdRequestModel({required this.userId});
  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'userId':userId.trim(),
    };
    return map;
  }
}


class GetProfileUserByIdResponeModel {
  String? fullName;
  String? address;
  GetProfileUserByIdResponeModel({this.fullName, this.address});

  factory GetProfileUserByIdResponeModel.fromJson(Map<String, dynamic> json) {
    return GetProfileUserByIdResponeModel(
      fullName: json["fullName"],
      address: json["address"],
    );
  }
}



