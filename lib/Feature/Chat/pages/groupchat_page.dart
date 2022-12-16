import 'dart:convert';
import 'dart:ui';

import 'package:capstone_ui/Bloc/authenticate/authenticate_bloc.dart';
import 'package:capstone_ui/Bloc/groupchat/groupchat_bloc.dart';
import 'package:capstone_ui/Bloc/list_group_chat_hasjoin/list_group_chat_hasjoin_bloc.dart';
import 'package:capstone_ui/Feature/Chat/pages/create_groupchat.dart';
import 'package:capstone_ui/Feature/Chat/pages/custom_listAllGroupChatHasJoin.dart';
import 'package:capstone_ui/Feature/Chat/pages/home_page.dart';
import 'package:capstone_ui/Feature/Chat/pages/search_groupchat.dart';
import 'package:capstone_ui/Feature/Chat/pages/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';
import '../../../Constant/constant.dart';
import '../../../Model/groupChat_model.dart';
import '../../../services/api_groupchat.dart';
import '../providers/database_service.dart';
import 'custom_listAllGroupChat.dart';
import 'package:http/http.dart' as http;

class GroupChatPage extends StatefulWidget {
  final String userId;
  final String fullName;
  const GroupChatPage(
      {super.key, required this.userId, required this.fullName});
  @override
  State<GroupChatPage> createState() => _GroupChatPageState();
}

