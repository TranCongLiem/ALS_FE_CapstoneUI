class ListKnowledgeSupporter {
  String? newsId;
  String? title;
  String? description;
  String? image;
  String? createDate;
  String? lastModifyBy;
  String? modifyDate;
  bool? status;

  // CategoryExercise(
  //   this.categoryId,
  //   this.categoryName,
  //   this.categoryImage
  // );
  ListKnowledge(
      {this.newsId,
      this.title,
      this.description,
      this.image,
      this.createDate,
      this.lastModifyBy,
      this.modifyDate,
      this.status});

  factory ListKnowledge.fromJson(Map<String, dynamic> json) {
    return ListKnowledge(
      newsId: json['newsId'] ?? '' as String,
      title: json['title'] ?? '' as String,
      description: json['description'] ?? '' as String,
      image: json['image'] ?? '' as String,
      createDate: json['createDate'] ?? '' as String,
      lastModifyBy: json['lastModifyBy'] ?? '' as String,
      modifyDate: json['modifyDate'] ?? '' as String,
      status: json['status'] ?? '' as bool,
    );
  }
}
