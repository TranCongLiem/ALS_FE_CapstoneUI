import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../Constant/constant.dart';
import '../utils/utilities.dart';
import 'chat_page.dart';

class GroupChatPage extends StatefulWidget {
  final String userId;
  const GroupChatPage({super.key, required this.userId});

  @override
  State<GroupChatPage> createState() => _GroupChatPageState();
}

class _GroupChatPageState extends State<GroupChatPage>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 2, vsync: this);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            toolbarHeight: MediaQuery.of(context).size.height * 0.1,
            shape: ShapeBorder.lerp(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20.0),
                    bottomRight: Radius.circular(20.0)),
              ),
              null,
              0,
            ),
            backgroundColor: greenALS,
            title: Text(
              'Trò chuyện nhóm',
              style: TextStyle(),
            ),
            actions: [
              Container(
                margin: EdgeInsets.all(15.0),
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.white),
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.search_sharp,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
            bottom: TabBar(tabs: [
              Tab(
                text: 'Đã tham gia',
                icon: Icon(Icons.person),
              ),
              Tab(
                text: 'Nhóm',
                icon: Icon(Icons.group_add),
              )
            ]),
          ),
          body: TabBarView(
            children: [
              //nhom da tham gia
              Center(
                child: Stack(
                  children: [
                    Container(
                        padding: EdgeInsets.all(10),
                        child: ListView.builder(
                            itemCount: 10,
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
                                  //         peerAvatar:
                                  //             data?[index].imageUser ?? '',
                                  //         peerNickname:
                                  //             data?[index].fullName ?? '',
                                  //       ),

                                  //     ),
                                  //   ),
                                  // );
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ListTile(
                                    title: Row(
                                      children: [
                                        CircleAvatar(
                                          backgroundImage: NetworkImage(''),
                                          maxRadius: 25,
                                        ),
                                        SizedBox(
                                          width: 16,
                                        ),
                                        Expanded(
                                          child: Container(
                                            color: Colors.transparent,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Text(
                                                  'Liêm',
                                                  style: TextStyle(
                                                    fontSize: 18,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 6,
                                                ),
                                                Text(
                                                  'Hello',
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                    fontSize: 13,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Text(
                                          '25 phút',
                                          style: TextStyle(
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                    // trailing: Text('More Info'),
                                  ),
                                ),
                              );
                            })),
                  ],
                ),
              ),

              //Nhom chua tham gia
              Center(
                child: Stack(
                  children: [
                    Container(
                        padding: EdgeInsets.all(10),
                        child: ListView.builder(
                            itemCount: 10,
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
                                  //         peerAvatar:
                                  //             data?[index].imageUser ?? '',
                                  //         peerNickname:
                                  //             data?[index].fullName ?? '',
                                  //       ),

                                  //     ),
                                  //   ),
                                  // );
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ListTile(
                                    title: Row(
                                      children: [
                                        CircleAvatar(
                                          backgroundImage: NetworkImage(''),
                                          maxRadius: 25,
                                        ),
                                        SizedBox(
                                          width: 16,
                                        ),
                                        Expanded(
                                          child: Container(
                                            color: Colors.transparent,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Text(
                                                  'Liêm',
                                                  style: TextStyle(
                                                    fontSize: 18,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 6,
                                                ),
                                                Text(
                                                  'Hello',
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                    fontSize: 13,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        ElevatedButton(
                                          onPressed: () {},
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  greenALS.withOpacity(0.6)),
                                          child: Text('Tham gia'),
                                        )
                                      ],
                                    ),
                                    // trailing: Text('More Info'),
                                  ),
                                ),
                              );
                            })),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
