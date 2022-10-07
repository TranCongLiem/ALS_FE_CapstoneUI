import 'package:capstone_ui/Constant/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../Components/BottomNavBar/bottom_nav_bar.dart';

class NewFeed extends StatefulWidget {
  const NewFeed({super.key});

  @override
  State<NewFeed> createState() => _NewFeedState();
}

class _NewFeedState extends State<NewFeed> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        color: greenALS,
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: greenALS,
            title: Text('Tin tức'),
            centerTitle: true,
          ),
          bottomNavigationBar: MyBottomNavBar(
            // ignore: unnecessary_this
            index: this.index,
          ),
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 12.0, bottom: 12.0),
                  child: SizedBox(
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(
                              "https://www.als.org/sites/default/files/styles/image_callout/public/2021-06/navigating-ALS_02-smaller.jpg?itok=hQ1BFFn0"),
                        ),
                        Padding(padding: EdgeInsets.only(left: 10)),
                        Expanded(
                            child: Container(
                          decoration: BoxDecoration(
                              color: Color.fromARGB(31, 165, 159, 159),
                              borderRadius: BorderRadius.circular(22)),
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 30),
                              ),
                              Expanded(
                                  child: TextField(
                                decoration: InputDecoration(
                                    hintText: 'Bạn đang nghĩ gì?',
                                    border: InputBorder.none),
                              )),
                            ],
                          ),
                        )),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index) => CardItem(),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

class CardItem extends StatelessWidget {
  const CardItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 350.0,
        child: Column(
          children: <Widget>[
            ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://www.als.org/sites/default/files/styles/hero_image/public/2021-06/navigating-ALS_01-smaller.jpg?h=2f03dbdf&itok=6xFToT1-"),
              ),
              title: Text("Nguyễn Văn A"),
              subtitle: Text("September 22 at 12:17 PM"),
            ),
            Expanded(
                child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      "https://www.als.org/sites/default/files/styles/hero_image/public/2020-06/Hero-New-Site_08.jpg?h=be2185f4&itok=qkJVB6S9"),
                  fit: BoxFit.cover,
                ),
              ),
            )),
            SizedBox(
              height: 12.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.favorite,
                      color: Colors.grey,
                    ),
                    Text(
                      "Thích",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 12.0,
            ),
          ],
        ),
      ),
    );
  }
}
