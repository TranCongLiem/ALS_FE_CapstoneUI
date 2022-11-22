class UpdateProfilePatientRequestModel {
  String userId;
  String fullName;
  String address;

  UpdateProfilePatientRequestModel(
      {required this.userId, required this.fullName, required this.address});
  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'fullName': fullName,
      'address': address,
    };
    return map;
  }
}

class UpdateInformationPatientRequestModel {
  String userId;
  String fullName;
  String imageUser;
  String condition;
  String cause;
  String address;
  String dateOfBirth;

  UpdateInformationPatientRequestModel(
      {required this.userId,
      required this.fullName,
      required this.address,
      required this.imageUser,
      required this.condition,
      required this.cause,
      required this.dateOfBirth});
  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'fullName': fullName,
      'imageUser': imageUser,
      'condition': condition,
      'cause': cause,
      'address': address,
      'dateOfBirth': dateOfBirth,
    };
    return map;
  }
}

class UpdateInformationSupporterRequestModel {
  String userId;
  String fullName;
  String imageUser;
  String address;

  UpdateInformationSupporterRequestModel({
    required this.userId,
    required this.fullName,
    required this.address,
    required this.imageUser,
  });
  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'fullName': fullName,
      'address': address,
      'imageUser': imageUser,
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
