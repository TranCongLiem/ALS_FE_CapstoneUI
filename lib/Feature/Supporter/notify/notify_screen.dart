import 'package:capstone_ui/Components/BottomNavBar_Supporter/bottom_nav_bar_supporter.dart';
import 'package:capstone_ui/Constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Notify extends StatefulWidget {
  const Notify({super.key});

  @override
  State<Notify> createState() => _NotifyState();
}

class _NotifyState extends State<Notify> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Thông báo'),
        centerTitle: true,
        backgroundColor: greenALS,
        automaticallyImplyLeading: false,
      ),
      bottomNavigationBar: MyBottomNavBarSupporter(),
      body: ListView.separated(
        physics: ClampingScrollPhysics(),
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Container(
              height: MediaQuery.of(context).size.height * 0.04,
              width: MediaQuery.of(context).size.width * 0.1,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          'https://cdn-icons-png.flaticon.com/512/1827/1827301.png'))),
            ),
            title: Text(
              'Nội dung được gửi từ patient',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 20.0),
            ),
            subtitle: Text(
              'Thời gian gửi',
              style: TextStyle(color: Colors.black54),
            ),
            onTap: () {},
            enabled: true,
          );
        },
        separatorBuilder: (context, index) {
          return Divider();
        },
        itemCount: 10,
      ),
    );
  }
}
