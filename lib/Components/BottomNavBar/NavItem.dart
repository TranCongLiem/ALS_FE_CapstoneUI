import 'package:capstone_ui/Feature/Excerise/ListExcerise.dart';
import 'package:capstone_ui/Feature/News/news_screen.dart';
import 'package:capstone_ui/Feature/Newsfeed/newfeeds.dart';
import 'package:capstone_ui/Feature/Profile/profile_screen.dart';
import 'package:flutter/material.dart';

import '../../Home/home.dart';

class NavItem {
  final int id;
  final String icon;
  final Widget? destination;

  NavItem({required this.id, required this.icon, this.destination});

  bool destinationChecker() {
    if (destination != null) {
      return true;
    }
    return false;
  }
}

class NavItems extends ChangeNotifier {
  int selectedIndex = 0;

  // void changeNavIndex({int? index}) {
  //   selectedIndex = index!;
  //   notifyListeners();
  // }

  List<NavItem> items = [
    NavItem(
      id: 1,
      icon: "assets/images/home-svgrepo-com.svg",
      // destination: HomeScreen(),
      destination: NewFeed(),
    ),
    NavItem(
      id: 2,
      icon: "assets/images/home-svgrepo-com.svg",
      // destination: HomeScreen(),
      destination: Home(),
    ),
    NavItem(
      id: 3,
      icon: "assets/images/newspaper-svgrepo-com.svg",
      destination: NewsScreen(),
    ),
    NavItem(
      id: 4,
      icon: "assets/images/newspaper-svgrepo-com.svg",
      destination: ListExcerise(),
    ),
    NavItem(
      id: 5,
      icon: "assets/images/person-svgrepo-com.svg",
      destination: Profile(),
    ),
  ];
}
