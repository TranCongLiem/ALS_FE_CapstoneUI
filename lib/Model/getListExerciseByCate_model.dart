// TODO Implement this library.

class Exericse{
  String? ExericseID;
  String? ExerciseName;
  String? Description;
  String? VideoLink;
  bool?   status;
  String? CategoryID;
  
  Exericse({this.ExericseID,
    this.ExerciseName,
    this.Description,
    this.VideoLink,
    this.status ,
    this.CategoryID});

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
      VideoLink: json['videoLink'] ?? '' as String,     
      status: json['status'] ?? '' as bool,
      CategoryID: json['categoryName'] ?? '' as String,
    );
 } 

}