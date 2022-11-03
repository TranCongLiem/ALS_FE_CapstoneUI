part of 'record_list_admin_bloc.dart';

@immutable
abstract class RecordAdminBlocState {}

class RecordAdminBlocInitial extends RecordAdminBlocState {
  @override
  // TODO: implement props
  List<Object> get props => [];
  
}
class RecordLoadedAdminState extends RecordAdminBlocState {

  List<RecordById> list;
  
  RecordLoadedAdminState(this.list);
  @override
  // TODO: implement props
  List<Object?> get props => [list];

}