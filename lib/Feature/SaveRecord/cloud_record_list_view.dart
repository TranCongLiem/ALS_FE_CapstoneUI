import 'package:audioplayers/audioplayers.dart';
import 'package:capstone_ui/Bloc/remove_record/remove_record_bloc.dart';
import 'package:capstone_ui/Constant/constant.dart';
import 'package:capstone_ui/Model/getListRecordById_model.dart';
import 'package:capstone_ui/services/api_ShortCutNotification.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../Bloc/pushnotisupporter/push_noti_to_supporter_bloc.dart';
import '../../Model/CreatePushNotiToSupporter_model.dart';
import 'home_view.dart';

class CloudRecordListView extends StatefulWidget {
  final List<RecordById> references;
  final String userId;
  const CloudRecordListView(
      {Key? key, required this.references, required this.userId})
      : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CloudRecordListViewState createState() => _CloudRecordListViewState();
}

class _CloudRecordListViewState extends State<CloudRecordListView> {
  var list_tes = [
    '/upload-voice-firebase/1663767506989.acc',
    '/upload-voice-firebase/1663767506989.acc',
    '/upload-voice-firebase/1663767506989.acc',
    '/upload-voice-firebase/1663767506989.acc'
  ];

  late bool isPlaying;
  late AudioPlayer audioPlayer;
  int? selectedIndex;
  TextEditingController _textFieldController = TextEditingController();
  String valueText = '';
  String codeDialog = '';
  @override
  void initState() {
    super.initState();
    isPlaying = false;
    audioPlayer = AudioPlayer();
    selectedIndex = -1;
    _textFieldController.text = '';
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    audioPlayer.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RemoveRecordBloc, RemoveRecordState>(
      listener: (context, state) {
        if (state.isRemoved) {
          Navigator.pushAndRemoveUntil(
            context,
            PageRouteBuilder(
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                return ScaleTransition(
                  alignment: Alignment.center,
                  scale: Tween<double>(begin: 0.1, end: 1).animate(
                    CurvedAnimation(
                      parent: animation,
                      curve: Curves.bounceIn,
                    ),
                  ),
                  child: child,
                );
              },
              transitionDuration: Duration(seconds: 1),
              pageBuilder: (BuildContext context, Animation<double> animation,
                  Animation<double> secondaryAnimation) {
                context
                    .read<RemoveRecordBloc>()
                    .add(RemoveRecordEvent.setStateFlase());
                return HomeViewRecord();
              },
            ),
            (Route<dynamic> route) => false,
          );
        }
      },
      builder: (context, state) {
        return SafeArea(
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                scrollDirection: Axis.vertical,
                itemCount: widget.references.length,
                itemBuilder: (BuildContext context, int index) {
                  //return CustomRecordList(widget.references[index], context , selectedIndex);
                  return Card(
                    clipBehavior: Clip.antiAlias,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    elevation: 3,
                    margin: const EdgeInsets.all(5),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  margin: EdgeInsets.symmetric(vertical: 1.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            color: Colors.grey[300]!
                                                .withOpacity(0.5),
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(30),
                                                bottomLeft: Radius.circular(30),
                                                bottomRight:
                                                    Radius.circular(30),
                                                topRight: Radius.circular(30))),
                                        child: IconButton(
                                          onPressed: () {
                                            _textFieldController.text = widget
                                                    .references[index]
                                                    .recordName ??
                                                '';
                                            showDialog(
                                                context: context,
                                                builder: (context) {
                                                  return BlocProvider(
                                                    create: (BuildContext
                                                            context) =>
                                                        PushNotiToSupporterBloc(
                                                            RepositoryProvider
                                                                .of<ShortCutNotificationService>(
                                                                    context)),
                                                    child: AlertDialog(
                                                      scrollable: true,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15.0),
                                                      ),
                                                      buttonPadding:
                                                          EdgeInsets.all(15.0),
                                                      contentPadding:
                                                          EdgeInsets.all(30.0),
                                                      title: Text(
                                                        'Mô tả thông tin trợ giúp',
                                                        style: TextStyle(
                                                            fontSize: 23,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                      content: TextField(
                                                        controller:
                                                            _textFieldController,
                                                        decoration:
                                                            InputDecoration(
                                                                hintText:
                                                                    "Nhập mô tả"),
                                                        style: TextStyle(
                                                            fontSize: 22),
                                                      ),
                                                      actions: <Widget>[
                                                        TextButton(
                                                          child: Text('HỦY',
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      22)),
                                                          onPressed: () {
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                        ),
                                                        BlocBuilder<
                                                            PushNotiToSupporterBloc,
                                                            PushNotiToSupporterState>(
                                                          builder:
                                                              (context, state) {
                                                            // if (state
                                                            //     is PushNotiToSupporterBlocInitial) {
                                                            return ElevatedButton(
                                                              style: ElevatedButton.styleFrom(
                                                                  backgroundColor: Colors
                                                                      .green
                                                                      .withOpacity(
                                                                          0.7)),
                                                              child: Text('GỬI',
                                                                  style: TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontSize:
                                                                          22.0)),
                                                              onPressed: () {
                                                                BlocProvider.of<
                                                                            PushNotiToSupporterBloc>(
                                                                        context)
                                                                    .add(PushNotiToSupporterByRequestEvent(
                                                                        createPushNotificationRequestModel: CreatePushNotificationRequestModel(
                                                                            senderId:
                                                                                widget.userId,
                                                                            title: _textFieldController.text)));
                                                                // if (state
                                                                //     is PushNotiToSupporterErrorState) {
                                                                //   ScaffoldMessenger.of(
                                                                //           context)
                                                                //       .showSnackBar(
                                                                //           SnackBar(
                                                                //     content: Text(state
                                                                //             .createPushNotificationResponeModel
                                                                //             .message ??
                                                                //         'Gửi thông báo cho supporter thất bại'),
                                                                //   ));
                                                                // }

                                                                Navigator.pop(
                                                                    context);
                                                                Fluttertoast.showToast(
                                                                    msg:
                                                                        'Gửi thành công',
                                                                    backgroundColor:
                                                                        greenALS,
                                                                    fontSize:
                                                                        18.0);
                                                              },
                                                            );
                                                            if (state
                                                                is PushNotiToSupporterErrorState) {
                                                              // showDialog(
                                                              //   context:
                                                              //       context,
                                                              //   builder:
                                                              //       (context) {
                                                              //     return AlertDialog(
                                                              //       // Retrieve the text the that user has entered by using the
                                                              //       // TextEditingController.
                                                              //       content: Text(
                                                              //           "Cann't send notification for Supporter"),
                                                              //     );
                                                              //   },
                                                              // );

                                                              //   ShowDialogError(
                                                              //       context,
                                                              //       state.createPushNotificationResponeModel
                                                              //               .message ??
                                                              //           'Can not send notification for Supporter');
                                                              // }
                                                              ScaffoldMessenger
                                                                      .of(
                                                                          context)
                                                                  .showSnackBar(
                                                                      SnackBar(
                                                                content: Text(state
                                                                        .createPushNotificationResponeModel
                                                                        .message ??
                                                                    'Gửi thông báo cho supporter thất bại'),
                                                              ));
                                                            }
                                                            return Center(
                                                              child:
                                                                  CircularProgressIndicator(),
                                                            );
                                                          },
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                });
                                          },
                                          icon: Icon(
                                            Icons.notifications,
                                            color: Colors.amber[800]!
                                                .withOpacity(0.6),
                                            size: 30.0,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      color: Color.fromARGB(95, 177, 23, 23),
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(30),
                                          bottomLeft: Radius.circular(30),
                                          bottomRight: Radius.circular(30),
                                          topRight: Radius.circular(30))),
                                  child: IconButton(
                                    icon: Icon(Icons.delete),
                                    onPressed: () {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return Scaffold(
                                            backgroundColor: Colors.transparent,
                                            body: AlertDialog(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(15.0),
                                              ),
                                              buttonPadding:
                                                  EdgeInsets.all(15.0),
                                              contentPadding:
                                                  EdgeInsets.all(30.0),
                                              title: Text(
                                                'Xác nhận',
                                                style: TextStyle(
                                                    fontSize: 23.0,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              content: Text(
                                                'Bạn có muốn xóa bản ghi?',
                                                style:
                                                    TextStyle(fontSize: 20.0),
                                              ),
                                              actions: [
                                                TextButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: Text(
                                                    'HỦY',
                                                    style:
                                                        TextStyle(fontSize: 22),
                                                  ),
                                                ),
                                                ElevatedButton(
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                          backgroundColor:
                                                              Colors.red),
                                                  onPressed: () {
                                                    context
                                                        .read<
                                                            RemoveRecordBloc>()
                                                        .add(RemoveRecordEvent
                                                            .getRecordId(widget
                                                                .references[
                                                                    index]
                                                                .recordId
                                                                .toString()));
                                                    context
                                                        .read<
                                                            RemoveRecordBloc>()
                                                        .add(RemoveRecordEvent
                                                            .removeRecordRequest());
                                                    Navigator.pop(context);
                                                    Fluttertoast.showToast(
                                                        msg: 'Xóa thành công',
                                                        backgroundColor:
                                                            greenALS,
                                                        fontSize: 18.0);
                                                  },
                                                  child: Text(
                                                    'XÓA',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 22.0),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      );
                                    },
                                    color: Colors.white,
                                  ),
                                ),
                              ]),
                          Container(
                              alignment: Alignment.center,
                              child: ElevatedButton.icon(
                                  onPressed: () {
                                    _onListTileButtonPressed(
                                        widget.references[index],
                                        index,
                                        widget.userId);
                                  },
                                  icon: selectedIndex == index
                                      ? Icon(Icons.pause, size: 80.0)
                                      : Icon(
                                          Icons.play_circle,
                                          size: 80.0,
                                        ),
                                  label: Text(''),
                                  style: ElevatedButton.styleFrom(
                                    shape: CircleBorder(),
                                    padding: EdgeInsets.only(left: 7),
                                    backgroundColor: greenALS,
                                  ))),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          Text(
                            widget.references[index].recordName ?? '',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 23.0,
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }));
      },
    );
  }

  Future<void> _onListTileButtonPressed(
      RecordById recordById, int index, String userId) async {
    if (selectedIndex == index) {
      setState(() {
        audioPlayer.stop();
        isPlaying = false;
        selectedIndex = -1;
      });
    } else {
      setState(() {
        selectedIndex = index;
        isPlaying = true;
        audioPlayer.stop();
      });
      Reference pathReference = FirebaseStorage.instance
          .ref()
          .child('upload-voice-firebase')
          .child(userId)
          .child(recordById.linkAudio ?? '');
      audioPlayer.play(await pathReference.getDownloadURL(), isLocal: false);
      audioPlayer.onPlayerCompletion.listen((duration) {
        setState(() {
          isPlaying = false;
          selectedIndex = -1;
        });
      });
    }
    // await audioPlayer.stop();
  }

  void ShowDialogError(BuildContext context, String errorText) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          // Retrieve the text the that user has entered by using the
          // TextEditingController.
          content: Text(errorText),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('HỦY'),
            ),
          ],
        );
      },
    );
  }
}
