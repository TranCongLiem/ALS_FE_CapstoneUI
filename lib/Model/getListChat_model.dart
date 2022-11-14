class ListChat {
  String? userId;
  String? imageUser;
  String? fullName;
  String? updateAt;
  bool? seen;

  // CategoryExercise(
  //   this.categoryId,
  //   this.categoryName,
  //   this.categoryImage
  // );
  ListChat(
      {this.userId,
      this.imageUser,
      this.fullName,
      this.updateAt,
      this.seen,
     });

  factory ListChat.fromJson(Map<String, dynamic> json) {
    return ListChat(
      userId: json['userId'] ?? '' as String,
      imageUser: json['imageUser'] ?? '' as String,
      fullName: json['fullName'] ?? '' as String,
      updateAt: json['updateAt'] ?? '' as String,
      seen: json['seen'] ?? '' as bool,
    );
  }
}
