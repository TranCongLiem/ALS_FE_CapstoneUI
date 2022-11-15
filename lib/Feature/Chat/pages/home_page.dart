import 'dart:async';
import 'dart:io';
import 'package:capstone_ui/Bloc/authenticate/authenticate_bloc.dart';
import 'package:capstone_ui/Feature/Chat/pages/search.dart';
import 'package:capstone_ui/services/api_chat.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:search_helper/search_helper.dart';
import '../../../Bloc/chat/chat_bloc.dart';
import '../../../Model/getListChat_model.dart';
import '../constants/app_constants.dart';
import '../constants/color_constants.dart';
import '../constants/firestore_constants.dart';
import '../controller/data_controller.dart';
import '../models/models.dart';
import '../providers/home_provider.dart';
import '../utils/debouncer.dart';
import '../utils/utilities.dart';
import '../widgets/widgets.dart';
import 'pages.dart';
import 'package:get/get.dart';
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
  Debouncer searchDebouncer = Debouncer(milliseconds: 300);
  StreamController<bool> btnClearController = StreamController<bool>();
  TextEditingController searchBarTec = TextEditingController();

  @override
  void initState() {
    super.initState();
    homeProvider = context.read<HomeProvider>();
    registerNotification();
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
                    if(snapshot.hasData){
                      return ListView.builder(
                        itemCount: data?.length,
                        itemBuilder: (context, index) {
                          if (!snapshot.hasData) {
                            return Center(child: CircularProgressIndicator());
                          }
                          return Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ListTile(
                                title: Row(
                                  children: [
                                    Container(
                                      width: 60,
                                      height: 60,
                                      decoration: BoxDecoration(
                                        color: Colors.deepPurpleAccent,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Center(
                                        child: 
                                        // Text(
                                        //   '${data?[index].fullName}',
                                        //   style: TextStyle(
                                        //       fontSize: 20,
                                        //       fontWeight: FontWeight.bold,
                                        //       color: Colors.white),
                                        // ),
                                        Image.network(
                         '${data?[index].imageUser}',
                          fit: BoxFit.cover,
                          width: 50,
                          height: 50,
                          loadingBuilder: (BuildContext context, Widget child,
                              ImageChunkEvent? loadingProgress) {
                            if (loadingProgress == null) return child;
                            return Container(
                              width: 50,
                              height: 50,
                              child: Center(
                                child: CircularProgressIndicator(
                                  color: ColorConstants.themeColor,
                                  value: loadingProgress.expectedTotalBytes !=
                                          null
                                      ? loadingProgress.cumulativeBytesLoaded /
                                          loadingProgress.expectedTotalBytes!
                                      : null,
                                ),
                              ),
                            );
                          },
                          errorBuilder: (context, object, stackTrace) {
                            return Icon(
                              Icons.account_circle,
                              size: 50,
                              color: ColorConstants.greyColor,
                            );
                          },
                        )
                                      ),
                                    ),
                                    SizedBox(width: 20),
                                    Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            '${data?[index].fullName}',
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          SizedBox(height: 10),
                                          
                                        ])
                                  ],
                                ),
                                // trailing: Text('More Info'),
                              ),
                            ),
                          );
                        });
                    } else{
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

  //   return BlocBuilder<AuthenticateBloc, AuthenticateState>(
  //     builder: (context2, state2) {
  //       return BlocProvider(
  //         create: (context) =>
  //             ChatBloc(RepositoryProvider.of<ChatService>(context))
  //               ..add(LoadChatEvent(userId: state2.userId)),
  //         child: Scaffold(
  //           appBar: AppBar(
  //             title: Text(
  //               AppConstants.homeTitle,
  //               style: TextStyle(color: ColorConstants.primaryColor),
  //             ),
  //             centerTitle: true,
  //           ),
  //           body: SafeArea(
  //             child: WillPopScope(
  //               onWillPop: () async {
  //                 return true;
  //               },
  //               child: Stack(
  //                 children: <Widget>[
  //                   // List
  //                   Column(
  //                     children: [
  //                       buildSearchBar(),
  //                       Expanded(child: BlocBuilder<ChatBloc, ChatState>(
  //                         builder: (context, state) {
  //                           if (state is ChatLoadedState) {
  //                             return ListView.builder(
  //                                 itemCount: state.list.length,
  //                                 itemBuilder: (context, index) {
  //                                    ListChat data = state.list[index];
  //                                   if (_textSearch.isEmpty) {
  //                                     return InkWell(
  //                                       onTap: () {
  //                                         if (Utilities.isKeyboardShowing()) {
  //                                           Utilities.closeKeyboard(context);
  //                                         }
  //                                         Navigator.push(
  //                                           context,
  //                                           MaterialPageRoute(
  //                                            builder: (context) => ChatPage(
  //                                               arguments: ChatPageArguments(
  //                                                 peerId: state
  //                                                     .list[index].userId
  //                                                     .toString(),
  //                                                 peerAvatar: state
  //                                                     .list[index].imageUser
  //                                                     .toString(),
  //                                                 peerNickname: state
  //                                                     .list[index].fullName
  //                                                     .toString(),
  //                                               ),
  //                                               userId: currentUserId,
  //                                             ),
  //                                           ),
  //                                         );
  //                                       },
  //                                       child: ListTile(
  //                                         title: Text(
  //                                           data.fullName.toString(),
  //                                           maxLines: 1,
  //                                           overflow: TextOverflow.ellipsis,
  //                                           style: TextStyle(
  //                                               color: Colors.black54,
  //                                               fontSize: 16,
  //                                               fontWeight: FontWeight.bold),
  //                                         ),
  //                                         leading: CircleAvatar(
  //                                           backgroundImage: NetworkImage(
  //                                               state.list[index].imageUser ??
  //                                                   ''),
  //                                         ),
  //                                       ),
  //                                     );
  //                                   }
  //                                   if (data.fullName
  //                                       .toString()
  //                                       .toLowerCase()
  //                                       .startsWith(_textSearch)) {
  //                                     return InkWell(
  //                                       onTap: () {
  //                                         if (Utilities.isKeyboardShowing()) {
  //                                           Utilities.closeKeyboard(context);
  //                                         }
  //                                         Navigator.push(
  //                                           context,
  //                                           MaterialPageRoute(
  //                                             builder: (context) => ChatPage(
  //                                               arguments: ChatPageArguments(
  //                                                 peerId: state
  //                                                     .list[index].userId
  //                                                     .toString(),
  //                                                 peerAvatar: state
  //                                                     .list[index].imageUser
  //                                                     .toString(),
  //                                                 peerNickname: state
  //                                                     .list[index].fullName
  //                                                     .toString(),
  //                                               ),
  //                                               userId: currentUserId,
  //                                             ),
  //                                           ),
  //                                         );
  //                                       },
  //                                       child: ListTile(
  //                                         title: Text(
  //                                           data.fullName
  //                                               .toString(),
  //                                           maxLines: 1,
  //                                           overflow: TextOverflow.ellipsis,
  //                                           style: TextStyle(
  //                                               color: Colors.black54,
  //                                               fontSize: 16,
  //                                               fontWeight: FontWeight.bold),
  //                                         ),
  //                                         leading: CircleAvatar(
  //                                           backgroundImage: NetworkImage(data.imageUser
  //                                               .toString()),
  //                                         ),
  //                                       ),
  //                                     );
  //                                   }
  //                                   return Container();
  //                                 }
  //                                 // controller: listScrollController,
  //                                 );
  //                           }
  //                           return Center(
  //                             child: CircularProgressIndicator(),
  //                           );
  //                         },
  //                       )),
  //                     ],
  //                   ),

  //                   // Loading
  //                   Positioned(
  //                     child: isLoading ? LoadingView() : SizedBox.shrink(),
  //                   )
  //                 ],
  //               ),
  //             ),
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }

                            // stream: homeProvider.getStreamFireStore(
                            //     FirestoreConstants.pathUserCollection,
                            //     _limit,
                            //     _textSearch),
                            // builder: (BuildContext context,
                            //     AsyncSnapshot<QuerySnapshot> snapshot) {
                            //   if (snapshot.hasData) {
                            //     if ((snapshot.data?.docs.length ?? 0) > 0) {
                            //       return ListView.builder(
                            //         padding: EdgeInsets.all(10),
                            //         itemBuilder: (context, index) => buildItem(
                            //             context, snapshot.data?.docs[index]),
                            //         itemCount: snapshot.data?.docs.length,
                            //         controller: listScrollController,
                            //       );
                            //     } else {
                            //       return Center(
                            //         child: Text("No users"),
                            //       );
                            //       // return Expanded(
                            //       //     child: StreamBuilder<QuerySnapshot>(
                            //       //   stream: homeProvider.getStreamFireStore2(
                            //       //       FirestoreConstants.pathUserCollection,
                            //       //       _limit,
                            //       //       _textSearch),
                            //       //   builder: (BuildContext context,
                            //       //       AsyncSnapshot<QuerySnapshot> snapshot2) {
                            //       //     if ((snapshot2.data?.docs.length ?? 0) > 0) {
                            //       //       return ListView.builder(
                            //       //         padding: EdgeInsets.all(10),
                            //       //         itemBuilder: (context, index) => buildItem(
                            //       //             context, snapshot2.data?.docs[index]),
                            //       //         itemCount: snapshot2.data?.docs.length,
                            //       //         controller: listScrollController,
                            //       //       );
                            //       //     } else {
                            //       //       return Center(
                            //       //         child: Text("No users"),
                            //       //       );
                            //       //     }
                            //       //   },
                            //       // ));
                            //     }
                            //   } else {
                            //     return Center(
                            //       child: CircularProgressIndicator(
                            //         color: ColorConstants.themeColor,
                            //       ),
                            //     );
                            //   }
                            // },
}