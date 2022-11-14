import 'package:flutter/material.dart';
import '../../Feature/supporter/News/news_screen.dart';
import '../../Feature/supporter/Newsfeed/newfeeds.dart';
import '../../Feature/supporter/Profile/profile_screen.dart';
import '../../Feature/supporter/notify/notify_screen.dart';

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

  List<NavItemSupporter> items = [
    NavItemSupporter(
      id: 1,
      icon: "assets/images/home-svgrepo-com.svg",
      destination: NewFeedSupporter(),
    ),
    NavItemSupporter(
      id: 2,
      icon: "assets/images/home-svgrepo-com.svg",
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
