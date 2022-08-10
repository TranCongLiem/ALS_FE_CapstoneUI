import 'package:flutter/material.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}
class _BottomNavigationState extends State<BottomNavigation> {
  int pageIndex = 0;
  Widget _myHome = Page1();
  Widget _myNews = Page2();
  Widget _myProfile = Page3();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      appBar: AppBar(
        title: Image.asset('assets/images/logo_ALS.png', width: 100,),
        centerTitle: true,
        backgroundColor: const Color(0xff6abf4b),
      ),
      body: this.getBody(),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: this.pageIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: 'Trang chủ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.newspaper),
            label: 'Tin tức',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Tài khoản',
          )
        ],
        onTap: (int index){
          this.onTapHandler(index);
        },
      ),
    );
  }
  Widget getBody(){
    if(this.pageIndex==0){
      return this._myHome;
    } else if(this.pageIndex==1){
      return this._myNews;
    } else{
      return this._myProfile;
    }
  }

  void onTapHandler(int index){
    this.setState(() {
      this.pageIndex=index;
    });
  }
}
class Page1 extends StatelessWidget {
  const Page1({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffffffff),
    );
  }
}

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffffffff),
    );
  }
}

class Page3 extends StatelessWidget {
  const Page3({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffffffff),
    );
  }
}

