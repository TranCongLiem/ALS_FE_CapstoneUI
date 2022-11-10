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

class CloudRecordListView extends StatefulWidget {
  //final List<Reference> references;
  final List<RecordById> references;
  const CloudRecordListView({
    Key? key,
    required this.references,
  }) : super(key: key);

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
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 3.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ElevatedButton(
                                  onPressed: () {},
                                  child: Text(
                                    'GỬI TRỢ GIÚP',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                          greenALS.withOpacity(0.5)),
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
                                      context.read<RemoveRecordBloc>().add(
                                          RemoveRecordEvent.getRecordId(widget
                                              .references[index].recordId
                                              .toString()));
                                      context.read<RemoveRecordBloc>().add(
                                          RemoveRecordEvent
                                              .removeRecordRequest());
                                    },
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                              alignment: Alignment.center,
                              child: ElevatedButton.icon(
                                  onPressed: () {
                                    _onListTileButtonPressed(
                                        widget.references[index], index);
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
                            height: 8.0,
                          ),
                          Text(
                            widget.references[index].recordName ?? '',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 18.0,
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
      RecordById recordById, int index) async {
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
}
