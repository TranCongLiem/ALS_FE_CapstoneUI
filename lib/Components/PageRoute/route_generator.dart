import 'package:capstone_ui/Feature/SaveRecord/SaveRecording.dart';
import 'package:capstone_ui/Home/home.dart';
import 'package:capstone_ui/Login/login_screen.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => Home());
      case '/login':
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case '/saveRecord':
        return MaterialPageRoute(builder: (_) => SaveRecording());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Lỗi trang'),
        ),
        body: Center(
          child: Text('Đã xảy ra lỗi'),
        ),
      );
    });
  }
}
