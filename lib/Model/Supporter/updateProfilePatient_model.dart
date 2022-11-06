class UpdateProfilePatientRequestModel {
  String userId;
  String fullName;
  String address;

  UpdateProfilePatientRequestModel({required this.userId,required this.fullName, required this.address});
  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'fullName':fullName,
      'address':address,
    };
    return map;
  }
}


class UpdateProfilePatientResponeModel {
  bool? success;
  String? message;
  UpdateProfilePatientResponeModel({this.success, this.message});

  factory UpdateProfilePatientResponeModel.fromJson(Map<String, dynamic> json) {
    return UpdateProfilePatientResponeModel(
      success: json["success"],
      message: json["message"],
    );
    //message: json["role"] ? "Success" : "Invalid Phone Number or Password");
  }
}



