// import 'package:capstone_ui/Components/BottomNavBar/NavItem.dart';
// import 'package:capstone_ui/size_config.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:provider/provider.dart';

// class MyBottomNavBar extends StatelessWidget {
//   const MyBottomNavBar({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     double defaultSize = SizeConfig.defaultSize;
//     return Consumer<NavItems>(
//       builder: (context, navItems, child) => Container(
//         padding: EdgeInsets.symmetric(horizontal: 30),
//         decoration: BoxDecoration(color: Colors.white, boxShadow: [
//           BoxShadow(
//             offset: Offset(0, -7),
//             blurRadius: 30,
//             color: Color(0xFF4B1A39).withOpacity(0.2),
//           )
//         ]),
//         child: SafeArea(
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: List.generate(
//                 navItems.items.length,
//                 (index) => buildIconNavBarItem(
//                       isActive: navItems.selectedIndex == index ? true : false,
//                       icon: navItems.items[index].icon,
//                       press: () {
//                         navItems.changeNavIndex(index: index);
//                         if (navItems.items[index].destinationChecker())
//                           Navigator.push(
//                             (context),
//                             MaterialPageRoute(
//                               builder: (context) =>
//                                   navItems.items[index].destination!,
//                             ),
//                           );
//                       },
//                     )),
//           ),
//         ),
//       ),
//     );
//   }

//   IconButton buildIconNavBarItem(
//       {String? icon, Function? press, bool isActive = false}) {
//     return IconButton(
//         onPressed: () {
//           press;
//         },
//         icon: SvgPicture.asset(
//           icon!,
//           color: isActive ? Colors.green : Color.fromARGB(255, 155, 155, 144),
//           height: 22,
//         ));
//   }
// }

import 'package:flutter/material.dart';
import 'package:capstone_ui/Components/BottomNavBar/NavItem.dart';
import 'package:provider/provider.dart';

class MyBottomNavBar extends StatelessWidget {
  const MyBottomNavBar({Key? key, this.index}) : super(key: key);
  final int? index;

  // void onTapped(int index){
  //   if(NavItems().items[index].destinationChecker()) {
  //     Navigator.push(context, )
  //   }
  //   navItems.changeNavIndex(index: index);
  //                       if (navItems.items[index].destinationChecker())
  //                         Navigator.push(
  //                           (context),
  //                           MaterialPageRoute(
  //                             builder: (context) =>
  //                                 navItems.items[index].destination!,
  //                           ),
  //                         );
  // }

  @override
  Widget build(BuildContext context) {
    return Consumer<NavItems>(
      builder: (context, navItems, child) => BottomNavigationBar(
        currentIndex: index ?? 0,
        showUnselectedLabels: false,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          if (NavItems().items[index].destinationChecker()) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => navItems.items[index].destination!,
              ),
            );
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Trang chủ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.newspaper),
            label: 'Tin tức',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Tài khoản',
          ),
        ],
      ),
    );
  }
}
