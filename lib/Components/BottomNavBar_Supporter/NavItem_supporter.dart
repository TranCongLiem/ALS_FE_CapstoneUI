import 'package:capstone_ui/Feature/Excerise/ListExcerise.dart';
import 'package:capstone_ui/Feature/News/news_screen.dart';
import 'package:capstone_ui/Feature/Newsfeed/newfeeds.dart';
import 'package:capstone_ui/Feature/Profile/profile_screen.dart';
import 'package:flutter/material.dart';

import '../../Feature/Supporter/News/news_screen.dart';
import '../../Feature/Supporter/Newsfeed/newfeeds.dart';
import '../../Feature/Supporter/Notification/notify_screen.dart';
import '../../Feature/Supporter/Profile/profile_screen.dart';
import '../../Home/home.dart';

class NavItemSupporter {
  final int id;
  final String icon;
  final Widget? destination;

  NavItemSupporter({required this.id, required this.icon, this.destination});

  bool destinationChecker() {
    if (destination != null) {
      return true;
    }
    return false;
  }
}

class NavItemsSupporter extends ChangeNotifier {
  int selectedIndex = 0;

  // void changeNavIndex({int? index}) {
  //   selectedIndex = index!;
  //   notifyListeners();
  // }

  List<NavItemSupporter> items = [
    NavItemSupporter(
      id: 1,
      icon: "assets/images/home-svgrepo-com.svg",
      // destination: HomeScreen(),
      destination: NewFeedSupporter(),
    ),
    NavItemSupporter(
      id: 2,
      icon: "assets/images/home-svgrepo-com.svg",
      // destination: HomeScreen(),
      destination: Notify(),
    ),
    NavItemSupporter(
      id: 3,
      icon: "assets/images/newspaper-svgrepo-com.svg",
      destination: NewsScreenSupporter(),
    ),
    NavItemSupporter(
      id: 4,
      icon: "assets/images/person-svgrepo-com.svg",
      destination: ProfileSupporter(),
    ),
  ];
}
