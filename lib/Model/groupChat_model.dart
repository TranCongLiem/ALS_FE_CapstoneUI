class ListAllGroupChatUserJoin{
  String? groupChatId;
  String? groupChatName;
  String? groupImage;
  String? lastMessageGroup;
  String? lastMessageSender;
  String? updateAt;

  ListAllGroupChatUserJoin({this.groupChatId, this.groupChatName, this.groupImage, this.lastMessageGroup,this.lastMessageSender, this.updateAt});
   factory ListAllGroupChatUserJoin.fromJson(Map<String, dynamic> json) {
    return ListAllGroupChatUserJoin(
      groupChatId: json['groupChatId'] ?? '' as String,
      groupChatName: json['groupChatName'] ?? '' as String,
      groupImage: json['groupImage'] ?? '' as String,
      lastMessageGroup: json['lastMessageGroup'] ?? '' as String,
      lastMessageSender: json['lastMessageSender'] ?? '' as String,
      updateAt: json['updateAt'] ?? '' as String,
    );
  }
}

class ListAllGroupChat{
   String? groupChatId;
  String? groupChatName;
  String? groupImage;
  int? totalMember;
  bool? hasJoin;
 

  ListAllGroupChat({this.groupChatId, this.groupChatName, this.groupImage, this.totalMember,this.hasJoin});
   factory ListAllGroupChat.fromJson(Map<String, dynamic> json) {
    return ListAllGroupChat(
      groupChatId: json['groupChatId'] ?? '' as String,
      groupChatName: json['groupChatName'] ?? '' as String,
      groupImage: json['groupImage'] ?? '' as String,
      totalMember: json['totalMember'] ?? '' as int,
      hasJoin: json['hasJoin'] ?? '' as bool,
    
    );
  }
}