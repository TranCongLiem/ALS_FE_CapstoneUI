class UpdateDevicetokenMobileRequest {
  String? userId;
  String? mobileToken;

  UpdateDevicetokenMobileRequest({this.userId, this.mobileToken});

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'userId': userId,
      'mobileToken': mobileToken,
    };
    return map;
  }
}

class UpdateDevicetokenMobileResponse {
  bool? success;
  String? message;
  UpdateDevicetokenMobileResponse({this.success, this.message});

  factory UpdateDevicetokenMobileResponse.fromJson(Map<String, dynamic> json) {
    return UpdateDevicetokenMobileResponse(
      success: json["success"],
      message: json["message"],
    );
    //message: json["role"] ? "Success" : "Invalid Phone Number or Password");
  }
}
