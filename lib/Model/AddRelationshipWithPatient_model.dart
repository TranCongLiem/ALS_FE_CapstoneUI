class AddRelationwithPatientRequest {
  String supporterId;
  String patientPhoneNumber;

  AddRelationwithPatientRequest(
      {required this.supporterId, required this.patientPhoneNumber});
  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'supporterId': supporterId,
      'patientPhoneNumber': patientPhoneNumber,
    };
    return map;
  }
}


class AddRelationwithPatientResponse {
  bool? success;
  String? message;
  AddRelationwithPatientResponse({this.success, this.message});

  factory AddRelationwithPatientResponse.fromJson(Map<String, dynamic> json) {
    return AddRelationwithPatientResponse(
      success: json["success"],
      message: json["message"],
    );
  }
}

class UpdateDateSupportRequest {
  String supporterId;
  String startSupportDate;
  String endSupportDate;

  UpdateDateSupportRequest(
      {required this.supporterId, required this.startSupportDate, required this.endSupportDate});
  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'supporterId': supporterId,
      'startSupportDate': startSupportDate,
      'endSupportDate': endSupportDate,
    };
    return map;
  }
}
class UpdateDateSupportResponse {
  bool? success;
  String? message;
  UpdateDateSupportResponse({this.success, this.message});

  factory UpdateDateSupportResponse.fromJson(Map<String, dynamic> json) {
    return UpdateDateSupportResponse(
      success: json["success"],
      message: json["message"],
    );
  }
}

class GetDetailUserByPhoneRequest{
  String patientPhoneNumber;

  GetDetailUserByPhoneRequest(
      {required this.patientPhoneNumber});
  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'userId': patientPhoneNumber   
    };
    return map;
  }
}
class GetDetailUserByPhoneResponse {
  String? userId;
  String? fullName;
  String? address;
  String? imageUser;
  GetDetailUserByPhoneResponse(
      { this.userId,this.fullName, this.address, this.imageUser});

  factory GetDetailUserByPhoneResponse.fromJson(Map<String, dynamic> json) {
    return GetDetailUserByPhoneResponse(
      userId: json["userId"],
      fullName: json["fullName"],
      address: json["address"],
      imageUser: json["imageUser"],
      
    );
  }
}
  class DeleteRelationwithPatientRequest {
  String supporterId;

  DeleteRelationwithPatientRequest(
      {required this.supporterId});
  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'userId': supporterId   
    };
    return map;
  }
}


class DeleteRelationwithPatientResponse {
  bool? success;
  String? message;
  DeleteRelationwithPatientResponse({this.success, this.message});

  factory DeleteRelationwithPatientResponse.fromJson(Map<String, dynamic> json) {
    return DeleteRelationwithPatientResponse(
      success: json["success"],
      message: json["message"],
    );
  }
}