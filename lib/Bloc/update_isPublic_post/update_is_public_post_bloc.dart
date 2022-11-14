import 'package:bloc/bloc.dart';
import 'package:capstone_ui/Model/updatePost_model.dart';
import 'package:capstone_ui/services/api_Post.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_is_public_post_event.dart';
part 'update_is_public_post_state.dart';
part 'update_is_public_post_bloc.freezed.dart';

class UpdateIsPublicPostBloc extends Bloc<UpdateIsPublicPostEvent, UpdateIsPublicPostState> {
  final PostService _postState;
  UpdateIsPublicPostBloc(this._postState) : super(UpdateIsPublicPostState.initial()) {
    on<_UpdateIsPublicPostRequest>((event, emit) async {
      UpdatePostReQuestModel reqModel = UpdatePostReQuestModel(
          postId : event.postId, isPublic : event.isPublic);
      final result = await _postState.updateIsPublicPost(reqModel);
      if (result.message != null && result.success != null) {
        emit(state.copyWith(
          message: result.message ?? '',
          success: result.success,
        ));
      } else {
        emit(state.copyWith(errorMessage: "  "));
      }    
      });
  }
}
