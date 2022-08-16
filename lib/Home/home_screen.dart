import 'package:capstone_ui/Feature/Excerise/ListExcerise.dart';
import 'package:capstone_ui/Feature/SaveRecord/SaveRecording.dart';
import 'package:capstone_ui/Feature/SpeechToText/SpeechToText.dart';
import 'package:flutter/material.dart';

import '../Feature/TextToSpeech/TextToSpeech.dart';
import 'Components/BottomNavigation.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffD9D9D9),
      appBar:PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBar(
        title: Image.asset('assets/images/logo_ALS.png', width: 100,),
        centerTitle: true,
        backgroundColor: const Color(0xffffffff),
      ),
      ),
      body: HomeBody(),
      bottomNavigationBar: MyBottomNavBar(
        index: index,
        callback: (newIndex) => setState(
              () => this.index = newIndex,
        ),

      ),
    );
  }
}

//This represents the Body. We show GridView in Body
class HomeBody extends StatelessWidget {
  //Create and Return GridView filled with our data
  Widget createGridView(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.notifications_active),
        onPressed: (){},
      ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: GridView.count(
          crossAxisCount: 2,
          children:[
            Container(
              margin: EdgeInsets.only(top: 10),
              decoration: ShapeDecoration(
                color: const Color(0xffd9d9d9),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children:<Widget>[
                  IconButton(
                    icon: Icon(Icons.message_rounded),
                    iconSize: 60,
                    color: const Color(0xff6ABF4B),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => TextToSpeech()));
                    }, 
                  ),
                  Text('Chuyển thành giọng nói', textAlign: TextAlign.center,)
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              decoration: ShapeDecoration(
                color: const Color(0xffd9d9d9),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children:<Widget>[
                  IconButton(
                      icon: Icon(Icons.keyboard_voice),
                      iconSize: 60,
                      color: const Color(0xff6ABF4B),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => SpeechToText()));
                      }
                  ),
                  Text('Chuyển thành văn bản', textAlign: TextAlign.center,)
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              decoration: ShapeDecoration(
                color: const Color(0xffd9d9d9),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children:<Widget>[
                  IconButton(
                      icon: Icon(Icons.save),
                      iconSize: 60,
                      color: const Color(0xff6ABF4B),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => SaveRecording()));
                      }
                  ),
                  Text('Lưu giọng nói', textAlign: TextAlign.center,)
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              decoration: ShapeDecoration(
                color: const Color(0xffd9d9d9),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children:<Widget>[
                  IconButton(
                      icon: Icon(Icons.list_alt_sharp),
                      iconSize: 60,
                      color: const Color(0xff6ABF4B),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => ListExcerise()));
                      }
                  ),
                  Text('Bài tập', textAlign: TextAlign.center,)
                ],
              ),
            ),
          ],
          padding: EdgeInsets.all(30),
          mainAxisSpacing: 30,
          crossAxisSpacing: 20,
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: createGridView(context),
      ),
    );
  }
}

class MyBottomNavBar extends StatelessWidget {
  MyBottomNavBar({required this.index, required this.callback});
  final int index;
  final Function(int) callback;
  @override
  Widget build(BuildContext context) {
    /// BottomNavigationBar is automatically set to type 'fixed'
    /// when there are three of less items
    return BottomNavigationBar(
      currentIndex: index,
      onTap: callback,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Trang chủ'
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.newspaper),
          label: 'Tin tức'
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Tài khoản'
        ),
      ],
    );
  }
}