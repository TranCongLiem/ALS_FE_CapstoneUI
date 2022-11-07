import 'package:capstone_ui/Constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:capstone_ui/Components/BottomNavBar/NavItem.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Bloc/bottom_nav_bar_supporter/bottom_nav_bar_supporter_bloc.dart';
import 'NavItem_supporter.dart';

class MyBottomNavBarSupporter extends StatelessWidget {
  const MyBottomNavBarSupporter({Key? key, this.index}) : super(key: key);
  final int? index;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavBarSupporterBloc, BottomNavBarSupporterState>(
        builder: (context, state) {
      if (state is BottomNavBarSupporterIndex) {
        return BottomNavigationBar(
          currentIndex: state.index,
          showUnselectedLabels: true,
          selectedItemColor: greenALS,
          unselectedItemColor: Colors.grey,
          unselectedFontSize: 15,
          selectedFontSize: 15,
          iconSize: 30.0,
          onTap: (index) {
            if (NavItemsSupporter().items[index].destinationChecker()) {
              BlocProvider.of<BottomNavBarSupporterBloc>(context)
                  .add(BottomNavBarSupporterItemSelected(index));
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      NavItemsSupporter().items[index].destination!,
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
              icon: Icon(Icons.notifications),
              label: 'Thông báo',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.newspaper),
              label: 'Kiến thức',
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
