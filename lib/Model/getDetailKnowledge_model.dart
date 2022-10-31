class DetailKnowledge {
  String? NewsID;
  String? Title;
  String? Description;
  String? Image;
  String? CreateDate;
  String? LastModifyBy;
  String? ModifyDate;
  bool? Status;

  DetailKnowledge(
      {this.NewsID,
      this.Title,
      this.Description,
      this.Image,
      this.CreateDate,
      this.LastModifyBy,
      this.ModifyDate,
      this.Status});
  factory DetailKnowledge.fromJson(Map<String, dynamic> json) {
    return DetailKnowledge(
      NewsID: json['newsId'] ?? '' as String,
      Title: json['title'] ?? '' as String,
      Description: json['description'] ?? '' as String,
      Image: json['image'] ?? '' as bool,
      CreateDate: json['createDate'] ?? '' as String,
      LastModifyBy: json['lastModifyBy'] ?? '' as String,
      ModifyDate: json['modifyDate'] ?? '' as String,
      Status: json['status'] ?? '' as bool,
    );
  }
}
