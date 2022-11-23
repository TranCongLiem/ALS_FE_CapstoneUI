class RegisterRequestModel {
  String phoneNumber;
  String password;

  RegisterRequestModel({required this.phoneNumber, required this.password});
  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'phoneNumber': phoneNumber.trim(),
      'password': password.trim()
    };
    return map;
  }
}

class RegisterResponseModel {
  String? userId;
  String? phoneNumber;
  String? role;
  String? fullName;
  //String? message;
  RegisterResponseModel(
      {this.userId, this.phoneNumber, this.role, this.fullName});

  factory RegisterResponseModel.fromJson(Map<String, dynamic> json) {
    return RegisterResponseModel(
      userId: json["userId"],
      role: json["role"],
      phoneNumber: json["phoneNumber"],
      fullName: json["fullName"],
    );
    //message: json["role"] ? "Success" : "Invalid Phone Number or Password");
  }
}
