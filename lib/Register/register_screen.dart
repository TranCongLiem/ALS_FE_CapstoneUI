import 'package:capstone_ui/Constant/constant.dart';
import 'package:flutter/material.dart';

import '../Home/home.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool hidePassword = true;

  TextEditingController emailController= TextEditingController();
  TextEditingController passwordController= TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Đăng ký", style: TextStyle(
          color: Colors.white,
          fontSize: 25.0,
            fontWeight: FontWeight.bold
        ),),
      ),
      body: Center(
          child: Container(
            // color: Colors.green[300],
            padding: EdgeInsets.only(left: 0, top: 50, right: 0, bottom: 0),
            child: Column(
              children: <Widget>[
                Container(
                  child: Text(
                    "Tạo tài khoản ngay",
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.black26,
                      fontFamily: 'GothamB'
                    ),
                  ),

                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: TextFormField(
                    controller: emailController,
                    autofocus: true,
                    decoration: InputDecoration(
                      suffixIcon: Icon(Icons.person),
                      border: OutlineInputBorder(),
                      labelText: 'Tài khoản',
                      hintText: 'Nhập tài khoản',
                    ),
                    style: TextStyle(
                        fontSize: 25
                    ),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.all(10),
                  child: TextFormField(
                    controller: passwordController,
                    obscureText: hidePassword,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: Icon(hidePassword? Icons.visibility_off:Icons.visibility,),
                        onPressed: (){
                          setState((){
                            hidePassword= !hidePassword;
                          });
                        },
                        color: Colors.green,
                      ),
                      border: OutlineInputBorder(),
                      labelText: 'Mật khẩu',
                      hintText: 'Nhập mật khẩu',
                    ),
                    style: TextStyle(
                        fontSize: 25
                    ),
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () {
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
                        pageBuilder: (BuildContext context,
                            Animation<double> animation,
                            Animation<double> secondaryAnimation) {
                          return Home();
                        },
                      ),
                    );
                  },
                  icon: Icon(Icons.app_registration),
                  label: Text('Đăng ký', style: TextStyle(
                      fontSize: 22,
                      fontFamily: 'GothamB'
                  ),),
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
                    elevation: MaterialStateProperty.resolveWith<double>((Set<MaterialState>states){
                      if (states.contains(MaterialState.pressed) || (states.contains(MaterialState.disabled))){
                        return 0;
                      }
                      return 5;
                    }),
                  ) ,
                ),
              ],
            ),
          )
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}