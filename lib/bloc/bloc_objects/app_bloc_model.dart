import 'dart:io';

import '../../spaceX_api/rocket_api.dart';
import '../bloc_events/app_events.dart';
import '../bloc_states/app_state.dart';
import '../repositories/rocket_repository.dart';
import 'package:bloc/bloc.dart';

class AppBloc extends Bloc<AppEvents, UserState> {
  final RocketRepository _rocketList;

  AppBloc(this._rocketList) : super(UserLoadingState()){
    on<LoadUserEvent>((event, emit) async {
      emit(UserLoadingState());
      try{
        final rocketCardData = await _rocketList.getRocketRepository();
        print(rocketCardData.runtimeType);
        emit(UserLoadedState(rocketCardData));
/*        if(rocketCardData.isNotEmpty){
          emit(UserLoadedState(rocketCardData));
        }
        if(rocketCardData.isEmpty){
          emit(UserErrorState());
        }*/
      }
      catch (e) {
        emit(UserErrorState());
      }


    });
  }
}