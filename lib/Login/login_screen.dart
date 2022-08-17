import 'package:capstone_ui/Register/register_screen.dart';
import 'package:flutter/material.dart';
import '';
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                
                Flexible(
                  flex: 1,
                  child: Padding(
                      padding: EdgeInsets.all(5),
                      child: Image.asset('assets/images/logo_ALS.png', width: 450),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.all(10),
                  child: TextField(
                    autofocus: true,
                    decoration: InputDecoration(
                      suffixIcon: Icon(Icons.person),
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
                          return HomeScreen();
                        },
                      ),
                    );
                  },
                  icon: Icon(Icons.login),
                    label: Text('Đăng nhập'),
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
                    child: Text('Chưa có tài khoản? Đăng ký'),
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
