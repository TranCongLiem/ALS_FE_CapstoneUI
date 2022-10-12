part of 'bottom_nav_bar_bloc.dart';

@immutable
abstract class BottomNavBarState {}

class BottomNavBarInitial extends BottomNavBarState {}

class BottomNavBarIndex extends BottomNavBarState {
  final int index;

  BottomNavBarIndex(this.index);
}
