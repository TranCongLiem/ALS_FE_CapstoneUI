import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../Model/groupChat_model.dart';
import '../utils/utilities.dart';
import 'package:timeago/timeago.dart' as timeago;

import 'group_chat_page.dart';

class CustomListAllGroupChatUserJoin extends StatefulWidget {
  final ListAllGroupChatUserJoin listAllGroupChatUserJoin;
  final String fullName;
  final String userId;
  const CustomListAllGroupChatUserJoin(
      {super.key, required this.listAllGroupChatUserJoin,required this.fullName,required this.userId });

  @override
  State<CustomListAllGroupChatUserJoin> createState() =>
      _CustomListAllGroupChatUserJoinState();
}

class _CustomListAllGroupChatUserJoinState
    extends State<CustomListAllGroupChatUserJoin> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    DateTime? time;
    // if(widget.listAllGroupChatUserJoin.updateAt != ''){
    //   time =
    //     DateTime.parse(widget.listAllGroupChatUserJoin.updateAt ?? '');
   
    // } 
     timeago.setLocaleMessages('vi', timeago.ViMessages());
   
    return InkWell(
      onTap: () {
        if (Utilities.isKeyboardShowing()) {
          Utilities.closeKeyboard(context);
        }
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => GroupChatPage(
                groupId: widget.listAllGroupChatUserJoin.groupChatId.toString(),
                userName :widget.fullName,
                groupName:widget.listAllGroupChatUserJoin.groupChatName.toString(),
                userId: widget.userId,
      
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          title: Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(
                    widget.listAllGroupChatUserJoin.groupImage ?? ''),
                maxRadius: 25,
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
                        widget.listAllGroupChatUserJoin.groupChatName ?? '',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Text(
                        widget.listAllGroupChatUserJoin.lastMessageGroup ?? '',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Text(

                // timeago.format(time!, locale: 'vi') ?? '',
                time == null 
                ? ''
                // :  timeago.format(time, locale: 'vi'),
                : DateFormat().add_yMd().format(time),
                style: TextStyle(
                  fontSize: 12,
                ),
              )
            ],
          ),
          // trailing: Text('More Info'),
        ),
      ),
    );
  }
}
