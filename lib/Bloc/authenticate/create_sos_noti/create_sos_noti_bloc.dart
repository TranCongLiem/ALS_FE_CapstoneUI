import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../Model/CreatePushNotiToSupporter_model.dart';
import '../../../Model/getProfileUser_model.dart';
import '../../../services/api_User.dart';

part 'create_sos_noti_event.dart';
part 'create_sos_noti_state.dart';

// class CreateSosNotiBloc extends Bloc<CreateSosNotiEvent, CreateSosNotiState> {
//   CreateSosNotiBloc() : super(_Initial()) {
//     on<CreateSosNotiEvent>((event, emit) {
//       // TODO: implement event handler
//     });
//   }
// }

class CreateSosNotiBloc extends Bloc<CreateSosNotiEvent, SendSOSBlocState> {
  final UserPatientService _userPatientService;

  CreateSosNotiBloc(this._userPatientService) : super(SendSOSBlocInitial()) {
    on<SendSOSEvent>((event, emit) async {
      // TODO: implement event handler
      // final request = event.;
      final patientId = event.userId;
      GetRelatinshipWithUserByIdRequestModel relationRequest =
          GetRelatinshipWithUserByIdRequestModel(userId: patientId);
      GetRelatinshipWithUserByIdResponeModel relationResponse;
      GetPhoneByIdResponeModel getPhoneByIdResponeModel;
      relationResponse =
          await _userPatientService.getRelatinshipWithUserById(relationRequest);

      if (relationResponse.RelationshipWith!.isEmpty ||relationResponse.RelationshipWith == null) {
        getPhoneByIdResponeModel = GetPhoneByIdResponeModel(phoneNumber: "You does not link any supporter");
        emit(SendSOSFailBlocState(getPhoneByIdResponeModel));
      } else {      
        GetPhoneByIdRequestModel phoneRequest= GetPhoneByIdRequestModel(userId:relationResponse.RelationshipWith??'' );
        getPhoneByIdResponeModel =
            await _userPatientService.getPhoneNumberById(phoneRequest);
        emit(SendSOSSuccessBlocState(getPhoneByIdResponeModel));

      }    
    });
  }
   @override
  Future<void> close() {
    // dispose
    return super.close();
  }
}
