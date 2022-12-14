import 'package:audioplayers/audioplayers.dart';
import 'package:capstone_ui/Bloc/record/record_bloc.dart';
import 'package:capstone_ui/Bloc/remove_record/remove_record_bloc.dart';
import 'package:capstone_ui/Constant/constant.dart';
import 'package:capstone_ui/Feature/Newsfeed/newfeeds.dart';
import 'package:capstone_ui/Feature/SaveRecord/Category_List_Record/custom_record_list.exercise.dart';
import 'package:capstone_ui/Model/getListRecordById_model.dart';
import 'package:capstone_ui/services/api_Record.dart';
import 'package:confirm_dialog/confirm_dialog.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Components/Feature/Excerise/SaveRecord/category_list_savevoice.dart';
import 'catalog.dart';
import 'home_view.dart';

class CloudRecordListViewAdmin extends StatefulWidget {
  //final List<Reference> references;
  final List<RecordById> references;
  final String userId;
  const CloudRecordListViewAdmin(
      {Key? key, required this.references, required this.userId})
      : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CloudRecordListViewAdminState createState() =>
      _CloudRecordListViewAdminState();
}

class _CloudRecordListViewAdminState extends State<CloudRecordListViewAdmin> {
  late bool isPlaying;
  late AudioPlayer audioPlayer;
  int? selectedIndex;
  @override
  void initState() {
    super.initState();
    isPlaying = false;
    audioPlayer = AudioPlayer();
    selectedIndex = -1;
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
                              Text(
                                '',
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: Color.fromARGB(95, 177, 23, 23),
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(30),
                                        bottomLeft: Radius.circular(30),
                                        bottomRight: Radius.circular(30),
                                        topRight: Radius.circular(30))),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              Ink.image(
                                  height: 80,
                                  width: 80,
                                  fit: BoxFit.cover,
                                  child: InkWell(
                                    onTap: () {},
                                  ),
                                  image: NetworkImage(
                                      'https://cdn1.iconfinder.com/data/icons/video-production-butterscotch-vol-2/256/Microphone-512.png')),
                              ElevatedButton.icon(
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
                                  ))
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          Text(
                            widget.references[index].recordName ?? '',
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
    // await audioPlayer.stop();
    setState(() {
      selectedIndex = index;
      isPlaying = true;
    });
    Reference pathReference = FirebaseStorage.instance
        .ref()
        .child('upload-voice-firebase')
        .child(recordById.linkAudio ?? '');
    audioPlayer.stop();
    audioPlayer.play(await pathReference.getDownloadURL(), isLocal: false);
    audioPlayer.onPlayerCompletion.listen((duration) {
      setState(() {
        isPlaying = false;
        selectedIndex = -1;
      });
    });
  }
}
