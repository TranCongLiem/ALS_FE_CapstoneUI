class UpdateProfileSupporterRequestModel {
  String userId;
  String fullName;
  String address;

  UpdateProfileSupporterRequestModel(
      {required this.userId, required this.fullName, required this.address});
  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'fullName': fullName,
      'address': address,
    };
    return map;
  }
}

class UpdateProfileSupporterResponeModel {
  bool? success;
  String? message;
  UpdateProfileSupporterResponeModel({this.success, this.message});

  factory UpdateProfileSupporterResponeModel.fromJson(
      Map<String, dynamic> json) {
    return UpdateProfileSupporterResponeModel(
      success: json["success"],
      message: json["message"],
    );
  }
}
