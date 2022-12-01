part of 'text_to_spech_bloc.dart';

// @freezed
// class TextToSpechEvent with _$TextToSpechEvent {
//   const factory TextToSpechEvent.started() = _Started;
// }

abstract class TextToSpeechBlocEvent {
  const TextToSpeechBlocEvent();
}
 class TextToSpeechConvertEvent extends TextToSpeechBlocEvent {
  final TextToSpeechRequestModel textToSpeechRequestModel;

  const TextToSpeechConvertEvent({required this.textToSpeechRequestModel});

  @override
  // TODO: implement props
  List<Object?> get props => [textToSpeechRequestModel];
  
  // LoadExerciseByCateEvent copyWith({String? categoryId}) {
  //   return LoadExerciseByCateEvent(categoryId: categoryId?? this.categoryId);
  // }
}