//
//
// class ListKnowledge {
//   String? newsId;
//   String? title;
//   String? description;
//   String? image;
//   String? createDate;
//   String? lastModifyBy;
//   String? modifyDate;
//   bool? status;
//
//   // CategoryExercise(
//   //   this.categoryId,
//   //   this.categoryName,
//   //   this.categoryImage
//   // );
//   ListKnowledge({this.newsId, this.title, this.description, this.image, this.createDate, this.lastModifyBy, this.modifyDate, this.status});
//
//   factory ListKnowledge.fromJson(Map<String, dynamic> json) {
//     return ListKnowledge(
//       newsId: json['newsId'] ?? '' as String,
//       title: json['title'] ?? '' as String,
//       description: json['description'] ?? '' as String,
//       image: json['image'] ?? '' as String,
//       createDate: json['createDate'] ?? '' as String,
//       lastModifyBy: json['lastModifyBy'] ?? '' as String,
//       modifyDate: json['modifyDate'] ?? '' as String,
//       status: json['status'] ?? '' as bool,
//     );
//   }
// }


class ListKnowledge {
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
  ListKnowledge({this.newsId, this.title, this.description, this.image, this.createDate, this.lastModifyBy, this.modifyDate, this.status});

  factory ListKnowledge.fromJson(Map<String, dynamic> json) {
    return ListKnowledge(
      newsId: json['newsId'] ?? '' as String,
      title: json['title'] ?? '' as String,
      description: json['description'] ?? '' as String,
      image: json['image'] ?? '' as String,
      createDate: json['createDate'] ?? '' as String,
      lastModifyBy: json['lastModifyBy'] ?? '' as String,
      modifyDate: json['modifyDate'] ?? '' as String,
      status: json['status'] ?? false as bool,
    );
  }

}
class DetailKnowledgeResponse {
  String? newsId;
  String? title;
  String? description;
  String? image;
  String? createDate;
  String? lastModifyBy;
  String? modifyDate;
  List<NewsDetailResponse>? newsDetail;
  bool? status;

  // CategoryExercise(
  //   this.categoryId,
  //   this.categoryName,
  //   this.categoryImage
  // );
  DetailKnowledgeResponse({this.newsId, this.title, this.description, this.image, this.createDate, this.lastModifyBy, this.modifyDate,this.newsDetail, this.status});

  factory DetailKnowledgeResponse.fromJson(Map<String, dynamic> json) {
    return DetailKnowledgeResponse(
      newsId: json['newsId'] ?? '' as String,
      title: json['title'] ?? '' as String,
      description: json['description'] ?? '' as String,
      image: json['image'] ?? '' as String,
      createDate: json['createDate'] ?? '' as String,
      lastModifyBy: json['lastModifyBy'] ?? '' as String,
      modifyDate: json['modifyDate'] ?? '' as String,
      //newsDetail: json['newDetails']??[] as List<NewsDetailResponse>,
      newsDetail: List<NewsDetailResponse>.from(json['newDetails'].map((x)=> NewsDetailResponse.fromJson(x))),
      status: json['status'] ?? '' as bool,
    );
  }

}

class NewsDetailResponse {
  String? NewsDetailId;
  String? newsId;
  String? headerName;
  String? descriptionHeader;
  String? imageHeader;
  String? createAt;
  NewsDetailResponse({this.NewsDetailId, this.newsId, this.headerName,this.descriptionHeader, this.imageHeader, this.createAt});

  factory NewsDetailResponse.fromJson(Map<String, dynamic> json) {
    return NewsDetailResponse(
      NewsDetailId: json['newsDetailId'] ?? '' as String,
      newsId: json['newsId'] ?? '' as String,
      headerName: json['headerName'] ?? '' as String,
      descriptionHeader: json['descriptionHeader'] ?? '' as String,
      imageHeader: json['imageHeader'] ?? '' as String,
      createAt: json['createAt'] ?? '' as String,

    );
  }
}

class GetDetailKnowLedgeByIdRequest {
  String newsId;

  GetDetailKnowLedgeByIdRequest({required this.newsId});
  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'id': newsId.toString().trim(),
    };
    return map;
  }
}
class GetKnowledgeByCategoryKnowledgeIdRequest {
  String CategoryKnowLedeId;

  GetKnowledgeByCategoryKnowledgeIdRequest({required this.CategoryKnowLedeId});
  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'categoryNewsId': CategoryKnowLedeId.toString().trim(),
    };
    return map;
  }
}
class CategoryNewsKnowLedgeResponse{
  String? categoryNewId;
  String? categoryName;

  CategoryNewsKnowLedgeResponse({  this.categoryNewId,  this.categoryName});
  factory CategoryNewsKnowLedgeResponse.fromJson(Map<String, dynamic> json) {
    return CategoryNewsKnowLedgeResponse(
      categoryNewId: json['categoryNewId']??'' as String,
      categoryName: json['categoryName'] ??'' as String,
    );
  }

}