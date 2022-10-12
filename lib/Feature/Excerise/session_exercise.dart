import 'package:capstone_ui/Constant/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:getwidget/getwidget.dart';

class SessionExercise extends StatefulWidget {
  const SessionExercise({super.key});

  @override
  State<SessionExercise> createState() => _SessionExerciseState();
}

class _SessionExerciseState extends State<SessionExercise> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.height;
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.black),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Tạo buổi tập',
          style: TextStyle(
              color: Colors.black54,
              fontSize: 26.0,
              fontWeight: FontWeight.w500),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 50,
            child: Expanded(
              child: ListView(
                physics: ClampingScrollPhysics(),
                children: [
                  Container(
                    height: 50,
                    child: ListView.builder(
                        itemCount: 6,
                        padding: EdgeInsets.only(left: 16),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Category();
                        }),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: height * 0.05,
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  GFCheckboxListTile(
                    padding: EdgeInsets.all(20.0),
                    color: Colors.white,
                    title: Text(
                      'Cấp độ',
                      style: TextStyle(
                          fontSize: 26.0, fontWeight: FontWeight.w400),
                    ),
                    subTitle: Text(
                      'Giúp cải thiện tay ',
                      style: TextStyle(
                          fontSize: 24.0, fontWeight: FontWeight.w200),
                    ),
                    avatar: GFAvatar(
                      backgroundImage: NetworkImage(
                          'https://png.pngtree.com/png-clipart/20190920/original/pngtree-hand-drawn-running-character-png-illustration-png-image_4627574.jpg'),
                      size: 60.0,
                    ),
                    size: 35,
                    activeBgColor: Colors.green,
                    type: GFCheckboxType.circle,
                    activeIcon: Icon(
                      Icons.check,
                      size: 20,
                      color: Colors.white,
                    ),
                    onChanged: (value) {
                      setState(() {
                        isChecked = value;
                      });
                    },
                    value: isChecked,
                    inactiveIcon: null,
                  ),
                  GFCheckboxListTile(
                    padding: EdgeInsets.all(20.0),
                    color: Colors.white,
                    title: Text(
                      'Cấp độ',
                      style: TextStyle(
                          fontSize: 26.0, fontWeight: FontWeight.w400),
                    ),
                    subTitle: Text(
                      'Giúp cải thiện tay ',
                      style: TextStyle(
                          fontSize: 24.0, fontWeight: FontWeight.w200),
                    ),
                    avatar: GFAvatar(
                      backgroundImage: NetworkImage(
                          'https://png.pngtree.com/png-clipart/20190920/original/pngtree-hand-drawn-running-character-png-illustration-png-image_4627574.jpg'),
                      size: 60.0,
                    ),
                    size: 35,
                    activeBgColor: Colors.green,
                    type: GFCheckboxType.circle,
                    activeIcon: Icon(
                      Icons.check,
                      size: 20,
                      color: Colors.white,
                    ),
                    onChanged: (value) {
                      setState(() {
                        isChecked = value;
                      });
                    },
                    value: isChecked,
                    inactiveIcon: null,
                  ),
                  GFCheckboxListTile(
                    padding: EdgeInsets.all(20.0),
                    color: Colors.white,
                    title: Text(
                      'Cấp độ',
                      style: TextStyle(
                          fontSize: 26.0, fontWeight: FontWeight.w400),
                    ),
                    subTitle: Text(
                      'Giúp cải thiện tay ',
                      style: TextStyle(
                          fontSize: 24.0, fontWeight: FontWeight.w200),
                    ),
                    avatar: GFAvatar(
                      backgroundImage: NetworkImage(
                          'https://png.pngtree.com/png-clipart/20190920/original/pngtree-hand-drawn-running-character-png-illustration-png-image_4627574.jpg'),
                      size: 60.0,
                    ),
                    size: 35,
                    activeBgColor: Colors.green,
                    type: GFCheckboxType.circle,
                    activeIcon: Icon(
                      Icons.check,
                      size: 20,
                      color: Colors.white,
                    ),
                    onChanged: (value) {
                      setState(() {
                        isChecked = value;
                      });
                    },
                    value: isChecked,
                    inactiveIcon: null,
                  ),
                  GFCheckboxListTile(
                    padding: EdgeInsets.all(20.0),
                    color: Colors.white,
                    title: Text(
                      'Cấp độ',
                      style: TextStyle(
                          fontSize: 26.0, fontWeight: FontWeight.w400),
                    ),
                    subTitle: Text(
                      'Giúp cải thiện tay ',
                      style: TextStyle(
                          fontSize: 24.0, fontWeight: FontWeight.w200),
                    ),
                    avatar: GFAvatar(
                      backgroundImage: NetworkImage(
                          'https://png.pngtree.com/png-clipart/20190920/original/pngtree-hand-drawn-running-character-png-illustration-png-image_4627574.jpg'),
                      size: 60.0,
                    ),
                    size: 35,
                    activeBgColor: Colors.green,
                    type: GFCheckboxType.circle,
                    activeIcon: Icon(
                      Icons.check,
                      size: 20,
                      color: Colors.white,
                    ),
                    onChanged: (value) {
                      setState(() {
                        isChecked = value;
                      });
                    },
                    value: isChecked,
                    inactiveIcon: null,
                  ),
                  GFCheckboxListTile(
                    padding: EdgeInsets.all(20.0),
                    color: Colors.white,
                    title: Text(
                      'Cấp độ',
                      style: TextStyle(
                          fontSize: 26.0, fontWeight: FontWeight.w400),
                    ),
                    subTitle: Text(
                      'Giúp cải thiện tay ',
                      style: TextStyle(
                          fontSize: 24.0, fontWeight: FontWeight.w200),
                    ),
                    avatar: GFAvatar(
                      backgroundImage: NetworkImage(
                          'https://png.pngtree.com/png-clipart/20190920/original/pngtree-hand-drawn-running-character-png-illustration-png-image_4627574.jpg'),
                      size: 60.0,
                    ),
                    size: 35,
                    activeBgColor: Colors.green,
                    type: GFCheckboxType.circle,
                    activeIcon: Icon(
                      Icons.check,
                      size: 20,
                      color: Colors.white,
                    ),
                    onChanged: (value) {
                      setState(() {
                        isChecked = value;
                      });
                    },
                    value: isChecked,
                    inactiveIcon: null,
                  ),
                ],
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              primary: greenALS,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
              elevation: 15.0,
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                'Tạo buổi tập',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}

class Category extends StatefulWidget {
  const Category({super.key});

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  bool select = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 16),
      width: 100,
      child: TextButton(
          onPressed: () {
            setState(() {
              select = !select;
            });
          },
          style: TextButton.styleFrom(
              backgroundColor: (select == false)
                  ? greenALS
                  : Color.fromARGB(137, 83, 180, 87)),
          child: Text(
            'Tay',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w500,
                color: (select == false) ? Colors.white : Colors.black),
          )),
    );
  }
}
