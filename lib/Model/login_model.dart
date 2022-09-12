class LoginResponeModel {
   String? token;
   String? error;
  LoginResponeModel({this.token, this.error});

  factory LoginResponeModel.fromJson(Map<String, dynamic> json){
    return LoginResponeModel(token: json["token"] != null ? json["token"]: "", error: json["error"] != null ? json["error"]: "");

  }

}

class LoginRequestModel {
  String email;
  String password;

  LoginRequestModel({required this.email, required this.password});
  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'email': email.trim(),
      'password': password.trim()
    };
    return map;
  }
}
