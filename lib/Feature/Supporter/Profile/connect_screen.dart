import 'package:capstone_ui/Constant/constant.dart';
import 'package:capstone_ui/Model/AddRelationshipWithPatient_model.dart';
import 'package:capstone_ui/services/api_User.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../Bloc/authenticate/authenticate_bloc.dart';

class ConnectPatient extends StatefulWidget {
  const ConnectPatient({super.key});

  @override
  State<ConnectPatient> createState() => _ConnectPatientState();
}

class _ConnectPatientState extends State<ConnectPatient> {
  UserPatientService _patientService = UserPatientService();
  late AddRelationwithPatientResponse resultAddReation;
  String patientPhoneNumber = '';
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticateBloc, AuthenticateState>(
      builder: (context, state1) {      
        return Scaffold(
          appBar: AppBar(
            title: Text('Kết nối'),
            centerTitle: true,
            backgroundColor: greenALS,
          ),
          body:(state1.relationshipWith ==null || state1.relationshipWith.isEmpty) ? Container(
              padding: EdgeInsets.all(10.0),
              margin: EdgeInsets.only(top: 60),
              child: Column(
                children: [
                  Text(
                    'LIÊN KẾT NGƯỜI BỆNH',
                    style: TextStyle(
                        color: Colors.black54,
                        fontSize: 30.0,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  Padding(
                    padding: EdgeInsets.all(20.0),
                    child: TextFormField(
                      controller: controller,
                      decoration: new InputDecoration(
                        labelText: "Nhập số điện thoại",
                        fillColor: Colors.white,
                        border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(25.0),
                          borderSide: new BorderSide(),
                        ),
                        //fillColor: Colors.green
                      ),
                      // onChanged: (value) {
                      //   controller.text = value;
                      // },
                      validator: (val) {
                        if (val!.length == 0) {
                          return "Số điện thoại không được bỏ trống";
                        } else if (val.length < 10 || val.length > 10) {
                          return "Số điện thoại phải là 10 số";
                        }else return null;
                      
                      },
                      keyboardType: TextInputType.phone,
                      style: new TextStyle(
                        fontFamily: "Poppins",
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: ElevatedButton(
                      onPressed: () async {
                        var resultAddReation = await AddRelationShipWithPatient(
                            AddRelationwithPatientRequest(
                                supporterId: state1.userId,
                                patientPhoneNumber: controller.text));
                        if (resultAddReation.success ?? false) {
                          // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          //   content:
                          //       Text("Thêm liên kết đến bệnh nhân thành công"),
                          //   backgroundColor: greenALS,
                          // ));
                          Fluttertoast.showToast(
                              msg: "Thêm liên kết đến bệnh nhân thành công",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.SNACKBAR,
                              timeInSecForIosWeb: 1,
                              backgroundColor: greenALS,
                              textColor: Colors.white,
                              fontSize: 16.0);
                        } else if (resultAddReation.success == false &&
                            resultAddReation.message!
                                .contains("doesn't register account")) {
                          // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          //   content: Text("Bệnh nhân chưa tồn tại"),
                          // ));
                          Fluttertoast.showToast(
                              msg: "Số điện thoại này chưa đăng kí tài khoản",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.SNACKBAR,
                              timeInSecForIosWeb: 1,
                              backgroundColor: greenALS,
                              textColor: Colors.white,
                              fontSize: 16.0);
                        } else if (resultAddReation.success == false &&
                            resultAddReation.message!
                                .contains("Patient has been supported")) {
                          Fluttertoast.showToast(
                              msg: "Bệnh nhân này đã được liên kết rồi",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.SNACKBAR,
                              timeInSecForIosWeb: 1,
                              backgroundColor: greenALS,
                              textColor: Colors.white,
                              fontSize: 16.0);
                        }
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
                          'Kết nối',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                ],
              )
              ) : Container(
                child: Column(
                  children: [
                    Divider(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Text(
                'BỆNH NHÂN ĐÃ LIÊN KẾT',
                style: TextStyle(
                    color: Colors.black54,
                    fontSize: 30.0,
                    fontWeight: FontWeight.w500),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10.0,
                  vertical: 20 / 2,
                ),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.2,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: InkWell(
                      onTap: () {},
                      child: Row(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.25,
                            height: MediaQuery.of(context).size.height * 0.2,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20.0),
                              child: Image(
                                image: NetworkImage(
                                    "https://bloganchoi.com/wp-content/uploads/2018/09/bai-tap-ta-tay.jpg"),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 20 / 2, top: 20 / 1.5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Tên bệnh nhân",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                    maxLines: 2,
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.01,
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.phone,
                                        color: Colors.black45,
                                      ),
                                      Text(
                                        "0888387104",
                                        style: TextStyle(
                                          color: Colors.black45,
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.01,
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.access_time_outlined,
                                        color: Colors.black45,
                                      ),
                                      Text(
                                        " Thời lượng:",
                                        style: TextStyle(
                                          color: Colors.black45,
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          TextButton(
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return Scaffold(
                                      backgroundColor: Colors.transparent,
                                      body: AlertDialog(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                        ),
                                        buttonPadding: EdgeInsets.all(10.0),
                                        contentPadding: EdgeInsets.all(30.0),
                                        title: Text(
                                          'Xác nhận',
                                          style: TextStyle(
                                              fontSize: 21.0,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        content: Text(
                                          'Bạn có muốn xóa bản ghi này?',
                                          style: TextStyle(fontSize: 19.0),
                                        ),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: Text('HỦY'),
                                          ),
                                          ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors.red),
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: Text(
                                              'XÓA',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20.0),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                );
                              },
                              child: Text(
                                'Xóa',
                                style: TextStyle(color: Colors.red),
                              ))
                        ],
                      ),
                    ),
                  ),
                ),
              ),
                  ],
                )
              )
        );
      },
    );
  }

  Future<AddRelationwithPatientResponse> AddRelationShipWithPatient(
      AddRelationwithPatientRequest requestModel) {
    var result = _patientService.AddRelationWithPatient(requestModel);
    return result;
  }
}