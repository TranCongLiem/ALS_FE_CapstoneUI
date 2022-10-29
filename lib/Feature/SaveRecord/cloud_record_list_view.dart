import 'package:audioplayers/audioplayers.dart';
import 'package:capstone_ui/Constant/constant.dart';
import 'package:confirm_dialog/confirm_dialog.dart';
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
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: GridView.builder(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        scrollDirection: Axis.vertical,
        itemCount: widget.references.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
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
                        '1',
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Color.fromARGB(155, 177, 23, 23),
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
                                builder: (context) {
                                  return AlertDialog(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0)),
                                    title: Row(children: [
                                      Icon(
                                        Icons.delete_rounded,
                                        color: Colors.red,
                                      ),
                                      SizedBox(width: 10.0),
                                      Text(
                                        'Xác nhận',
                                        style: TextStyle(fontSize: 26.0),
                                      )
                                    ]),
                                    content: Text(
                                      'Bạn có muốn xóa bản ghi?',
                                      style: TextStyle(fontSize: 20.0),
                                    ),
                                    buttonPadding: EdgeInsets.all(20.0),
                                    actions: [
                                      ElevatedButton(
                                          onPressed: () {
                                            setState(() {
                                              Navigator.of(context).pop();
                                            });
                                          },
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.red),
                                          child: Text('Xóa',
                                              style:
                                                  TextStyle(fontSize: 20.0))),
                                      ElevatedButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.black12),
                                          child: Text('Hủy',
                                              style: TextStyle(fontSize: 20.0)))
                                    ],
                                  );
                                });
                          },
                          color: Colors.white,
                        ),
                      ),
                    ],
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
                          onPressed: () => _onListTileButtonPressed(index),
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
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Đọc sách',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black54,
                        fontSize: 26.0,
                      ),
                    ),
                  ),
                ],
              ),
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
