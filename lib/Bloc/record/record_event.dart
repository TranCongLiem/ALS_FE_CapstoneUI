part of 'record_bloc.dart';

abstract class RecordBlocEvent {
  const RecordBlocEvent();
}

class LoadRecordEvent extends RecordBlocEvent{
  final String userId;
  const LoadRecordEvent({required this.userId});

  @override
  // TODO: implement props
  List<Object?> get props => [];

}