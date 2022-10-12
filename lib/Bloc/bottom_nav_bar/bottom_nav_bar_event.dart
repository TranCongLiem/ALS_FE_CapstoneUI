part of 'bottom_nav_bar_bloc.dart';

@immutable
abstract class BottomNavBarEvent {}

class BottomNavBarItemSelected extends BottomNavBarEvent {
  late int index;

  BottomNavBarItemSelected(int index) {
    this.index = index;
  }
}
