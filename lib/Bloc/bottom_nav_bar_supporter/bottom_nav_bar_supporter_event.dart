part of 'bottom_nav_bar_supporter_bloc.dart';

@immutable
abstract class BottomNavBarSupporterEvent {}

class BottomNavBarSupporterItemSelected extends BottomNavBarSupporterEvent {
  late int index;

  BottomNavBarSupporterItemSelected(int index) {
    this.index = index;
  }
}
