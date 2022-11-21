import 'package:capstone_ui/Constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ConnectPatient extends StatefulWidget {
  const ConnectPatient({super.key});

  @override
  State<ConnectPatient> createState() => _ConnectPatientState();
}

class _ConnectPatientState extends State<ConnectPatient> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
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
                  decoration: new InputDecoration(
                    labelText: "Nhập số điện thoại",
                    fillColor: Colors.white,
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(25.0),
                      borderSide: new BorderSide(),
                    ),
                    //fillColor: Colors.green
                  ),
                  validator: (val) {
                    if (val!.length == 0) {
                      return "Số điện thoại không được bỏ trống";
                    } else {
                      return null;
                    }
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
                  onPressed: () {},
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
          )),
    );
  }
}
