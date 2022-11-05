part of 'user_detail_bloc.dart';

abstract class GetDeatailBlocEvent {
  const GetDeatailBlocEvent();
}

class LoadDetailUserEvent extends GetDeatailBlocEvent {
  final String userId;

LoadDetailUserEvent({required this.userId});
  @override
  // TODO: implement props
  String get props => '';
}
