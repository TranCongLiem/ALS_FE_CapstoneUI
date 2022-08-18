//import 'package:capstone_ui/Feature/Profile/info.dart';
import 'package:capstone_ui/Feature/Profile/profileInfo.dart';
import 'package:capstone_ui/Feature/Profile/profile_menu.dart';
//import 'package:capstone_ui/size_config.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter_svg/flutter_svg.dart';

import 'package:flutter/material.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //double defaultSize = SizeConfig.defaultSize;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          // Info(
          //   name: "Nguyễn Văn A",
          //   image: "assets/images/logo_Avatar.jpg",
          // ),
          // SizedBox(height: 20),
          // ProfileMenu(
          //   iconSrc: "assets/images/logout-svgrepo-com.svg",
          //   label: "Logout",
          //   press: () {},
          // ),
          ProfileInfo(
            name: "Nguyễn Văn A",
            image: "assets/images/logo_Avatar.jpg",
          ),
          SizedBox(
            height: 20,
          ),
          ProfileMenuItem(
            iconSrc: "assets/images/logout-svgrepo-com.svg",
            title: "Đăng xuất",
            press: () {},
          ),
        ],
      ),
    );
  }
}
