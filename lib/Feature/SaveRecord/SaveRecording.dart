import 'package:flutter/material.dart';

class SaveRecording extends StatefulWidget {
  const SaveRecording({Key? key}) : super(key: key);

  @override
  State<SaveRecording> createState() => _SaveRecordingState();
}

class _SaveRecordingState extends State<SaveRecording> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
            // color: Colors.green[300],
            padding: EdgeInsets.only(left: 0, top: 80, right: 0, bottom: 0),
            child: Column(
              children: <Widget>[
                Container(
                  child: Text(
                    "Tạo tài khoản ngay",
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.black26,
                    ),
                  ),

                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Tài khoản',
                      hintText: 'Nhập tài khoản',
                    ),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      suffixIcon: Icon(Icons.remove_red_eye),
                      border: OutlineInputBorder(),
                      labelText: 'Mật khẩu',
                      hintText: 'Nhập mật khẩu',
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: (){},
                  child: Text('Đăng ký'),
                  style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
                      elevation: MaterialStateProperty.resolveWith<double>((Set<MaterialState>states){
                        if (states.contains(MaterialState.pressed) || (states.contains(MaterialState.disabled))){
                          return 0;
                        }
                        return 5;
                      })
                  ) ,
                ),
                TextButton(
                  onPressed: (){

                  } ,
                  child: Text('Đã có tài khoản? Đăng nhập'),
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all<Color>(Colors.black38),

                  ),
                ),

              ],
            ),
          )
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}