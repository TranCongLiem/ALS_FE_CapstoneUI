part of 'record_bloc.dart';

@immutable
abstract class RecordBlocState {}
//const ExerciseBlocState();

class RecordBlocInitial extends RecordBlocState {
  @override
  // TODO: implement props
  List<Object> get props => [];
  
}
class RecordLoadedState extends RecordBlocState {

  List<RecordById> list;
  
  RecordLoadedState(this.list);
  @override
  // TODO: implement props
  List<Object?> get props => [list];

}
