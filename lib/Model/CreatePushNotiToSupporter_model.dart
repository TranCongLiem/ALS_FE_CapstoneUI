class CreatePushNotificationResponeModel {
  bool? success;
  String? message;
  CreatePushNotificationResponeModel({this.success, this.message});

  factory CreatePushNotificationResponeModel.fromJson(Map<String, dynamic> json) {
    return CreatePushNotificationResponeModel(
      success: json["success"],
      message: json["message"],
    );
    //message: json["role"] ? "Success" : "Invalid Phone Number or Password");
  }
}

class CreatePushNotificationRequestModel {
  String senderId;
  String receiverId;
  String title;

  CreatePushNotificationRequestModel({required this.senderId, required this.receiverId, required this.title});
  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'senderId': senderId,
      'receiverId': receiverId,
      'title': title,
    };
    return map;
  }
}