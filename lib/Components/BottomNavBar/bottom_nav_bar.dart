import 'package:capstone_ui/Bloc/bottom_nav_bar/bottom_nav_bar_bloc.dart';
import 'package:capstone_ui/Constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:capstone_ui/Components/BottomNavBar/NavItem.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class MyBottomNavBar extends StatelessWidget {
  const MyBottomNavBar({Key? key, this.index}) : super(key: key);
  final int? index;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavBarBloc, BottomNavBarState>(
        builder: (context, state) {
      if (state is BottomNavBarIndex) {
        return BottomNavigationBar(
          currentIndex: state.index,
          showUnselectedLabels: false,
          selectedItemColor: greenALS,
          unselectedItemColor: Colors.grey,
          unselectedFontSize: 20,
          selectedFontSize: 20,
          iconSize: 40.0,
          onTap: (index) {
            if (NavItems().items[index].destinationChecker()) {
              BlocProvider.of<BottomNavBarBloc>(context)
                  .add(BottomNavBarItemSelected(index));
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NavItems().items[index].destination!,
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
              icon: Icon(Icons.category),
              label: 'Trợ giúp',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.newspaper),
              label: 'Kiến thức',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today_outlined),
              label: 'Tập luyện',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Tài khoản',
            ),
          ],
        );
      }
      return Container();
    });
  }
}
