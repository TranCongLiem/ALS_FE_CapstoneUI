part of 'user_detail_bloc.dart';

abstract class GetDeatailBlocState {}

class GetDetailBlocInitial extends GetDeatailBlocState {
  @override
  // TODO: implement props
  String get props => '';
  
}
class GetDetailLoadedState extends GetDeatailBlocState {
   GetProfileUserByIdResponeModel getProfileUserByIdResponeModel;
  
  
  GetDetailLoadedState(this.getProfileUserByIdResponeModel);
  
  @override
  // TODO: implement props
  String get props => '';
}
