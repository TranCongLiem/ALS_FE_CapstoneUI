import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Bloc/list_group_chat/list_group_chat_bloc.dart';
import '../../../Constant/constant.dart';
import '../../../services/api_groupchat.dart';
import '../utils/utilities.dart';
import 'chat_page.dart';
import 'custom_listAllGroupChat.dart';

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
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => ListGroupChatBloc(
                RepositoryProvider.of<GroupChatService>(context))
              ..add(LoadListGroupChatEvent(userId: widget.userId))),
        BlocProvider(
            create: (context) => ListGroupChatBloc(
                RepositoryProvider.of<GroupChatService>(context))
              ..add(LoadListGroupChatByUserIdEvent(userId: widget.userId))),
      ],
      child: DefaultTabController(
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
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.white),
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
                  text: 'Nhóm',
                  icon: Icon(Icons.person),
                ),
                Tab(
                  text: 'Đã tham gia',
                  icon: Icon(Icons.group_add),
                )
              ]),
            ),
            body: TabBarView(
              children: [
                //nhom chưa tham gia
                BlocBuilder<ListGroupChatBloc, ListGroupChatState>(
                  builder: (context, state) {
                    if (state is GroupChatLoadedState) {
                      print('LiemOtis');
                      return ListView.builder(
                          itemCount: state.list2.length,
                          itemBuilder: (context, index) {
                            return CustomListAllGroupChat(
                                state.list2[index], context);
                          });
                    }
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),

                //Nhom đã tham gia
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
      ),
    );
  }
}
