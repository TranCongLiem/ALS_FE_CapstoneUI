part of 'record_bloc.dart';

abstract class RecordBlocEvent {
  const RecordBlocEvent();
}

class LoadRecordEvent extends RecordBlocEvent{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}