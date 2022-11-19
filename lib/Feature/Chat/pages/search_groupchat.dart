import 'package:capstone_ui/Bloc/authenticate/authenticate_bloc.dart';
import 'package:capstone_ui/Model/getListChat_model.dart';
import 'package:capstone_ui/Model/groupChat_model.dart';
import 'package:capstone_ui/services/api_chat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../Constant/constant.dart';
import '../../../services/api_groupchat.dart';
import '../constants/color_constants.dart';
import '../utils/utilities.dart';
import 'chat_page.dart';

class SearchGroup extends SearchDelegate<String> {
  final String? hintText;
  SearchGroup({this.hintText});

  @override
  String? get searchFieldLabel => hintText;

  // Other overrides...
  GroupChatService _groupList = GroupChatService();

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: Icon(Icons.close))
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back_ios),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return BlocBuilder<AuthenticateBloc, AuthenticateState>(
      builder: (context, state) {
        return FutureBuilder<List<ListAllGroupChat>>(
            future: _groupList.getAllGroupChatSearch(state.userId, query: query),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              List<ListAllGroupChat>? data = snapshot.data;
              return ListView.builder(
                  itemCount: data?.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        if (Utilities.isKeyboardShowing()) {
                          Utilities.closeKeyboard(context);
                        }
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => ChatPage(
                        //       arguments: ChatPageArguments(
                        //         peerId: data?[index].userId ?? '',
                        //         peerAvatar: data?[index].imageUser ?? '',
                        //         peerNickname: data?[index].fullName ?? '',
                        //       ),
                        //       userId: state.userId,
                        //     ),
                        //   ),
                        // );
                      },
                      child: Container(
                        margin: EdgeInsets.all(10.0),
                        child: ListTile(
                          title: Row(
                            children: [
                              CircleAvatar(
                                backgroundImage:
                                    NetworkImage('${data?[index].groupImage}'),
                                maxRadius: 25,
                              ),
                              SizedBox(
                                width: 16,
                              ),
                              Column(
                                children: [
                                  Expanded(
                                    child: Container(
                                      color: Colors.transparent,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            '${data?[index].groupChatName}',
                                            style: TextStyle(fontSize: 18),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Text(
                                    'Tổng thành viên: ${data?[index].totalMember}',
                                    style: TextStyle(
                                      fontSize: 14.0
                                    ),
                                  )
                                ],
                              ),
                  //             ElevatedButton(
                  //   onPressed: () => {
                  //     if ('${data?[index].hasJoin}' == false)
                  //       {
                  //         // addedMemberGroupChat(
                  //         //     state.userId,
                  //         //     widget.listAllGroupChat[widget.index].groupChatId
                  //         //         .toString()),
                         
                  //       }
                  //     else
                  //       {
                  //         Fluttertoast.showToast(
                  //             msg: 'Bạn đã tham gia nhóm này rồi',
                  //             backgroundColor: ColorConstants.greyColor),
                  //       }
                  //   },
                  //   style: ElevatedButton.styleFrom(
                  //       backgroundColor: '${data?[index].hasJoin}' == true
                  //           ? greenALS.withOpacity(0.6)
                  //           : Colors.grey),
                  //   child: Text('${data?[index].hasJoin}' == true ? 'Đã tham gia' : 'Tham gia'),
                  // )
                            ],
                          ),
                        ),
                      ),
                    );
                  });
            });
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Center(
      child: Text(''),
    );
  }
  

  //  void addedMemberGroupChat(String userId, String gropchatId) {
  //   setState(() {
  //     hasJoin = true;
  //     totalMember++;
  //   });
  //   context
  //       .read<GroupchatBloc>()
  //       .add(GroupchatEvent.AddedMemberGroupChatRequest(userId, gropchatId));
  // }
}
