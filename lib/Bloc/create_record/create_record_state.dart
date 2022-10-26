part of 'create_record_bloc.dart';

@freezed
@immutable
class CreateRecordState with _$CreateRecordState {
  const factory CreateRecordState({
    required String userId,
    required String recordName,
    required String linkAudio,
    required bool isCreated,
    bool? success,
    String? message,
    String? errorMessage,
  }) = _CreateRecordState;

  factory CreateRecordState.initial() => CreateRecordState(
        userId: '',
        recordName: '',
        linkAudio: '',
        isCreated: false,
      );
}
