part of 'text_to_spech_bloc.dart';

// @freezed
// class TextToSpechState with _$TextToSpechState {
//   const factory TextToSpechState.initial() = _Initial;
// }

@immutable
abstract class TextToSpeechBlocState {}
//const ExerciseBlocState();

class TextToSpeechBlocInitial extends TextToSpeechBlocState {
 TextToSpeechResponeModel textToSpeechResponeModel=   TextToSpeechResponeModel(success: false, message: "");
  
}
class TextToSpeechConvertSuccessState extends TextToSpeechBlocState {

  late TextToSpeechResponeModel textToSpeechResponeModel;
  
  TextToSpeechConvertSuccessState(this.textToSpeechResponeModel);

}