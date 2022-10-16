// TODO Implement this library.

class Exericse{
  String? ExericseID;
  String? ExerciseName;
  String? Description;
  String? VideoLink;
  bool?   status;
  String? CategoryID;
  
  // Exericse({this.ExericseID,
  //   this.ExerciseName,
  //   this.Description,
  //   this.VideoLink,
  //   this.status ,
  //   this.CategoryID});

      Exericse(this.ExericseID,
    this.ExerciseName,
    this.Description,
    this.VideoLink,
    this.status ,
    this.CategoryID);
    
  // factory Exericse.fromJson(Map<String, dynamic> json) {
  //   return Exericse(
  //     //source: Source.fromJson(json['source']),
  //     ExericseID: json['Exercise'] ?? '' as String,
  //     ExerciseName: json['ExerciseName'] ?? '' as String,
  //     Description: json['Description'] ?? '' as String,
  //     VideoLink: json['VideoLink'] ?? '' as String,     
  //     status: json['status'] ?? '' as bool,
  //     CategoryID: json['CategoryID'] ?? '' as String,
  //   );
 // } 

}