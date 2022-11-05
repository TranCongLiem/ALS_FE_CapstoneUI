import 'package:bloc/bloc.dart';
import 'package:capstone_ui/Model/reactPost_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../services/api_ReactPost.dart';

part 'react_post_event.dart';
part 'react_post_state.dart';
part 'react_post_bloc.freezed.dart';

class ReactPostBloc extends Bloc<ReactPostEvent, ReactPostState> {
  final ReactPostService _reactPostState;
  ReactPostBloc(this._reactPostState) : super(ReactPostState.initial()) {
    on<_CreateReactPostRequest>((event, emit) async {
      CreateReactPostReQuestModel reqModel = CreateReactPostReQuestModel(
          userId: event.userId, postId: state.postId);
      final result = await _reactPostState.createReactPost(reqModel);
      if (result.message != null && result.success != null) {
        emit(state.copyWith(
          message: result.message ?? '',
          success: result.success,
        ));
      } else {
        emit(state.copyWith(errorMessage: "  "));
      }
    });

    on<_UpdateReactPostRequest>((event, emit) async {
      UpdateReactPostReQuestModel reqModel = UpdateReactPostReQuestModel(
          userId: event.userId, postId: state.postId, status: event.status);
      final result = await _reactPostState.updateReactPost(reqModel);
      if (result.message != null && result.success != null) {
        emit(state.copyWith(
          message: result.message ?? '',
          success: result.success,
        ));
      } else {
        emit(state.copyWith(errorMessage: "  "));
      }
    });

    on<_UpdateReactPostRequest>((event, emit) async {
      CheckExistReactUserRequestModel reqModel = CheckExistReactUserRequestModel(
          userId: event.userId, postId: state.postId);
      final result = await _reactPostState.CheckExistReact(reqModel);
        emit(state.copyWith(
          check: result.check,
        ));
    });

  }
}
