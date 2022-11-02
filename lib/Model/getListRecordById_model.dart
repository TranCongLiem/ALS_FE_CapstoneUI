class RecordByIdReQuestModel {
  String userId;

  RecordByIdReQuestModel({required this.userId});
  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'userId': userId,
    };
    return map;
  }
}

class RecordById {
  String? recordId;
  String? userId;
  String? recordName;
  String? linkAudio;
  String? createDate;

  // CategoryExercise(
  //   this.categoryId,
  //   this.categoryName,
  //   this.categoryImage
  // );
  RecordById({this.recordId, this.userId, this.recordName, this.linkAudio,this.createDate});

  factory RecordById.fromJson(Map<String, dynamic> json) {
    return RecordById(
      recordId: json['recordId'] ?? '' as String,
      userId: json['userId'] ?? '' as String,
      recordName: json['recordName'] ?? ''  as String,
      linkAudio: json['linkAudio'] ?? '' as String,
      createDate: json['createDate'] ?? '' as String,
    );
  }
}



