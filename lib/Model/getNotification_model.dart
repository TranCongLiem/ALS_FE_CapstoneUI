class ShortCutNotification {
  String? ShortCutNoticationId;
  String? SenderId;
  String? SenderName;
  String? ReceiverId;
  String? title;
  String? CreateAt;
  bool? Status;

  // CategoryExercise(
  //   this.categoryId,
  //   this.categoryName,
  //   this.categoryImage
  // );
  ShortCutNotification({this.ShortCutNoticationId, this.SenderId,this.SenderName, this.ReceiverId,this.title,this.CreateAt,this.Status});

  factory ShortCutNotification.fromJson(Map<String, dynamic> json) {
    return ShortCutNotification(
      ShortCutNoticationId: json['shortCutNoticationId'] ?? '' as String,
      SenderId: json['senderId'] ?? '' as String,
      SenderName: json['senderName'] ?? '' as String,
      ReceiverId: json['receiverId'] ?? '' as String,
      title: json['title'] ?? '' as String,
      CreateAt: json['createAt'] ?? '' as String,
      Status: json['status'] ?? '' as bool,
    );
  }
}
