part of 'bottom_nav_bar_supporter_bloc.dart';

@immutable
abstract class BottomNavBarSupporterState {}

class BottomNavBarSupporterInitial extends BottomNavBarSupporterState {}

class BottomNavBarSupporterIndex extends BottomNavBarSupporterState {
  final int index;

  BottomNavBarSupporterIndex(this.index);
}
