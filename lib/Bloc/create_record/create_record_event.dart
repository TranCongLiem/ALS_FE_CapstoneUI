part of 'create_record_bloc.dart';

@freezed
class CreateRecordEvent with _$CreateRecordEvent {
  const factory CreateRecordEvent.recordNameChanged(String recordName) =
      _RecordNameChanged;
  const factory CreateRecordEvent.linkAudioChanged(String linkAudio) =
      _LinkAudioChanged;
  const factory CreateRecordEvent.createRecordRequest() = _CreateRecordRequest;
  const factory CreateRecordEvent.createCheckRequested() = _CreateCheckRequested;
  const factory CreateRecordEvent.setStateFlase() = _SetStateFlase;
}
