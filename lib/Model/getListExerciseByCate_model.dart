// // TODO Implement this library.

// import 'package:youtube_player_flutter/youtube_player_flutter.dart';

// class Exericse {
//   String? ExericseID;
//   String? ExerciseName;
//   String? Description;
//   String? VideoLink;
//   bool? status;
//   String? CategoryID;
//   YoutubePlayerController? controller;

//   Exericse({
//     this.ExericseID,
//     this.ExerciseName,
//     this.Description,
//     this.VideoLink,
//     this.status,
//     this.CategoryID,
//     this.controller,
//   });

//   //   Exericse(this.ExericseID,
//   // this.ExerciseName,
//   // this.Description,
//   // this.VideoLink,
//   // this.status ,
//   // this.CategoryID);

//   factory Exericse.fromJson(Map<String, dynamic> json) {
//     return Exericse(
//       //source: Source.fromJson(json['source']),
//       ExericseID: json['exerciseId'] ?? '' as String,
//       ExerciseName: json['exerciseName'] ?? '' as String,
//       Description: json['description'] ?? '' as String,
//       VideoLink: json['videoLink'] ?? '' as String,
//       status: json['status'] ?? '' as bool,
//       CategoryID: json['categoryName'] ?? '' as String,
//     );
//   }
// }
// TODO Implement this library.

import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Exericse {
  String? ExericseID;
  String? ExerciseName;
  String? Description;
  String? exerciseLevel;
  String? exerciseImage;
  String? VideoLink;
  bool? status;
  String? CategoryID;
  YoutubePlayerController? controller;

  Exericse({
    this.ExericseID,
    this.ExerciseName,
    this.Description,
    this.exerciseLevel,
    this.exerciseImage,
    this.VideoLink,
    this.status,
    this.CategoryID,
    this.controller,
  });

  //   Exericse(this.ExericseID,
  // this.ExerciseName,
  // this.Description,
  // this.VideoLink,
  // this.status ,
  // this.CategoryID);

  factory Exericse.fromJson(Map<String, dynamic> json) {
    return Exericse(
      //source: Source.fromJson(json['source']),
      ExericseID: json['exerciseId'] ?? '' as String,
      ExerciseName: json['exerciseName'] ?? '' as String,
      Description: json['description'] ?? '' as String,
      exerciseLevel: json['exerciseLevel'] ?? '' as String,
      exerciseImage: json['exerciseImage'] ?? '' as String,
      VideoLink: json['videoLink'] ?? '' as String,
      status: json['status'] ?? '' as bool,
      CategoryID: json['categoryName'] ?? '' as String,
    );
  }
}
