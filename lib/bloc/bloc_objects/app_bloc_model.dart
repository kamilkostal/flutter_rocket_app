import 'dart:io';

import 'package:dami_rocket_app/bloc/bloc_states/flight_detail_states.dart';

import '../../spaceX_api/rocket_api.dart';
import '../bloc_events/app_events.dart';
import '../bloc_events/home_screen_events.dart';
import '../bloc_events/flight_detail_events.dart';
import '../bloc_states/home_screen_states.dart';
import '../bloc_states/app_state.dart';
import '../repositories/rocket_repository.dart';
import '../repositories/rocket_detail_repository.dart';
import 'package:bloc/bloc.dart';

class AppBloc extends Bloc<AppEvents, UserState> {
  final RocketRepository _rocketList;

  AppBloc(this._rocketList) : super(UserLoadingState()){
    on<LoadUserEvent>((event, emit) async {
      emit(UserLoadingState());
      try{
        final rocketCardDataList = await _rocketList.getRocketRepository();
        print(rocketCardDataList.runtimeType);
        emit(UserLoadedState(rocketCardDataList));
      }
      catch (e) {
        emit(UserErrorState());
      }
    });
  }
}

class FlightDetailBloc extends Bloc<AppEvents, UserState> {
  final RocketDetailRepository _rocketCard;
  String id;

  FlightDetailBloc(this._rocketCard, this.id) : super(UserLoadingState()){
    on<LoadUserEvent>((event, emit) async {
      emit(UserLoadingState());
      try{
        final rocketDetail = await _rocketCard.getRocketDetailRepository(id);
        emit(CardDetailLoadedState(rocketDetail));
      }
      catch (e) {
        emit(UserErrorState());
      }
    });
  }
}
