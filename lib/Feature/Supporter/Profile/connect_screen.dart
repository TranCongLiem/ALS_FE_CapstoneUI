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
          body: Container(
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
              ),
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
