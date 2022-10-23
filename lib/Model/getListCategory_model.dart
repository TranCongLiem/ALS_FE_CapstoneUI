

class CategoryExercise {
  String? categoryId;
  String? categoryName;
  String? categoryImage;

  // CategoryExercise(
  //   this.categoryId,
  //   this.categoryName,
  //   this.categoryImage
  // );
  CategoryExercise({this.categoryId, this.categoryName, this.categoryImage});

  factory CategoryExercise.fromJson(Map<String, dynamic> json) {
    return CategoryExercise(
      categoryId: json['categoryId'] ?? '' as String,
      categoryName: json['catgegoryName'] ?? '' as String,
      categoryImage: json['categoryImage'] ?? '' as String,
    );
  }
}
