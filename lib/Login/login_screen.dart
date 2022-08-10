import 'package:capstone_ui/Register/register_screen.dart';
import 'package:flutter/material.dart';

import '../Home/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscureText = true;
  void _togglePasswordStatus(){
    setState((){
      _obscureText= !_obscureText;
    });
  }
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      body: Center(
          child: Container(
            color: Colors.white,
            child: Column(
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.all(5),

                    child: Image.asset('assets/images/logo_ALS.png', width: 450),
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
                    autofocus: true,
                    obscureText: true,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: Icon(_obscureText ? Icons.visibility:Icons.visibility_off,),
                        onPressed: _togglePasswordStatus,
                        color: Colors.green,
                      ),
                      border: OutlineInputBorder(),
                      labelText: 'Mật khẩu',
                      hintText: 'Nhập mật khẩu',
                    ),
                  ),
                ),
                ElevatedButton(
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
                    },
                    child: Text('Đăng nhập'),
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
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Register()));
                    } ,
                    child: Text('Chưa có tài khoản? Đăng ký ngay'),
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all<Color>(Colors.black),

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
