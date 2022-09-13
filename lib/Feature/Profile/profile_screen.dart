import 'package:capstone_ui/Constant/constant.dart';
import 'package:capstone_ui/Feature/Profile/profile_body.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:capstone_ui/Components/BottomNavBar/bottom_nav_bar.dart';
// import 'package:capstone_ui/Home/Components/BottomNavigation.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfiletState();
}

class _ProfiletState extends State<Profile> {
  int index = 2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text("Hồ sơ", style: TextStyle(
          fontSize: 25.0,
          fontWeight: FontWeight.bold
        ),),
        backgroundColor: greenALS,
        actions: <Widget>[
          TextButton(
            onPressed: () {},
            child: Text(
              "Chỉnh sửa",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      body: ProfileBody(),
      bottomNavigationBar: MyBottomNavBar(
        index: this.index,
      ),
    );
  }
}

// class MyBottomNavBar extends StatelessWidget {
//   MyBottomNavBar({required this.index, required this.callback});
//   final int index;
//   final Function(int) callback;
//   @override
//   Widget build(BuildContext context) {
//     /// BottomNavigationBar is automatically set to type 'fixed'
//     /// when there are three of less items
//     return BottomNavigationBar(
//       currentIndex: index,
//       onTap: callback,
//       items: <BottomNavigationBarItem>[
//         BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Trang chủ'),
//         BottomNavigationBarItem(icon: Icon(Icons.newspaper), label: 'Tin tức'),
//         BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Tài khoản'),
//       ],
//     );
//   }
// }
