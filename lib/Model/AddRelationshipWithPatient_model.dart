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