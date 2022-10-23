import 'package:capstone_ui/Components/Feature/Excerise/SaveRecord/category_list_savevoice.dart';
import 'package:capstone_ui/Constant/constant.dart';
import 'package:sizer/sizer.dart';
import 'package:capstone_ui/Feature/SaveRecord/SaveRecording.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import 'cloud_record_list_view.dart';

class HomeViewRecord extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _HomeViewRecordState createState() => _HomeViewRecordState();
}

class _HomeViewRecordState extends State<HomeViewRecord> {
  List<Reference> references = [];
  @override
  void initState() {
    super.initState();
    _onUploadComplete();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Sizer(builder: (context, orientation, deviceType) {
      return SizerUtil.deviceType == DeviceType.mobile
          // ignore: sized_box_for_whitespace
          ? Container(
              width: 100.w,
              height: 20.5.h,
              child: Scaffold(
                appBar: AppBar(
                    title: Text('Hỗ trợ ghi âm'),
                    backgroundColor: greenALS,
                    centerTitle: true,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20.0),
                            bottomRight: Radius.circular(20.0)))),
                body: Stack(children: [
                  Container(
                    child: SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            ButtonCreateRecord(),
                            Padding(
                              padding: const EdgeInsets.only(top: 15),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Danh sách',
                                    style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  Text(
                                    'Xem tất cả',
                                    style: TextStyle(
                                      color: Colors.blueAccent,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              // height: size.height / 3.5,
                              // width: size.width,
                              child: references.isEmpty
                                  ? Center(
                                      child: Text('Chưa có bản ghi âm nào'),
                                    )
                                  : CloudRecordListView(
                                      references: references,
                                    ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 15),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Mẫu ghi sẵn',
                                    style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  Text(
                                    'Xem tất cả',
                                    style: TextStyle(
                                      color: Colors.blueAccent,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: size.height / 3.5,
                              width: 600,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: 5,
                                reverse: true,
                                primary: false,
                                shrinkWrap: true,
                                itemBuilder: (BuildContext context, int index) {
                                  return Card(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0)),
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
                                                onPressed: () {},
                                                icon: Icon(Icons.play_arrow,
                                                    size: 60.0),
                                                label: Text(''),
                                                style: ElevatedButton.styleFrom(
                                                  shape: CircleBorder(),
                                                  padding:
                                                      EdgeInsets.only(left: 7),
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
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ]),
              ))
          : Container(
              width: 100.w,
              height: 12.5.h,
              child: Scaffold(
                  body: Stack(
                children: <Widget>[
                  SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                            child: GridView.count(
                              crossAxisCount: 2,
                              childAspectRatio: .85,
                              crossAxisSpacing: 20,
                              mainAxisSpacing: 20,
                              children: <Widget>[
                                CategoryListSaveRecord(
                                  name: "Tập thể dục",
                                  svgSrc:
                                      'https://media.istockphoto.com/photos/asian-mother-and-daughters-picture-id1356124817?s=612x612',
                                  press: () {},
                                ),
                                CategoryListSaveRecord(
                                  name: "Tập thể dục",
                                  svgSrc:
                                      'https://media.istockphoto.com/photos/asian-mother-and-daughters-picture-id1356124817?s=612x612',
                                  press: () {},
                                ),
                                CategoryListSaveRecord(
                                  name: "Tập thể dục",
                                  svgSrc:
                                      'https://media.istockphoto.com/photos/asian-mother-and-daughters-picture-id1356124817?s=612x612',
                                  press: () {},
                                ),
                                CategoryListSaveRecord(
                                  name: "Tập thể dục",
                                  svgSrc:
                                      'https://media.istockphoto.com/photos/asian-mother-and-daughters-picture-id1356124817?s=612x612',
                                  press: () {},
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              )));
    });
  }

  Future<void> _onUploadComplete() async {
    FirebaseStorage firebaseStorage = FirebaseStorage.instance;
    ListResult listResult =
        await firebaseStorage.ref().child('upload-voice-firebase').list();
    setState(() {
      references = listResult.items;
    });
    setState(() {});
  }
}

class ButtonCreateRecord extends StatelessWidget {
  const ButtonCreateRecord({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        alignment: Alignment.center,
        child: ElevatedButton.icon(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SaveRecording()));
          },
          label: Text(
            'Tạo bản ghi',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          icon: Icon(Icons.add),
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
            elevation: MaterialStateProperty.resolveWith<double>(
                (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed) ||
                  (states.contains(MaterialState.disabled))) {
                return 0;
              }
              return 5;
            }),
            padding: MaterialStateProperty.resolveWith<EdgeInsetsGeometry>(
              (Set<MaterialState> states) {
                return EdgeInsets.all(10);
              },
            ),
          ),
        ),
      ),
    );
  }
}

Widget buildImageCard() => SingleChildScrollView(
      child: Row(
        children: [
          Card(
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
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
                          'https://media.istockphoto.com/photos/asian-mother-and-daughters-picture-id1356124817?s=612x612',
                        )),
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: Icon(
                        Icons.play_arrow_rounded,
                        size: 30.0,
                      ),
                      label: Text(''),
                      style: ElevatedButton.styleFrom(
                        shape: CircleBorder(),
                        padding: EdgeInsets.all(15),
                        backgroundColor: greenALS,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Tập thể dục',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 24.0,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
