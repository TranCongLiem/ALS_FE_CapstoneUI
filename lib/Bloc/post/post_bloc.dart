import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../Model/getListPost_model.dart';
import '../../services/api_Post.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBlocBloc extends Bloc<PostBlocEvent, PostBlocState> {
 final PostService _PostService;
 
 
 
  PostBlocBloc(this._PostService) : super(PostBlocInitial()) {
    on<LoadPostEvent>((event, emit) async {
      // TODO: implement event handler
      // PostByIdReQuestModel PostByIdReQuestModel = PostByIdReQuestModel(userId: userId)
      final list= await _PostService.getAllPost();
      emit(PostLoadedState(list));
    });
    // on<LoadPostEventByAdmin>((event, emit) async {
    //   // TODO: implement event handler
    //   // PostByIdReQuestModel PostByIdReQuestModel = PostByIdReQuestModel(userId: userId)
    //   final list= await _PostService.getPostByIdAdmin();
    //   emit(PostLoadedState(list));
    // });
    
}
}
