import 'dart:async';
import 'dart:io';
import 'package:capstone_ui/Bloc/authenticate/authenticate_bloc.dart';
import 'package:capstone_ui/Feature/Chat/pages/search.dart';
import 'package:capstone_ui/services/api_chat.dart';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../Bloc/user_chat/user_chat_bloc.dart';
import '../../../Model/getListChat_model.dart';

import '../constants/color_constants.dart';
import '../constants/firestore_constants.dart';

import '../providers/home_provider.dart';
import '../utils/debouncer.dart';

import 'package:timeago/timeago.dart' as timeago;

import '../utils/utilities.dart';
import 'chat_page.dart';

class HomePage extends StatefulWidget {
  final String userId;
  HomePage({Key? key, required this.userId}) : super(key: key);

  @override
  State createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  HomePageState({Key? key});
  late ChatService _userList = ChatService();
  final FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;

  late String currentUserId = widget.userId;
  late HomeProvider homeProvider;
  late List<ListChat> list;
  late bool? hasSeen;
  Debouncer searchDebouncer = Debouncer(milliseconds: 300);
  StreamController<bool> btnClearController = StreamController<bool>();
  TextEditingController searchBarTec = TextEditingController();

  @override
  void initState() {
    super.initState();
    homeProvider = context.read<HomeProvider>();
    registerNotification();
    hasSeen = true;
  }

  @override
  void dispose() {
    super.dispose();
    btnClearController.close();
  }

  void registerNotification() {
    firebaseMessaging.requestPermission();

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('onMessage: $message');

      return;
    });

    firebaseMessaging.getToken().then((token) {
      print('push token: $token');
      if (token != null) {
        homeProvider.updateDataFirestore(FirestoreConstants.pathUserCollection,
            currentUserId, {'pushToken': token});
      }
    }).catchError((err) {
      Fluttertoast.showToast(msg: err.message.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticateBloc, AuthenticateState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              title: Text('UserList'),
              actions: [
                IconButton(
                  onPressed: () {
                    showSearch(context: context, delegate: SearchUser());
                  },
                  icon: Icon(Icons.search_sharp),
                )
              ],
            ),
            body: Container(
              padding: EdgeInsets.all(20),
              child: FutureBuilder<List<ListChat>>(
                  future: _userList.getAllChat(state.userId, query: null),
                  builder: (context, snapshot) {
                    var data = snapshot.data;
                    if (snapshot.hasData) {
                      return ListView.builder(
                          itemCount: data?.length,
                          itemBuilder: (context, index) {
                            DateTime time = DateTime.parse(data?[index].updateAt ?? '');
                            timeago.setLocaleMessages(
                                'vi', timeago.ViMessages());
                            if (!snapshot.hasData) {
                              return Center(child: CircularProgressIndicator());
                            }
                            return InkWell(
                                onTap: () {
                        if (Utilities.isKeyboardShowing()) {
                          Utilities.closeKeyboard(context);
                        }
                        UpdateHasSeen(state.userId,data?[index].userId ?? '');
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ChatPage(
                              arguments: ChatPageArguments(
                                peerId: data?[index].userId ?? '',
                                peerAvatar: data?[index].imageUser ?? '',
                                peerNickname: data?[index].fullName ?? '',
                              ),
                              userId: state.userId,
                            ),
                          ),
                        );
                      },
                              child: Card(
                                
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ListTile(
                                    title: Row(
                                      children: [
                                        CircleAvatar(
                                          backgroundImage: NetworkImage(
                                              '${data?[index].imageUser}'),
                                          maxRadius: 20,
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
                                                  '${data?[index].fullName}',
                                                  style: TextStyle(fontSize: 16,
                                                   fontWeight:  data?[index].hasSeen == true
                                                          ? FontWeight.normal
                                                          : FontWeight.bold
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 6,
                                                ),
                                                Text(
                                                  data?[index].lastMessage ?? '',
                                                  overflow: TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                      fontSize: 13,
                                                      fontWeight:  data?[index].hasSeen == true
                                                          ? FontWeight.normal
                                                          : FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Text(
                                          timeago.format(time, locale: 'vi'),
                                          style: TextStyle(
                                              fontSize: 12,
                                             
                                              fontWeight: data?[index].hasSeen == true
                                                  ? FontWeight.normal
                                                  : FontWeight.bold),
                                              
                                        ),
                                      ],
                                    ),
                                    // trailing: Text('More Info'),
                                  ),
                                ),
                              ),
                            );
                          });
                    } else {
                      return Center(
                        child: CircularProgressIndicator(
                          color: ColorConstants.themeColor,
                        ),
                      );
                    }
                  }),
            ),
          ),
        );
      },
    );
  }
  Future<void> UpdateHasSeen(String userIdFrom,String userIdTo) async {
    context
        .read<UserChatBloc>()
        .add(UserChatEvent.UpdateHasSeenRequest(userIdFrom, userIdTo));
  }
}
