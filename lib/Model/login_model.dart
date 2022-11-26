class LoginResponeModel {
  String? userId;
  String? phoneNumber;
  String? role;
  String? fullName;
  String? relationshipWith;
  //String? message;
  LoginResponeModel({this.userId,this.phoneNumber, this.role, this.fullName,this.relationshipWith});

  factory LoginResponeModel.fromJson(Map<String, dynamic> json) {
    return LoginResponeModel(
      userId: json["userId"] ?? '',
      role: json["role"] ?? '',
      phoneNumber: json["phoneNumber"] ?? '',
      fullName: json["fullName"] ?? '',
      relationshipWith: json["relationshipWith"] ?? '',
    );
    //message: json["role"] ? "Success" : "Invalid Phone Number or Password");
  }

}

class LoginRequestModel {
  String phoneNumber;
  String password;

  LoginRequestModel({required this.phoneNumber, required this.password});
  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'phoneNumber': phoneNumber.trim(),
      'password': password.trim()
    };
    return map;
  }
}
