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

// class CreateRecordState extends RecordBlocState{
//   const factory CreateRecordState({
//     required String userId,
//     required String recordName,
//     required String linkAudio,
//   }) = CreateRecordState;

//   factory CreateRecordState.initial() => CreateRecordState(
//         userId: '',
//         recordName: '',
//         linkAudio: '',
//       );
// }
