// import 'dart:io';

// import 'package:capstone_ui/Bloc/authenticate/authenticate_bloc.dart';
// import 'package:capstone_ui/Constant/profile_widget_imagenull.dart';
// import 'package:capstone_ui/Feature/Newsfeed/newfeeds.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:intl/intl.dart';
// import '../Bloc/user/user_bloc.dart';
// import '../Constant/constant.dart';
// import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

// import '../Feature/Chat/constants/firestore_constants.dart';
// import '../Home/home.dart';

// enum MediaType {
//   image,
//   video;
// }

// class RegisterInfo extends StatefulWidget {
//   const RegisterInfo({super.key});

//   @override
//   State<RegisterInfo> createState() => _RegisterInfoState();
// }

// class _RegisterInfoState extends State<RegisterInfo> {
//   TextEditingController dateOfBirthController = TextEditingController();
//   TextEditingController fullNameController = TextEditingController();
//   TextEditingController addressController = TextEditingController();
//   TextEditingController conditionController = TextEditingController();
//   late String? imagePath;
//   MediaType _mediaType = MediaType.image;

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     dateOfBirthController.text = "";
//     imagePath = null;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<UserBloc, UserState>(
//       listener: (context, state) {
//         if (state.isUpdatedInformationPatient) {
//           context
//               .read<UserBloc>()
//               .add(UserEvent.setStateFlaseInformationPatient());
//           Navigator.pushAndRemoveUntil(
//               context,
//               MaterialPageRoute(
//                   builder: (BuildContext context) => new Home()),
//               (Route<dynamic> route) => false);
//         }
//       },
//       builder: (context, state) {
//         return BlocBuilder<AuthenticateBloc, AuthenticateState>(
//           builder: (context2, state2) {
//             return MaterialApp(
//               debugShowCheckedModeBanner: false,
//               home: Scaffold(
//                 backgroundColor: Colors.white,
//                 body: Container(
//                   height: MediaQuery.of(context).size.height * 1,
//                   padding: EdgeInsets.all(10.0),
//                   child: ListView(
//                     children: [
//                       Container(
//                         alignment: Alignment.center,
//                         // padding: EdgeInsets.only(left: 20.0, right: 20.0),
//                         margin: EdgeInsets.only(top: 20.0, bottom: 10.0),
//                         child: Text(
//                           'HÃY CHO CHÚNG TÔI BIẾT THÊM VỀ BẠN',
//                           textAlign: TextAlign.center,
//                           style: TextStyle(
//                               fontSize: 26.0, fontWeight: FontWeight.bold),
//                         ),
//                       ),
//                       Container(
//                           alignment: Alignment.topLeft,
//                           margin: EdgeInsets.only(
//                               left: 20.0, right: 20.0, top: 20.0),
//                           child: Column(
//                             children: [
//                               Center(
//                                 child: Stack(
//                                   children: [
//                                     Container(
//                                       width: 130,
//                                       height: 130,
//                                       decoration: BoxDecoration(
//                                           border: Border.all(
//                                               width: 4,
//                                               color: Theme.of(context)
//                                                   .scaffoldBackgroundColor),
//                                           boxShadow: [
//                                             BoxShadow(
//                                                 spreadRadius: 2,
//                                                 blurRadius: 10,
//                                                 color: Colors.black
//                                                     .withOpacity(0.1),
//                                                 offset: Offset(0, 10))
//                                           ],
//                                           shape: BoxShape.circle,
//                                           image: DecorationImage(
//                                             fit: BoxFit.cover,
//                                             image: imagePath == null
//                                                 ? AssetImage(
//                                                         "assets/images/logo_Avatar.jpg")
//                                                     as ImageProvider
//                                                 : FileImage(File(imagePath!)),
//                                           )),
//                                     ),
//                                     Positioned(
//                                         bottom: 0,
//                                         right: 0,
//                                         child: Container(
//                                           height: 40,
//                                           width: 40,
//                                           decoration: BoxDecoration(
//                                             shape: BoxShape.circle,
//                                             border: Border.all(
//                                               width: 4,
//                                               color: Theme.of(context)
//                                                   .scaffoldBackgroundColor,
//                                             ),
//                                             color: Colors.green,
//                                           ),
//                                           child: IconButton(
//                                             icon: Icon(Icons.edit),
//                                             onPressed: () {
//                                               showMaterialModalBottomSheet(
//                                                 context: context,
//                                                 builder: (context) => Container(
//                                                   height: MediaQuery.of(context)
//                                                           .size
//                                                           .height *
//                                                       0.15,
//                                                   width: MediaQuery.of(context)
//                                                       .size
//                                                       .width,
//                                                   margin: EdgeInsets.symmetric(
//                                                       horizontal: 20.0,
//                                                       vertical: 20.0),
//                                                   child: Column(
//                                                     children: <Widget>[
//                                                       Text(
//                                                         'Chọn ảnh từ',
//                                                         style: TextStyle(
//                                                             fontSize: 20.0),
//                                                       ),
//                                                       SizedBox(
//                                                         height: 20.0,
//                                                       ),
//                                                       Row(
//                                                         mainAxisAlignment:
//                                                             MainAxisAlignment
//                                                                 .spaceEvenly,
//                                                         children: [
//                                                           ElevatedButton.icon(
//                                                               onPressed: () {
//                                                                 pickMedia(
//                                                                     ImageSource
//                                                                         .gallery);
//                                                               },
//                                                               icon: Icon(
//                                                                   Icons.image),
//                                                               label: Text(
//                                                                   'Thư viện'),
//                                                               style: ElevatedButton
//                                                                   .styleFrom(
//                                                                       backgroundColor:
//                                                                           greenALS)),
//                                                           ElevatedButton.icon(
//                                                             onPressed: () {
//                                                               pickMedia(
//                                                                   ImageSource
//                                                                       .camera);
//                                                             },
//                                                             icon: Icon(
//                                                                 Icons.camera),
//                                                             label:
//                                                                 Text('Máy ảnh'),
//                                                             style: ElevatedButton
//                                                                 .styleFrom(
//                                                                     backgroundColor:
//                                                                         greenALS),
//                                                           )
//                                                         ],
//                                                       )
//                                                     ],
//                                                   ),
//                                                 ),
//                                               );
//                                             },
//                                             color: Colors.white,
//                                           ),
//                                         )),
//                                   ],
//                                 ),
//                               ),
//                               Container(
//                                   alignment: Alignment.topLeft,
//                                   child: Text(
//                                     'Họ tên',
//                                     style: TextStyle(
//                                         fontSize: 22.0,
//                                         fontWeight: FontWeight.w600),
//                                   )),
//                               TextField(
//                                 style: TextStyle(
//                                     fontSize: 24.0, color: Colors.black54),
//                                 controller: fullNameController,
//                                 decoration: InputDecoration(
//                                   hintStyle: TextStyle(color: Colors.blue),
//                                 ),
//                                 onChanged: (value) {
//                                   context
//                                       .read<UserBloc>()
//                                       .add(UserEvent.getFullName(value));
//                                 },
//                               )
//                             ],
//                           )),
//                       Container(
//                           alignment: Alignment.topLeft,
//                           margin: EdgeInsets.all(20.0),
//                           child: Column(
//                             children: [
//                               Container(
//                                   alignment: Alignment.topLeft,
//                                   child: Text(
//                                     'Địa chỉ',
//                                     style: TextStyle(
//                                         fontSize: 22.0,
//                                         fontWeight: FontWeight.w600),
//                                   )),
//                               TextField(
//                                 controller: addressController,
//                                 style: TextStyle(
//                                     fontSize: 24.0, color: Colors.black54),
//                                 decoration: InputDecoration(
//                                   hintStyle: TextStyle(color: Colors.blue),
//                                 ),
//                                 onChanged: (value) {
//                                   context
//                                       .read<UserBloc>()
//                                       .add(UserEvent.getAddress(value));
//                                 },
//                               )
//                             ],
//                           )),
//                       Container(
//                           alignment: Alignment.topLeft,
//                           margin: EdgeInsets.all(20.0),
//                           child: Column(
//                             children: [
//                               Container(
//                                   alignment: Alignment.topLeft,
//                                   child: Text(
//                                     'Ngày sinh',
//                                     style: TextStyle(
//                                         fontSize: 22.0,
//                                         fontWeight: FontWeight.w600),
//                                   )),
//                               TextField(
//                                 readOnly: true,
//                                 style: TextStyle(
//                                     fontSize: 24.0, color: Colors.black54),
//                                 controller: dateOfBirthController,
//                                 decoration: InputDecoration(
//                                     hintStyle: TextStyle(color: greenALS),
//                                     suffixIcon: IconButton(
//                                       icon: Icon(
//                                         Icons.calendar_month,
//                                         size: 35.0,
//                                       ),
//                                       onPressed: () {
//                                         DatePicker.showDatePicker(context,
//                                             showTitleActions: true,
//                                             minTime: DateTime(1900, 1, 1),
//                                             maxTime: DateTime(2100, 1, 1),
//                                             theme: DatePickerTheme(
//                                                 containerHeight:
//                                                     MediaQuery.of(context)
//                                                             .size
//                                                             .height *
//                                                         0.3,
//                                                 cancelStyle: TextStyle(
//                                                     color: Colors.black87,
//                                                     fontSize: 18.0),
//                                                 headerColor: greenALS,
//                                                 backgroundColor: Colors.white,
//                                                 itemStyle: TextStyle(
//                                                     fontWeight: FontWeight.bold,
//                                                     fontSize: 22.0),
//                                                 doneStyle: TextStyle(
//                                                     color: Colors.white,
//                                                     fontSize: 22.0)),
//                                             onChanged: (date) {
//                                           dateOfBirthController.text =
//                                               DateFormat('yyyy-MM-dd')
//                                                   .format(date);
//                                           print('TNT' +
//                                               DateFormat('yyyy-MM-dd')
//                                                   .format(date)
//                                                   .toString());
//                                           context.read<UserBloc>().add(
//                                               UserEvent.getdateOfBirth(
//                                                   DateFormat('yyyy-MM-dd')
//                                                       .format(date)
//                                                       .toString()));
//                                         }, onConfirm: (date) {
//                                           setState(() {
//                                             dateOfBirthController.text =
//                                                 DateFormat('yyyy-MM-dd')
//                                                     .format(date);
//                                           });
//                                         },
//                                             // currentTime: DateTime.now(),
//                                             locale: LocaleType.vi);
//                                       },
//                                     )),
//                               ),
//                             ],
//                           )),
//                       Container(
//                           alignment: Alignment.topLeft,
//                           margin: EdgeInsets.all(20.0),
//                           child: Column(
//                             children: [
//                               Container(
//                                   alignment: Alignment.topLeft,
//                                   child: Text(
//                                     'Tình trạng',
//                                     style: TextStyle(
//                                         fontSize: 22.0,
//                                         fontWeight: FontWeight.w600),
//                                   )),
//                               TextField(
//                                 controller: conditionController,
//                                 style: TextStyle(
//                                     fontSize: 24.0, color: Colors.black54),
//                                 maxLines: 2,
//                                 decoration: InputDecoration(
//                                   hintStyle: TextStyle(color: Colors.blue),
//                                 ),
//                                 onChanged: (value) {
//                                   context
//                                       .read<UserBloc>()
//                                       .add(UserEvent.getcondition(value));
//                                 },
//                               )
//                             ],
//                           )),
//                       Container(
//                         margin: EdgeInsets.only(top: 20.0),
//                         width: MediaQuery.of(context).size.width * 0.6,
//                         child: ElevatedButton(
//                           onPressed: () {
//                             if (state2.isRegisterPatient) {
//                               context.read<AuthenticateBloc>().add(
//                                   AuthenticateEvent
//                                       .setCheckRegisterPatientFalseRequested());
//                             }
//                             uploadImage(state2.userId, state.fullName,
//                                 state.imageUser, state2.phoneNumber);
//                           },
//                           style: ElevatedButton.styleFrom(
//                             primary: greenALS,
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(25),
//                             ),
//                             elevation: 10.0,
//                           ),
//                           child: Padding(
//                             padding: const EdgeInsets.all(15.0),
//                             child: Text(
//                               'BẮT ĐẦU THÔI',
//                               style: TextStyle(fontSize: 20),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             );
//           },
//         );
//       },
//     );
//   }

