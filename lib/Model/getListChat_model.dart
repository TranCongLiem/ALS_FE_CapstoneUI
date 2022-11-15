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
  ListChat.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    imageUser = json['imageUser'];
    fullName = json['fullName'];
    updateAt = json['updateAt'];
    seen = json['seen'];
  }


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['imageUser'] = this.imageUser;
    data['fullName'] = this.fullName;
    data['updateAt'] = this.updateAt;
    data['seen'] = this.seen;
    return data;
  }
}
