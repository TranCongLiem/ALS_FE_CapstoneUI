import 'package:capstone_ui/Components/Feature/Excerise/SaveRecord/category_list_savevoice.dart';
import 'package:capstone_ui/Constant/constant.dart';
import 'package:capstone_ui/Feature/SaveRecord/Category_List_Record/afternoon_record.dart';
import 'package:capstone_ui/Feature/SaveRecord/Category_List_Record/morning_record.dart';
import 'package:capstone_ui/Feature/SaveRecord/Category_List_Record/night_record.dart';
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
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text('Hỗ trợ ghi âm'),
            backgroundColor: greenALS,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      child: ElevatedButton.icon(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SaveRecording()));
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
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.green),
                          elevation: MaterialStateProperty.resolveWith<double>(
                              (Set<MaterialState> states) {
                            if (states.contains(MaterialState.pressed) ||
                                (states.contains(MaterialState.disabled))) {
                              return 0;
                            }
                            return 5;
                          }),
                        ),
                      ),
                    ),
                  ),
                  Container(
                      padding: const EdgeInsets.only(top: 15),
                      height: size.height / 3,
                      width: size.width / 1,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          CloudRecordListView(
                            references: references,
                          )
                        ],
                      )),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Container(
                      height: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.yellowAccent,
                      ),
                      child: Row(
                        children: [
                          Center(
                            child: Padding(
                              padding: EdgeInsets.all(10),
                              child: Expanded(
                                child: Image.network(
                                    'https://i.pinimg.com/originals/f4/33/23/f433237bf3869cd6848e24ddc95e0aee.jpg'),
                                flex: 2,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              alignment: Alignment.topLeft,
                              child: Column(
                                children: [
                                  Expanded(
                                    flex: 5,
                                    child: ListTile(
                                      title: Text(
                                        "Gợi ý cho buổi sáng",
                                        style: TextStyle(fontSize: 25.0),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Container(
                      height: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.orangeAccent,
                      ),
                      child: Row(
                        children: [
                          Center(
                            child: Padding(
                              padding: EdgeInsets.all(10),
                              child: Expanded(
                                child: Image.network(
                                    'https://i.pinimg.com/originals/f4/33/23/f433237bf3869cd6848e24ddc95e0aee.jpg'),
                                flex: 2,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              alignment: Alignment.topLeft,
                              child: Column(
                                children: [
                                  Expanded(
                                    flex: 5,
                                    child: ListTile(
                                      title: Text(
                                        "Gợi ý cho buổi trưa",
                                        style: TextStyle(fontSize: 25.0),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.purpleAccent,
                    ),
                    child: Row(
                      children: [
                        Center(
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Expanded(
                              child: Image.network(
                                  'https://cdn.pixabay.com/photo/2016/10/27/16/58/full-moon-1775764_960_720.jpg'),
                              flex: 4,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            alignment: Alignment.topLeft,
                            child: Column(
                              children: [
                                Expanded(
                                  flex: 5,
                                  child: ListTile(
                                    title: Text(
                                      "Gợi ý cho buổi tối",
                                      style: TextStyle(fontSize: 25.0),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}

Widget buildCardRecommend() => Expanded(
        child: Container(
      height: 50,
      width: 200,
      decoration: BoxDecoration(
        color: Colors.green[50],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Image.asset(
            'assets/images/logo_ALS.png',
            width: 100,
          ),
        ],
      ),
    ));
