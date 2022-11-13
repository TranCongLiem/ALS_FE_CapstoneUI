import 'package:capstone_ui/Bloc/authenticate/authenticate_bloc.dart';
import 'package:capstone_ui/Feature/Newsfeed/newfeeds.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';
import '../Bloc/user/user_bloc.dart';
import '../Constant/constant.dart';
import '../Constant/profile_widget.dart';
import '../Feature/Chat/constants/firestore_constants.dart';

class RegisterInfo extends StatefulWidget {
  const RegisterInfo({super.key});

  @override
  State<RegisterInfo> createState() => _RegisterInfoState();
}

class _RegisterInfoState extends State<RegisterInfo> {
  TextEditingController dateOfBirthController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController conditionController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dateOfBirthController.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserBloc, UserState>(
      listener: (context, state) {
        if (state.isUpdatedInformationPatient) {
          Navigator.push(
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
                context.read<UserBloc>().add(UserEvent.setStateFlase());
                return NewFeed();
              },
            ),
          );
        }
      },
      builder: (context, state) {
        return BlocBuilder<AuthenticateBloc, AuthenticateState>(
          builder: (context2, state2) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              home: Scaffold(
                backgroundColor: Colors.white,
                body: Container(
                  height: MediaQuery.of(context).size.height * 1,
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
                          style: TextStyle(
                              fontSize: 28.0, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                          alignment: Alignment.topLeft,
                          margin: EdgeInsets.only(
                              left: 20.0, right: 20.0, top: 20.0),
                          child: Column(
                            children: [
                              ProfileWidget(
                                imagePath:
                                    "https://sg.cdnki.com/anh-dai-dien-dep-cho-nam-ngau---aHR0cHM6Ly90aGllcG5oYW5haS5jb20vd3AtY29udGVudC91cGxvYWRzLzIwMjEvMDUvaGluaC1hbmgtZGFpLWRpZW4tZGVwLTEuanBn.webp",
                                isEdit: true,
                                onClicked: () {},
                              ),
                              Container(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    'Họ tên',
                                    style: TextStyle(
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.w600),
                                  )),
                              TextField(
                                style: TextStyle(
                                    fontSize: 24.0, color: Colors.black54),
                                controller: fullNameController,
                                decoration: InputDecoration(
                                  hintStyle: TextStyle(color: Colors.blue),
                                ),
                                onChanged: (value) {
                                  context
                                      .read<UserBloc>()
                                      .add(UserEvent.getFullName(value));
                                },
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
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.w600),
                                  )),
                              TextField(
                                controller: addressController,
                                style: TextStyle(
                                    fontSize: 24.0, color: Colors.black54),
                                decoration: InputDecoration(
                                  hintStyle: TextStyle(color: Colors.blue),
                                ),
                                onChanged: (value) {
                                  context
                                      .read<UserBloc>()
                                      .add(UserEvent.getAddress(value));
                                },
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
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.w600),
                                  )),
                              TextField(
                                readOnly: true,
                                style: TextStyle(
                                    fontSize: 24.0, color: Colors.black54),
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
                                                    MediaQuery.of(context)
                                                            .size
                                                            .height *
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
                                          dateOfBirthController.text =
                                              DateFormat('yyyy-MM-dd')
                                                  .format(date);
                                          print('TNT' +
                                              DateFormat('yyyy-MM-dd')
                                                  .format(date)
                                                  .toString());
                                          context.read<UserBloc>().add(
                                              UserEvent.getdateOfBirth(
                                                  DateFormat('yyyy-MM-dd')
                                                      .format(date)
                                                      .toString()));
                                        }, onConfirm: (date) {
                                          setState(() {
                                            dateOfBirthController.text =
                                                DateFormat('yyyy-MM-dd')
                                                    .format(date);
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
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.w600),
                                  )),
                              TextField(
                                controller: conditionController,
                                style: TextStyle(
                                    fontSize: 24.0, color: Colors.black54),
                                maxLines: 2,
                                decoration: InputDecoration(
                                  hintStyle: TextStyle(color: Colors.blue),
                                ),
                                onChanged: (value) {
                                  context
                                      .read<UserBloc>()
                                      .add(UserEvent.getcondition(value));
                                },
                              )
                            ],
                          )),
                      Container(
                        margin: EdgeInsets.only(top: 20.0),
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: ElevatedButton(
                          onPressed: () {
                            uploadToFirebase(
                                state2.userId, state.fullName, state.imageUser);
                          },
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
          },
        );
      },
    );
  }

  Future<void> uploadToFirebase(
      String userId, String fullName, String imageUser) async {
    CollectionReference users = await FirebaseFirestore.instance
        .collection(FirestoreConstants.pathUserCollection);
    users.doc(userId).set({
      FirestoreConstants.nickname: fullName,
      FirestoreConstants.photoUrl: "imageUser",
      FirestoreConstants.id: userId,
      'createdAt': DateTime.now().millisecondsSinceEpoch.toString(),
      FirestoreConstants.chattingWith: null
    });
    context
        .read<UserBloc>()
        .add(UserEvent.updateInformationPatientRequest(userId));
  }
}
