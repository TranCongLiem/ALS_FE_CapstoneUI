

class ListPost {
  String? postId;
  String? createDate;
  String? image;
  String? caption;
  String? fullNameUser;
  String? imageUser;
  int? countReact;
  bool? checkReact;

  // CategoryExercise(
  //   this.categoryId,
  //   this.categoryName,
  //   this.categoryImage
  // );
  ListPost({this.postId, this.createDate, this.image, this.caption, this.fullNameUser, this.imageUser, this.countReact, this.checkReact});

  factory ListPost.fromJson(Map<String, dynamic> json) {
    return ListPost(
      postId: json['postId'] ?? '' as String,
      createDate: json['createDate'] ?? '' as String,
      image: json['image'] ?? '' as String,
      caption: json['caption'] ?? '' as String,
      fullNameUser: json['fullNameUser'] ?? '' as String,
      imageUser: json['imageUser'] ?? '' as String,
      countReact: json['countReact'] ?? 0 as int,
      checkReact: json['checkReact'] ?? '' as bool,
    );
  }
}
