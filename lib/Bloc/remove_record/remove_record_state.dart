part of 'remove_record_bloc.dart';

@freezed
@immutable
class RemoveRecordState with _$RemoveRecordState {
const factory RemoveRecordState({
    required String recordId,
    required bool isRemoved,
    String? errorMessage,
    bool? success,
    String? message,
  }) = _RemoveRecordState;

  factory RemoveRecordState.initial() => RemoveRecordState(
        recordId: '',
        isRemoved: false,
      );
}
