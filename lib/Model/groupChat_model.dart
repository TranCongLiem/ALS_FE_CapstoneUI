class ListAllGroupChatUserJoin {
  String? groupChatId;
  String? groupChatName;
  String? groupImage;
  String? lastMessageGroup;
  String? lastMessageSender;
  String? updateAt;

  ListAllGroupChatUserJoin(
      {this.groupChatId,
      this.groupChatName,
      this.groupImage,
      this.lastMessageGroup,
      this.lastMessageSender,
      this.updateAt});
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

class ListAllGroupChat {
  String? groupChatId;
  String? groupChatName;
  String? groupImage;
  int? totalMember;
  bool? hasJoin;

  ListAllGroupChat(
      {this.groupChatId,
      this.groupChatName,
      this.groupImage,
      this.totalMember,
      this.hasJoin});
  factory ListAllGroupChat.fromJson(Map<String, dynamic> json) {
    return ListAllGroupChat(
      groupChatId: json['groupChatId'] ?? '' as String,
      groupChatName: json['groupChatName'] ?? '' as String,
      groupImage: json['groupImage'] ?? '' as String,
      totalMember: json['totalMember'] ?? 0 as int,
      hasJoin: json['hasJoin'] ?? '' as bool,
    );
  }
}

class CreateGroupChatRequest {
  String? groupChatId;
  String? userId;
  String? groupChatName;
  String? groupChatImage;

  CreateGroupChatRequest(
      {this.groupChatId,this.userId, this.groupChatName, this.groupChatImage});
  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'groupChatId': groupChatId,
      'userId': userId,
      'groupChatName': groupChatName,
      'groupChatImage': groupChatImage,
    };
    return map;
  }
}

class UpdateLastMessageGroupChatRequest {
  String? groupChatId;
  String? lastMessageGroup;
  String? lastMessageSender;

  UpdateLastMessageGroupChatRequest(
      {this.groupChatId, this.lastMessageGroup, this.lastMessageSender});
  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'groupChatId': groupChatId,
      'lastMessageGroup': lastMessageGroup,
      'lastMessageSender': lastMessageSender,
    };
    return map;
  }
}

class AddMemberGroupChatRequest {
  String? memberId;
  String? groupChatId;

  AddMemberGroupChatRequest({this.memberId, this.groupChatId});
  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'memberId': memberId,
      'groupChatId': groupChatId,
    };
    return map;
  }
}

class GroupChatResponeModel {
  bool? success;
  String? message;
  GroupChatResponeModel({this.success, this.message});

  factory GroupChatResponeModel.fromJson(Map<String, dynamic> json) {
    return GroupChatResponeModel(
      success: json["success"],
      message: json["message"],
    );
  }
}
