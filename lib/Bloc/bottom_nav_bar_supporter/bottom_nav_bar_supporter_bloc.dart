import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'bottom_nav_bar_supporter_event.dart';
part 'bottom_nav_bar_supporter_state.dart';

class BottomNavBarSupporterBloc
    extends Bloc<BottomNavBarSupporterEvent, BottomNavBarSupporterState> {
  BottomNavBarSupporterBloc() : super(BottomNavBarSupporterInitial()) {
    on<BottomNavBarSupporterItemSelected>((event, emit) {
      emit(BottomNavBarSupporterIndex(event.index));
    });
  }
}
