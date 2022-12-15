import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;
import '../../../Model/groupChat_model.dart';

class CustomListUserGroupChat extends StatefulWidget {
  final ListGetAllUserInGroupChat listGetAllUserInGroupChat;
  const CustomListUserGroupChat(
      {super.key, required this.listGetAllUserInGroupChat});

  @override
  State<CustomListUserGroupChat> createState() =>
      _CustomListUserGroupChatState();
}

class _CustomListUserGroupChatState extends State<CustomListUserGroupChat> {
  @override
  Widget build(BuildContext context) {
    DateTime? time;
    if (widget.listGetAllUserInGroupChat.joinTime != '') {
      time = DateTime.parse(widget.listGetAllUserInGroupChat.joinTime ?? '');
    }
    timeago.setLocaleMessages('vi', timeago.ViMessages());
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      child: ListTile(
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(
                  widget.listGetAllUserInGroupChat.imageUser.toString()),
              maxRadius: 30,
            ),
            SizedBox(
              width: 16,
            ),
            Expanded(
              child: Container(
                color: Colors.transparent,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      widget.listGetAllUserInGroupChat.fullName.toString(),
                      style: TextStyle(
                        fontSize: 22,
                      ),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Text(
                      'Đã tham gia: ${timeago.format(time!, locale: 'vi')}',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        // trailing: Text('More Info'),
      ),
    );
  }
}
