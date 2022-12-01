import 'dart:convert';

import 'package:capstone_ui/Bloc/groupchat/groupchat_bloc.dart';
import 'package:capstone_ui/Feature/Chat/pages/create_groupchat.dart';
import 'package:capstone_ui/Feature/Chat/pages/custom_listAllGroupChatHasJoin.dart';
import 'package:capstone_ui/Feature/Chat/pages/home_page.dart';
import 'package:capstone_ui/Feature/Chat/pages/search_groupchat.dart';
import 'package:capstone_ui/Feature/Chat/pages/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';
import '../../../Bloc/list_group_chat/list_group_chat_bloc.dart';
import '../../../Bloc/list_group_chat_hasjoin/list_group_chat_hasjoin_bloc.dart';
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
  late List<ListAllGroupChatUserJoin> data2 ;
  GroupChatService _groupList = GroupChatService();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

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
                    ),
                  ),
                ),
              ],
              bottom: TabBar(tabs: [
                Tab(
                  text: 'Nhóm của bạn',
                  icon: Icon(Icons.group_add),
                ),
                Tab(
                  text: 'Nhóm',
                  icon: Icon(Icons.person),
                ),
              ]),
              leading: IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => HomePage(
                                  userId: widget.userId,
                                )),
                      ))),
          floatingActionButton: FloatingActionButton(
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
            backgroundColor: Theme.of(context).primaryColor,
            child: const Icon(
              Icons.add,
              color: Colors.white,
              size: 30,
            ),
          ),
          body: TabBarView(
            children: [
              FutureBuilder<List<ListAllGroupChatUserJoin>>(
                  future: _groupList.getAllGroupChatUserJoin(widget.userId),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    data2 = snapshot.data!;
                    return RefreshIndicator(
                        onRefresh: refesh,
                        child: ListView.builder(
                            itemCount: data2.length,
                            itemBuilder: (context, index) {
                              return CustomListAllGroupChatUserJoin(
                                listAllGroupChatUserJoin: data2[index],
                                fullName: widget.fullName,
                                userId: widget.userId,
                              );
                            }));
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
    );
  }

  Future refesh() async{
    final response = await http.get(
        Uri.parse("https://als.cosplane.asia/api/groupchat/GetAllGroupChatUserJoin?userId=" + widget.userId));
    if (response.statusCode == 200) {
      setState(() {
        var data = [];
        data = json.decode(response.body);
      data2 = data.map((e) => ListAllGroupChatUserJoin.fromJson(e)).toList();
      });
    } else {
      throw Exception ('Lỗi dữ liệu');
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
