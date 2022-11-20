

import 'package:capstone_ui/Constant/constant.dart';
import 'package:capstone_ui/Feature/Chat/pages/custom_listusergroupchat.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Bloc/groupchat/groupchat_bloc.dart';
import '../../../Bloc/list_user_group_chat/list_user_group_chat_bloc.dart';
import '../../../Model/groupChat_model.dart';
import '../../../services/api_groupchat.dart';
import '../providers/database_service.dart';
import 'group_chat_page.dart';
import 'widgets.dart';

class GroupInfo extends StatefulWidget {
  final String groupId;
  final String groupName;
  final String adminName;
  final String userId;
  const GroupInfo({
    Key? key,
    required this.adminName,
    required this.groupName,
    required this.groupId, required this.userId,
  }) : super(key: key);

  @override
  State<GroupInfo> createState() => _GroupInfoState();
}

class _GroupInfoState extends State<GroupInfo> {
  Stream? members;
  @override
  void initState() {
    // getMembers();
    super.initState();
  }

  // getMembers() async {
  //   DatabaseService(uid: FirebaseAuth.instance.currentUser!.uid)
  //       .getGroupMembers(widget.groupId)
  //       .then((val) {
  //     setState(() {
  //       members = val;
  //     });
  //   });
  // }

  String getName(String r) {
    return r.substring(r.indexOf("_") + 1);
  }

  String getId(String res) {
    return res.substring(0, res.indexOf("_"));
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
         BlocProvider(
            create: (context) => ListUserGroupChatBloc(
                RepositoryProvider.of<GroupChatService>(context))
              ..add(LoadListUserGroupChatEvent(groupId: widget.groupId))),
       
      ],
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: greenALS,
          title: const Text("Thông tin"),
          actions: <Widget>[
            BlocBuilder<GroupchatBloc, GroupchatState>(
              builder: (context, state) {
                return IconButton(
                  icon: Icon(Icons.logout),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return Scaffold(
                          backgroundColor: Colors.transparent,
                          body: AlertDialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            buttonPadding: EdgeInsets.all(10.0),
                            contentPadding: EdgeInsets.all(30.0),
                            title: Text(
                              'Xác nhận',
                              style: TextStyle(
                                  fontSize: 21.0, fontWeight: FontWeight.bold),
                            ),
                            content: Text(
                              'Bạn có muốn rời khỏi nhóm?',
                              style: TextStyle(fontSize: 19.0),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  
                                  Navigator.pop(context);
                                },
                                child: Text('HỦY'),
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.red),
                                onPressed: () {
                                  // context.read<RemoveRecordBloc>().add(
                                  //     RemoveRecordEvent.getRecordId(widget
                                  //         .references[index].recordId
                                  //         .toString()));
                                  // context.read<RemoveRecordBloc>().add(
                                  //     RemoveRecordEvent.removeRecordRequest());
                                   removeMember(widget.groupId, widget.userId);
                                 
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  'XÓA',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  color: Colors.white,
                );
              },
            ),
          ],
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: greenALS.withOpacity(0.1)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Theme.of(context).primaryColor,
                      child: Text(
                        widget.groupName.substring(0, 1).toUpperCase(),
                        style: const TextStyle(
                            fontWeight: FontWeight.w500, color: Colors.white),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Column(
                      children: [
                        Text(
                          "Nhóm: ${widget.groupName}",
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 22.0),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text("Chủ nhóm: ${getName(widget.adminName)}")
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Divider(
                height: 5,
                indent: 20,
                endIndent: 20,
                thickness: 3,
              ),
              BlocBuilder<ListUserGroupChatBloc, ListUserGroupChatState>(
                builder: (context, state) {
                  if (state is UserGroupChatLoadedState) {
                    return ListView.builder(
                      itemCount: state.list1.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return CustomListUserGroupChat(
                            listGetAllUserInGroupChat: state.list1[index]);
                      },
                    );
                  }
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
  void removeMember(String groupId, String userId){
     context.read<GroupchatBloc>().add(GroupchatEvent.RemovedMemberInGroupChatRequest(widget.groupId, widget.userId));
  }
}
