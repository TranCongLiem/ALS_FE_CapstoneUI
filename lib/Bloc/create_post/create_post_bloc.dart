import 'package:bloc/bloc.dart';
import 'package:capstone_ui/Model/createPost_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../services/api_Post.dart';

part 'create_post_event.dart';
part 'create_post_state.dart';
part 'create_post_bloc.freezed.dart';

class CreatePostBloc extends Bloc<CreatePostEvent, CreatePostState> {
  final PostService _PostService;

  CreatePostBloc(this._PostService) : super(CreatePostState.initial()) {
    on<_CreatePostRequest>((event, emit) async {
      CreatePostReQuestModel reqModel = CreatePostReQuestModel(
          userId: event.userId,
          image: state.image,
          caption: state.caption);
      final result = await _PostService.createPost(reqModel);
      if (result.message != null && result.success != null) {
        emit(state.copyWith(
          message: result.message ?? '',
          success: result.success,
          isCreated: true,
        ));
      } else {
        emit(state.copyWith(errorMessage: "  "));
      }
    });

    on<_ImageChanged>((event, emit) {
      emit(state.copyWith(image: event.image));
    });

    on<_CaptionChanged>((event, emit) {
      emit(state.copyWith(caption: event.caption));
    });

    on<_CreateCheckRequested>((event, emit) {
      emit(state.copyWith(isCreated: _PostService.isCreated()));
    });

    on<_SetStateFlase>((event, emit) {
        emit(state.copyWith(
          isCreated: false,
        ));
    });
  }
}