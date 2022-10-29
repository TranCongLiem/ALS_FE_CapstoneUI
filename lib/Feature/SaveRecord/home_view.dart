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

class _HomeViewRecordState extends State<HomeViewRecord>
    with TickerProviderStateMixin {
  List<Reference> references = [];
  @override
  void initState() {
    super.initState();
    _onUploadComplete();
  }

  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 2, vsync: this);
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
                body: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          ButtonCreateRecord(),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 18.0),
                            child: Card(
                              margin: EdgeInsets.only(left: 80.0),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12)),
                              elevation: 5,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: TabBar(
                                  indicator: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: greenALS),
                                  controller: tabController,
                                  isScrollable: true,
                                  labelPadding:
                                      EdgeInsets.symmetric(horizontal: 30),
                                  tabs: [
                                    Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: Tab(
                                        child: Text(
                                          "Mẫu",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 26.0),
                                        ),
                                      ),
                                    ),
                                    Tab(
                                      child: Text(
                                        "Thêm",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 26.0),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                              child: TabBarView(
                                  controller: tabController,
                                  children: [
                                CloudRecordListView(
                                  references: references,
                                ),
                                references.isEmpty
                                    ? Center(
                                        child: Text('Chưa có bản ghi âm nào'),
                                      )
                                    : CloudRecordListView(
                                        references: references,
                                      ),
                              ])),
                        ]),
                  ),
                ),
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

  Widget ExampleRecWidget() {
    return Expanded(
      // height: size.height / 3.5,
      // width: size.width,
      child: references.isEmpty
          ? Center(
              child: Text('Chưa có bản ghi âm nào'),
            )
          : CloudRecordListView(
              references: references,
            ),
    );
  }

  Widget UserRecWidget() {
    return Expanded(
      // height: size.height / 3.5,
      // width: size.width,
      child: references.isEmpty
          ? Center(
              child: Text('Chưa có bản ghi âm nào'),
            )
          : CloudRecordListView(
              references: references,
            ),
    );
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
