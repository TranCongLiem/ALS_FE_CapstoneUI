import 'package:bloc/bloc.dart';
import 'package:capstone_ui/services/api_FPTAI.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../Model/textToSpeech_model.dart';

part 'text_to_spech_event.dart';
part 'text_to_spech_state.dart';

// class TextToSpechBloc extends Bloc<TextToSpechEvent, TextToSpechState> {
//   TextToSpechBloc() : super(_Initial()) {
//     on<TextToSpechEvent>((event, emit) {
//       // TODO: implement event handler
//     });
//   }
// }

class TextToSpechBloc extends Bloc<TextToSpeechBlocEvent, TextToSpeechBlocState> {
 final FPTAIService _fptaiService;
 
 
 
  TextToSpechBloc(this._fptaiService) : super(TextToSpeechBlocInitial()) {
    on<TextToSpeechConvertEvent>((event, emit) async {
      // TODO: implement event handler
      final request= event.textToSpeechRequestModel;
      final list= await _fptaiService.convertTextToSpeech(request);
      emit(TextToSpeechConvertSuccessState(list));
      
    });   
  }
}
