class RemoveRecordByIdRequestModel {
  String recordId;

  RemoveRecordByIdRequestModel({required this.recordId});
  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'recordId':recordId.trim(),
    };
    return map;
  }
}


class RemoveRecordByIdResponeModel {
  bool? success;
  String? message;
  RemoveRecordByIdResponeModel({this.success, this.message});

  factory RemoveRecordByIdResponeModel.fromJson(Map<String, dynamic> json) {
    return RemoveRecordByIdResponeModel(
      success: json["success"],
      message: json["message"],
    );
    //message: json["role"] ? "Success" : "Invalid Phone Number or Password");
  }
}



