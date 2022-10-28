part of 'remove_record_bloc.dart';

@freezed
class RemoveRecordEvent with _$RemoveRecordEvent {
  const factory RemoveRecordEvent.removeRecordRequest() = _RemoveRecordRequest;
  const factory RemoveRecordEvent.getRecordId(String recordId) = _GetRecordId;
  const factory RemoveRecordEvent.removeCheckRequested() = _RemoveCheckRequested;
  const factory RemoveRecordEvent.setStateFlase() = _SetStateFlase;
}