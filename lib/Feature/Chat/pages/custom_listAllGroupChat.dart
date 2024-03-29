import 'package:capstone_ui/Bloc/authenticate/authenticate_bloc.dart';
import 'package:capstone_ui/Bloc/groupchat/groupchat_bloc.dart';
import 'package:capstone_ui/Feature/Chat/constants/color_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../../Constant/constant.dart';
import '../../../Model/groupChat_model.dart';
import '../utils/utilities.dart';
import 'groupchat_page.dart';

class CustomListAllGroupChat extends StatefulWidget {
  final List<ListAllGroupChat>? listAllGroupChat;
  final int index;
  const CustomListAllGroupChat(
      {super.key, required this.listAllGroupChat, required this.index});

  @override
  State<CustomListAllGroupChat> createState() => _CustomListAllGroupChatState();
}

class _CustomListAllGroupChatState extends State<CustomListAllGroupChat> {
  late bool? hasJoin = widget.listAllGroupChat![widget.index].hasJoin;
  late int totalMember =
      widget.listAllGroupChat![widget.index].totalMember ?? 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticateBloc, AuthenticateState>(
      builder: (context, state) {
        return InkWell(
          onTap: () {
            if (Utilities.isKeyboardShowing()) {
              Utilities.closeKeyboard(context);
            }
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                        widget.listAllGroupChat![widget.index].groupImage ??
                            ''),
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
                            widget.listAllGroupChat?[widget.index]
                                    .groupChatName ??
                                '',
                            style: TextStyle(
                              fontSize: 22,
                            ),
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          Text(
                            'Tổng thành viên: ${totalMember}',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () => {
                      if (hasJoin == false)
                        {
                          addedMemberGroupChat(
                              state.userId,
                              widget.listAllGroupChat![widget.index].groupChatId
                                  .toString()),
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
                    child: Text(
                      hasJoin == true ? 'Đã tham gia' : 'Tham gia',
                      style: TextStyle(fontSize: 20),
                    ),
                  )
                ],
              ),
              // trailing: Text('More Info'),
            ),
          ),
        );
      },
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
