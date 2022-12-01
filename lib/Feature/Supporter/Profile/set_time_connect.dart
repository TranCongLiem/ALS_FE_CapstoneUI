import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';

import '../../../Constant/constant.dart';

class SetTimeConnect extends StatefulWidget {
  const SetTimeConnect({super.key});

  @override
  State<SetTimeConnect> createState() => _SetTimeConnectState();
}

class _SetTimeConnectState extends State<SetTimeConnect> {
  TextEditingController dateFromController = TextEditingController();
  TextEditingController dateToController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dateFromController.text = '';
    dateToController.text = '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kết nối bệnh nhân'),
        backgroundColor: greenALS,
      ),
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 40.0),
        child: Column(
          children: [
            Text(
              'THỜI GIAN HỖ TRỢ',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            Container(
                alignment: Alignment.topLeft,
                margin: EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Container(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Từ ngày',
                          style: TextStyle(
                              fontSize: 22.0,
                              fontWeight: FontWeight.w400,
                              color: Colors.black38),
                        )),
                    TextField(
                      readOnly: true,
                      style: TextStyle(fontSize: 24.0, color: Colors.black54),
                      controller: dateFromController,
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
                                          fontSize: 22.0)), onChanged: (date) {
                                dateFromController.text =
                                    DateFormat('yyyy-MM-dd').format(date);

                                // context.read<UserBloc>().add(
                                //     UserEvent.getdateOfBirth(
                                //         DateFormat('yyyy-MM-dd')
                                //             .format(date)
                                //             .toString()));
                              }, onConfirm: (date) {
                                setState(() {
                                  dateFromController.text =
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
                          'Đến ngày',
                          style: TextStyle(
                              fontSize: 22.0,
                              fontWeight: FontWeight.w400,
                              color: Colors.black38),
                        )),
                    TextField(
                      readOnly: true,
                      style: TextStyle(fontSize: 24.0, color: Colors.black54),
                      controller: dateToController,
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
                                          fontSize: 22.0)), onChanged: (date) {
                                dateToController.text =
                                    DateFormat('yyyy-MM-dd').format(date);

                                // context.read<UserBloc>().add(
                                //     UserEvent.getdateOfBirth(
                                //         DateFormat('yyyy-MM-dd')
                                //             .format(date)
                                //             .toString()));
                              }, onConfirm: (date) {
                                setState(() {
                                  dateToController.text =
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
              width: MediaQuery.of(context).size.width * 0.6,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SetTimeConnect()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: greenALS.withOpacity(0.8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  elevation: 15.0,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    'Xác nhận',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}