class _GroupChatPageState extends State<GroupChatPage>
    with TickerProviderStateMixin {
  String groupName = "";
  bool _isLoading = false;
  bool _isFirstTime = true;
  late List<ListAllGroupChatUserJoin> data2;
  GroupChatService _groupList = GroupChatService();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 2, vsync: this);
    return BlocBuilder<AuthenticateBloc, AuthenticateState>(
      builder: (context, state) {
        return BlocProvider(
          create: (context) => ListGroupChatHasJoinBloc(
              RepositoryProvider.of<GroupChatService>(context))
            ..add(LoadListGroupChatByUserIdEvent(userId: state.userId)),
          child: DefaultTabController(
            length: 2,
            child: Scaffold(
                appBar: AppBar(
                    toolbarHeight: MediaQuery.of(context).size.height * 0.12,
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
                      style: TextStyle(fontSize: 23),
                    ),
                    actions: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.13,
                        height: MediaQuery.of(context).size.height * 0.05,
                        margin: EdgeInsets.all(15.0),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.white),
                        child: IconButton(
                          onPressed: () {
                            showSearch(
                                context: context,
                                delegate: SearchGroup(hintText: 'Tìm kiếm'));
                          },
                          icon: Icon(
                            Icons.search_sharp,
                            color: Colors.black,
                            size: 35,
                          ),
                        ),
                      ),
                    ],
                    bottom: TabBar(labelStyle: TextStyle(fontSize: 22), tabs: [
                      Tab(
                        text: 'Nhóm của bạn',
                        icon: Icon(
                          Icons.person,
                          size: 35,
                        ),
                      ),
                      Tab(
                        text: 'Nhóm',
                        icon: Icon(
                          Icons.group_add,
                          size: 35,
                        ),
                      ),
                    ]),
                    leading: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: IconButton(
                          icon: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                            size: 40,
                          ),
                          onPressed: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomePage(
                                          userId: widget.userId,
                                          userName: widget.fullName,
                                        )),
                              )),
                    )),
                floatingActionButton: Container(
                  width: MediaQuery.of(context).size.width * 0.2,
                  height: MediaQuery.of(context).size.height * 0.08,
                  child: FloatingActionButton(
                    onPressed: () {
                      // popUpDialog(context);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CreateGroupChat(
                                    userId: widget.userId,
                                    fullName: widget.fullName,
                                  )));
                    },
                    elevation: 0,
                    backgroundColor: greenALS,
                    child: const Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 35,
                    ),
                  ),
                ),
                body: TabBarView(
                  children: [
                    FutureBuilder<List<ListAllGroupChatUserJoin>>(
                        future:
                            _groupList.getAllGroupChatUserJoin(widget.userId),
                        builder: (context, snapshot) {
                          if (!snapshot.hasData) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          data2 = snapshot.data!;
                          return BlocBuilder<ListGroupChatHasJoinBloc,
                              ListGroupChatHasJoinState>(
                            builder: (context, state2) {
                              if (state2 is GroupChatHasJoinLoadedState) {
                                if (_isFirstTime) {
                                  data2 = state2.list1;
                                }
                                return RefreshIndicator(
                                    onRefresh: refesh,
                                    child: ListView.builder(
                                        itemCount: data2.length,
                                        itemBuilder: (context, index) {
                                          return CustomListAllGroupChatUserJoin(
                                            listAllGroupChatUserJoin:
                                                data2[index],
                                            fullName: widget.fullName,
                                            userId: widget.userId,
                                          );
                                        }));
                              }
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            },
                          );
                        }),

                    FutureBuilder<List<ListAllGroupChat>>(
                        future: _groupList.getAllGroupChat(widget.userId),
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
                                return CustomListAllGroupChat(
                                  listAllGroupChat: data,
                                  index: index,
                                );
                              });
                        }),

                    //Nhom đã tham gia
                  ],
                )),
          ),
        );
      },
    );
  }

  Future refesh() async {
    setState(() {
      _isFirstTime = false;
    });
    final response = await http.get(Uri.parse(
        "https://als.cosplane.asia/api/groupchat/GetAllGroupChatUserJoin?userId=" +
            widget.userId));
    if (response.statusCode == 200) {
      setState(() {
        var data = [];
        data = json.decode(response.body);
        data2 = data.map((e) => ListAllGroupChatUserJoin.fromJson(e)).toList();
      });
    } else {
      throw Exception('Lỗi dữ liệu');
    }
  }

  popUpDialog(BuildContext context) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: ((context, setState) {
            return AlertDialog(
              title: const Text(
                "Tạo nhóm",
                textAlign: TextAlign.left,
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _isLoading == true
                      ? Center(
                          child: CircularProgressIndicator(
                              color: Theme.of(context).primaryColor),
                        )
                      : TextField(
                          onChanged: (val) {
                            setState(() {
                              groupName = val;
                            });
                          },
                          style: const TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Theme.of(context).primaryColor),
                                  borderRadius: BorderRadius.circular(20)),
                              errorBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.red),
                                  borderRadius: BorderRadius.circular(20)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Theme.of(context).primaryColor),
                                  borderRadius: BorderRadius.circular(20))),
                        ),
                ],
              ),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: greenALS),
                  child: const Text("Hủy"),
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (groupName != "") {
                      setState(() {
                        _isLoading = true;
                      });
                      var uuid = Uuid();
                      var groupId = uuid.v1().toString();
                      DatabaseService(uid: widget.userId)
                          .createGroup(groupId, widget.fullName, widget.userId,
                              groupName)
                          .whenComplete(() {
                        _isLoading = false;
                      });
                      createdGroupChatRequest(groupId, widget.userId, groupName,
                          'https://media.istockphoto.com/id/1313777915/vector/als-awareness-month-vector-banner-for-social-media-card-poster-illustration-with-text-als.jpg?s=612x612&w=0&k=20&c=VBng-6ApRQNU7Vn-pL6Uu4K0Tz7vIvB7nmRS_CezhNI=');

                      Navigator.of(context).pop();
                      showSnackbar(
                          context, Colors.green, "Tạo nhóm thành công.");
                    }
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: greenALS),
                  child: const Text("Tạo"),
                )
              ],
            );
          }));
        });
  }

  void createdGroupChatRequest(String groupId, String userId,
      String groupChatName, String groupChatImage) {
    context.read<GroupchatBloc>().add(GroupchatEvent.CreatedGroupChatRequest(
        groupId, userId, groupChatName, groupChatImage));
  }
}
