import 'package:capstone_ui/Model/groupChat_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../Bloc/groupchat/groupchat_bloc.dart';
import '../../../Constant/constant.dart';
import '../constants/color_constants.dart';
import '../utils/utilities.dart';

class CustomSearchGroup extends StatefulWidget {
  final ListAllGroupChat listAllGroupChat;
  final String userId;
  const CustomSearchGroup(
      {super.key, required this.listAllGroupChat, required this.userId});

  @override
  State<CustomSearchGroup> createState() => _CustomSearchGroupState();
}

class _CustomSearchGroupState extends State<CustomSearchGroup> {
  late bool? hasJoin = widget.listAllGroupChat.hasJoin;
  late int totalMember = widget.listAllGroupChat.totalMember ?? 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: () {
          if (Utilities.isKeyboardShowing()) {
            Utilities.closeKeyboard(context);
          }
        },
        child: Container(
          margin: EdgeInsets.all(10.0),
          child: ListTile(
            title: Row(
              children: [
                CircleAvatar(
                  backgroundImage:
                      NetworkImage(widget.listAllGroupChat.groupImage ?? ''),
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
                          widget.listAllGroupChat.groupChatName ?? '',
                          style: TextStyle(fontSize: 18),
                        ),
                        Text(
                          'Tổng thành viên: ${totalMember}',
                          style: TextStyle(fontSize: 14.0),
                        ),
                      ],
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () => {
                    if (hasJoin == false)
                      {
                        addedMemberGroupChat(widget.userId,
                            widget.listAllGroupChat.groupChatId.toString()),
                      }
                    else
                      {
                        Fluttertoast.showToast(
                            msg: 'Bạn đã tham gia nhóm này rồi',
                            backgroundColor: greenALS,
                            fontSize: 18.0),
                      }
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: hasJoin == true
                          ? greenALS.withOpacity(0.6)
                          : Colors.grey),
                  child: Text(hasJoin == true ? 'Đã tham gia' : 'Tham gia'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void addedMemberGroupChat(String userId, String gropchatId) {
    setState(() {
      hasJoin = true;
      totalMember++;
    });
    context
        .read<GroupchatBloc>()
        .add(GroupchatEvent.AddedMemberGroupChatRequest(userId, gropchatId));
  }
}
