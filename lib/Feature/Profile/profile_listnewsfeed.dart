import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../Constant/constant.dart';

class ListNewsFeed extends StatefulWidget {
  const ListNewsFeed({super.key});

  @override
  State<ListNewsFeed> createState() => _ListNewsFeedState();
}

class _ListNewsFeedState extends State<ListNewsFeed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: greenALS,
        title: Text(
          'Lịch sử',
          style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
        ),
      ),
      // body: ListView.builder(
      //   scrollDirection: Axis.vertical,
      //   itemCount: 5,
      //   itemBuilder: (context, index) {
      //     return CustomListPost();
      //   },
      // ),
      body: Center(
        child: Text('Hi'),
      ),
    );
  }
}
