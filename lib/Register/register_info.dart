import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';
import '../Constant/constant.dart';

class RegisterInfo extends StatefulWidget {
  const RegisterInfo({super.key});

  @override
  State<RegisterInfo> createState() => _RegisterInfoState();
}

class _RegisterInfoState extends State<RegisterInfo> {
  TextEditingController dateOfBirthController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dateOfBirthController.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          height: MediaQuery.of(context).size.height * 0.9,
          padding: EdgeInsets.all(10.0),
          child: ListView(
            children: [
              Container(
                alignment: Alignment.center,
                // padding: EdgeInsets.only(left: 20.0, right: 20.0),
                margin: EdgeInsets.only(top: 20.0, bottom: 30.0),
                child: Text(
                  'HÃY CHO CHÚNG TÔI BIẾT THÊM VỀ BẠN',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Container(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Họ tên',
                            style: TextStyle(
                                fontSize: 22.0, fontWeight: FontWeight.w600),
                          )),
                      TextField(
                        style: TextStyle(fontSize: 24.0, color: Colors.black54),
                        decoration: InputDecoration(
                          hintStyle: TextStyle(color: Colors.blue),
                        ),
                      )
                    ],
                  )),
              Container(
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Container(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Địa chỉ',
                            style: TextStyle(
                                fontSize: 22.0, fontWeight: FontWeight.w600),
                          )),
                      TextField(
                        style: TextStyle(fontSize: 24.0, color: Colors.black54),
                        decoration: InputDecoration(
                          hintStyle: TextStyle(color: Colors.blue),
                        ),
                      )
                    ],
                  )),
              Container(
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Container(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Ngày sinh',
                            style: TextStyle(
                                fontSize: 22.0, fontWeight: FontWeight.w600),
                          )),
                      TextField(
                        readOnly: true,
                        style: TextStyle(fontSize: 24.0, color: Colors.black54),
                        controller: dateOfBirthController,
                        decoration: InputDecoration(
                            hintStyle: TextStyle(color: greenALS),
                            suffixIcon: IconButton(
                              icon: Icon(
                                Icons.calendar_month,
                                size: 35.0,
                              ),
                              onPressed: () {
                                DatePicker.showDatePicker(context,
                                    showTitleActions: true,
                                    minTime: DateTime(1900, 1, 1),
                                    maxTime: DateTime(2100, 1, 1),
                                    theme: DatePickerTheme(
                                        containerHeight:
                                            MediaQuery.of(context).size.height *
                                                0.3,
                                        cancelStyle: TextStyle(
                                            color: Colors.black87,
                                            fontSize: 18.0),
                                        headerColor: greenALS,
                                        backgroundColor: Colors.white,
                                        itemStyle: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 22.0),
                                        doneStyle: TextStyle(
                                            color: Colors.white,
                                            fontSize: 22.0)),
                                    onChanged: (date) {
                                  print('change $date');
                                }, onConfirm: (date) {
                                  setState(() {
                                    dateOfBirthController.text =
                                        DateFormat('yyyy-MM-dd').format(date);
                                  });
                                },
                                    // currentTime: DateTime.now(),
                                    locale: LocaleType.vi);
                              },
                            )),
                      ),
                    ],
                  )),
              Container(
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Container(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Tình trạng',
                            style: TextStyle(
                                fontSize: 22.0, fontWeight: FontWeight.w600),
                          )),
                      TextField(
                        style: TextStyle(fontSize: 24.0, color: Colors.black54),
                        maxLines: 3,
                        decoration: InputDecoration(
                          hintStyle: TextStyle(color: Colors.blue),
                        ),
                      )
                    ],
                  )),
              Container(
                margin: EdgeInsets.only(top: 20.0),
                width: MediaQuery.of(context).size.width * 0.6,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    primary: greenALS,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    elevation: 10.0,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      'BẮT ĐẦU THÔI',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