//   Future<void> uploadImage(
//       String userId, String fullName, String imageUser, String phone) async {
//     FirebaseStorage firebaseStorage = FirebaseStorage.instance;

//     String fileName = DateTime.now().millisecondsSinceEpoch.toString();
//     Reference reference =
//         firebaseStorage.ref('upload-image-user').child(userId).child(fileName);
//     UploadTask uploadTask = reference.putFile(File(imagePath!));
//     TaskSnapshot snapshot = await uploadTask;
//     String imageDatabase = await snapshot.ref.getDownloadURL();
//     context.read<UserBloc>().add(UserEvent.getImageUser(imageDatabase));
//     await uploadToFirebase(userId, fullName, imageUser, phone);
//   }

//   Future<void> uploadToFirebase(
//       String userId, String fullName, String imageUser, String phone) async {
//     CollectionReference users = await FirebaseFirestore.instance
//         .collection(FirestoreConstants.pathUserCollection);
//     users.doc(userId).set({
//       FirestoreConstants.nickname: fullName,
//       FirestoreConstants.photoUrl: imageUser,
//       FirestoreConstants.id: userId,
//       FirestoreConstants.phone: phone,
//       'createdAt': DateTime.now().millisecondsSinceEpoch.toString(),
//       FirestoreConstants.chattingWith: null
//     });
//     context
//         .read<UserBloc>()
//         .add(UserEvent.updateInformationPatientRequest(userId));
//   }

