import 'package:audioplayers/audioplayers.dart';
import 'package:capstone_ui/Constant/constant.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import '../../Components/Feature/Excerise/SaveRecord/category_list_savevoice.dart';
import 'catalog.dart';

class CloudRecordListView extends StatefulWidget {
  final List<Reference> references;
  const CloudRecordListView({
    Key? key,
    required this.references,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CloudRecordListViewState createState() => _CloudRecordListViewState();
}

class _CloudRecordListViewState extends State<CloudRecordListView> {
  bool? isPlaying;
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
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: widget.references.length,
        reverse: true,
        primary: false,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            elevation: 5,
            margin: const EdgeInsets.all(10),
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Ink.image(
                        height: 150,
                        width: 150,
                        fit: BoxFit.cover,
                        child: InkWell(
                          onTap: () {},
                        ),
                        image: NetworkImage(
                            'https://cdn1.iconfinder.com/data/icons/video-production-butterscotch-vol-2/256/Microphone-512.png')),
                    ElevatedButton.icon(
                        onPressed: () => _onListTileButtonPressed(index),
                        icon: selectedIndex == index
                            ? Icon(Icons.pause, size: 60.0)
                            : Icon(
                                Icons.play_circle,
                                size: 60.0,
                              ),
                        label: Text(''),
                        style: ElevatedButton.styleFrom(
                          shape: CircleBorder(),
                          padding: EdgeInsets.only(left: 7),
                          //backgroundColor: greenALS,
                        ))
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Đọc sách',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 24.0,
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }

  Future<void> _onListTileButtonPressed(int index) async {
    setState(() {
      selectedIndex = index;
    });
    audioPlayer.play(await widget.references.elementAt(index).getDownloadURL(),
        isLocal: false);

    audioPlayer.onPlayerCompletion.listen((duration) {
      setState(() {
        selectedIndex = -1;
      });
    });
  }
}