//   void pickMedia(ImageSource source) async {
//     XFile? file;
//     if (_mediaType == MediaType.image) {
//       file = await ImagePicker()
//           .pickImage(source: source, maxHeight: 480, maxWidth: 640);
//     } else {
//       file = await ImagePicker().pickVideo(source: source);
//     }
//     if (file != null) {
//       imagePath = file.path;
//       setState(() {});
//     }
//   }
// }
import 'dart:io';
import 'package:capstone_ui/Bloc/authenticate/authenticate_bloc.dart';
import 'package:capstone_ui/Constant/profile_widget_imagenull.dart';
import 'package:capstone_ui/Feature/Newsfeed/newfeeds.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import '../Bloc/user/user_bloc.dart';
import '../Constant/constant.dart';
import '../Feature/Chat/constants/firestore_constants.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../Home/home.dart';

enum MediaType {
  image,
  video;
}

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
  late String? imagePath;
  MediaType _mediaType = MediaType.image;
  var imageUserDefault;
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  GlobalKey<FormFieldState> usernameKey = GlobalKey();
  GlobalKey<FormFieldState> addressKey = GlobalKey();
  GlobalKey<FormFieldState> birthKey = GlobalKey();
  GlobalKey<FormFieldState> conditionKey = GlobalKey();
  final itemsCondition = [
    'Khó khăn khi nói chuyện',
    'Khó khăn khi cử động tay',
    'Cánh tay đang bị yếu dần',
    'Bàn tay đang bị yếu dần',
    'Chân  đang bị yếu dần',
    'Bàn chân đang bị yếu',
    'Khả năng nói chuyện đang bị yếu',
    'Khác'
  ];
  String value = '';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dateOfBirthController.text = "";
    imageUserDefault =
        "https://scontent.fsgn13-2.fna.fbcdn.net/v/t1.15752-9/287821475_1116111985634770_5760459797365277053_n.jpg?_nc_cat=106&ccb=1-7&_nc_sid=ae9488&_nc_ohc=y9yeetAsLbkAX_tgPwb&_nc_ht=scontent.fsgn13-2.fna&oh=03_AdTS2V3z1huHJ0RnwERW_2QJecLOXsihyZXjKz7DAAblbA&oe=63C222D9";
    imagePath = null;
    context.read<UserBloc>().add(UserEvent.getcondition(itemsCondition[0]));
    context.read<UserBloc>().add(UserEvent.getdateOfBirth(
        DateFormat('yyyy-MM-dd').format(DateTime.now()).toString()));
    value = itemsCondition[0];
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserBloc, UserState>(
      listener: (context, state) {
        if (state.isUpdatedInformationPatient) {
          context
              .read<UserBloc>()
              .add(UserEvent.setStateFlaseInformationPatient());
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => new Home()),
              (Route<dynamic> route) => false);
          Fluttertoast.showToast(
              msg: "Hoàn tất đăng kí",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.SNACKBAR,
              timeInSecForIosWeb: 1,
              backgroundColor: greenALS,
              textColor: Colors.white,
              fontSize: 16.0);
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
                  child: Form(
                    key: formkey,
                    child: ListView(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          // padding: EdgeInsets.only(left: 20.0, right: 20.0),
                          margin: EdgeInsets.only(top: 20.0, bottom: 10.0),
                          child: Text(
                            'HÃY CHO CHÚNG TÔI BIẾT THÊM VỀ BẠN',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 26.0, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                            alignment: Alignment.topLeft,
                            margin: EdgeInsets.only(
                                left: 20.0, right: 20.0, top: 20.0),
                            child: Column(
                              children: [
                                Center(
                                  child: Stack(
                                    children: [
                                      Container(
                                        width: 130,
                                        height: 130,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                width: 4,
                                                color: Theme.of(context)
                                                    .scaffoldBackgroundColor),
                                            boxShadow: [
                                              BoxShadow(
                                                  spreadRadius: 2,
                                                  blurRadius: 10,
                                                  color: Colors.black
                                                      .withOpacity(0.1),
                                                  offset: Offset(0, 10))
                                            ],
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: imagePath == null
                                                  ? NetworkImage(
                                                          imageUserDefault)
                                                      as ImageProvider
                                                  : FileImage(File(imagePath!)),
                                            )),
                                      ),
                                      Positioned(
                                          bottom: 0,
                                          right: 0,
                                          child: Container(
                                            height: 55,
                                            width: 55,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                width: 4,
                                                color: Theme.of(context)
                                                    .scaffoldBackgroundColor,
                                              ),
                                              color: Colors.green,
                                            ),
                                            child: IconButton(
                                              icon: Icon(
                                                Icons.edit,
                                                size: 35,
                                              ),
                                              onPressed: () {
                                                showMaterialModalBottomSheet(
                                                  context: context,
                                                  builder: (context) =>
                                                      Container(
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.15,
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    margin:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 20.0,
                                                            vertical: 20.0),
                                                    child: Column(
                                                      children: <Widget>[
                                                        Text(
                                                          'Chọn ảnh từ',
                                                          style: TextStyle(
                                                              fontSize: 24.0),
                                                        ),
                                                        SizedBox(
                                                          height: 20.0,
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceEvenly,
                                                          children: [
                                                            ElevatedButton.icon(
                                                                onPressed: () {
                                                                  pickMedia(
                                                                      ImageSource
                                                                          .gallery);
                                                                },
                                                                icon: Icon(
                                                                  Icons.image,
                                                                  size: 35,
                                                                ),
                                                                label: Text(
                                                                  'Thư viện',
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          24),
                                                                ),
                                                                style: ElevatedButton
                                                                    .styleFrom(
                                                                        backgroundColor:
                                                                            greenALS)),
                                                            ElevatedButton.icon(
                                                              onPressed: () {
                                                                pickMedia(
                                                                    ImageSource
                                                                        .camera);
                                                              },
                                                              icon: Icon(
                                                                Icons.camera,
                                                                size: 35,
                                                              ),
                                                              label: Text(
                                                                'Máy ảnh',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        24),
                                                              ),
                                                              style: ElevatedButton
                                                                  .styleFrom(
                                                                      backgroundColor:
                                                                          greenALS),
                                                            )
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              },
                                              color: Colors.white,
                                            ),
                                          )),
                                    ],
                                  ),
                                ),
                                Container(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      'Họ tên',
                                      style: TextStyle(
                                          fontSize: 22.0,
                                          fontWeight: FontWeight.w600),
                                    )),
                                TextFormField(
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  style: TextStyle(
                                      fontSize: 24.0, color: Colors.black54),
                                  key: usernameKey,
                                  controller: fullNameController,
                                  decoration: InputDecoration(
                                    hintStyle: TextStyle(color: Colors.blue),
                                  ),
                                  onChanged: (value) {
                                    context
                                        .read<UserBloc>()
                                        .add(UserEvent.getFullName(value));
                                  },
                                  validator: (val) => validateUsername(val!),
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
                                TextFormField(
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  key: addressKey,
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
                                  validator: (val) => validateAddress(val!),
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
                                TextFormField(
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  key: birthKey,
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
                                                      fontWeight:
                                                          FontWeight.bold,
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
                                  validator: (val) => validateBirth(val!),
                                ),
                              ],
                            )),
                        // Container(
                        //     // alignment: Alignment.topLeft,
                        //     // margin: EdgeInsets.all(20.0),
                        //     padding: EdgeInsets.symmetric(
                        //         horizontal: 12, vertical: 4),
                        //     decoration: BoxDecoration(
                        //         borderRadius: BorderRadius.circular(12),
                        //         border: Border.all(color: Colors.black)),
                        //     child: Column(
                        //       children: [
                        //         Container(
                        //             alignment: Alignment.topLeft,
                        //             child: Text(
                        //               'Tình trạng',
                        //               style: TextStyle(
                        //                   fontSize: 22.0,
                        //                   fontWeight: FontWeight.w600),
                        //             )),
                        //         Container(
                        //           child: DropdownButtonHideUnderline(
                        //             child: DropdownButton<String>(
                        //               value: value,
                        //               iconSize: 36,
                        //               icon: Icon(Icons.arrow_drop_down,
                        //                   color: Colors.black),
                        //               isExpanded: true,
                        //               items: itemsCondition
                        //                   .map(buildMenuItem)
                        //                   .toList(),
                        //               onChanged: (value) => setState(() {
                        //                 this.value = value;
                        //               }),
                        //             ),
                        //           ),
                        //         ),
                        //         this.value ==  'Khác' ?
                        //             TextFormField(
                        //               autovalidateMode:
                        //                   AutovalidateMode.onUserInteraction,
                        //               key: conditionKey,
                        //               controller: conditionController,
                        //               style: TextStyle(
                        //                   fontSize: 24.0, color: Colors.black54),
                        //               maxLines: 2,
                        //               decoration: InputDecoration(
                        //                 hintStyle: TextStyle(color: Colors.blue),
                        //               ),
                        //               onChanged: (value) {
                        //                 context
                        //                     .read<UserBloc>()
                        //                     .add(UserEvent.getcondition(value));
                        //               },
                        //               validator: (val) => validateCondition(val!),
                        //             ) : SizedBox()
                        //       ],
                        //     )
                        //     ),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 20, vertical: 8),
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
                              Container(
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<String>(
                                    value: value,
                                    iconSize: 36,
                                    icon: Icon(Icons.arrow_drop_down,
                                        color: Colors.black),
                                    isExpanded: true,
                                    items: itemsCondition
                                        .map(buildMenuItem)
                                        .toList(),
                                    onChanged: (value) => setState(() {
                                      this.value = value ?? itemsCondition[0];
                                      context
                                          .read<UserBloc>()
                                          .add(UserEvent.getcondition(value!));
                                    }),
                                  ),
                                ),
                              ),
                              this.value == 'Khác'
                                  ? Container(
                                      decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.grey),
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: TextFormField(
                                        autovalidateMode:
                                            AutovalidateMode.onUserInteraction,
                                        key: conditionKey,
                                        controller: conditionController,
                                        style: TextStyle(
                                            fontSize: 24.0,
                                            color: Colors.black54),
                                        maxLines: 2,
                                        decoration: InputDecoration(
                                          hintStyle:
                                              TextStyle(color: Colors.blue),
                                          border: InputBorder.none,
                                        ),
                                        onChanged: (value) {
                                          context.read<UserBloc>().add(
                                              UserEvent.getcondition(value));
                                        },
                                        validator: (val) =>
                                            validateCondition(val!),
                                      ),
                                    )
                                  : SizedBox()
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 20.0),
                          width: MediaQuery.of(context).size.width * 0.6,
                          child: ElevatedButton(
                            onPressed: () {
                              if (formkey.currentState!.validate()) {
                                if (state2.isRegisterPatient) {
                                  context.read<AuthenticateBloc>().add(
                                      AuthenticateEvent
                                          .setCheckRegisterPatientFalseRequested());
                                }
                                uploadImage(state2.userId, state.fullName,
                                    state.imageUser, state2.phoneNumber);
                              }
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
              ),
            );
          },
        );
      },
    );
  }

  Future<void> uploadImage(
      String userId, String fullName, String imageUser, String phone) async {
    if (imagePath != null) {
      FirebaseStorage firebaseStorage = FirebaseStorage.instance;

      String fileName = DateTime.now().millisecondsSinceEpoch.toString();
      Reference reference = firebaseStorage
          .ref('upload-image-user')
          .child(userId)
          .child(fileName);
      UploadTask uploadTask = reference.putFile(File(imagePath!));
      TaskSnapshot snapshot = await uploadTask;
      String imageDatabase = await snapshot.ref.getDownloadURL();
      context.read<UserBloc>().add(UserEvent.getImageUser(imageDatabase));
    } else {
      context.read<UserBloc>().add(UserEvent.getImageUser(imageUserDefault));
    }

    await uploadToFirebase(userId, fullName, imageUser, phone);
  }

  Future<void> uploadToFirebase(
      String userId, String fullName, String imageUser, String phone) async {
    CollectionReference users = await FirebaseFirestore.instance
        .collection(FirestoreConstants.pathUserCollection);
    users.doc(userId).set({
      FirestoreConstants.nickname: fullName,
      FirestoreConstants.photoUrl: imageUser,
      FirestoreConstants.id: userId,
      FirestoreConstants.phone: phone,
      'createdAt': DateTime.now().millisecondsSinceEpoch.toString(),
      FirestoreConstants.chattingWith: null
    });
    context
        .read<UserBloc>()
        .add(UserEvent.updateInformationPatientRequest(userId));
  }

  void pickMedia(ImageSource source) async {
    XFile? file;
    if (_mediaType == MediaType.image) {
      file = await ImagePicker()
          .pickImage(source: source, maxHeight: 480, maxWidth: 640);
    } else {
      file = await ImagePicker().pickVideo(source: source);
    }
    if (file != null) {
      imagePath = file.path;
      setState(() {});
    }
  }

  String? validateUsername(String username) {
    if (username == null || username.isEmpty) {
      return 'Vui lòng nhập họ tên';
    } else if (username.length > 50) {
      return 'Vui lòng nhập 50 ký tự';
    }
    return null;
  }

  String? validateAddress(String address) {
    if (address == null || address.isEmpty) {
      return 'Vui lòng nhập địa chỉ';
    }
    return null;
  }

  String? validateBirth(String birth) {
    if (birth == null || birth.isEmpty) {
      return 'Vui lòng chọn ngày sinh';
    }
    return null;
  }

  String? validateCondition(String condition) {
    if (condition == null || condition.isEmpty) {
      return 'Vui lòng chọn tình trạng';
    }
    return null;
  }

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(
          item,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      );
}