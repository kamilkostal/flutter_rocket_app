import 'package:dami_rocket_app/spaceX_api/rocket_api.dart';
import 'package:dio/dio.dart';

import '../bloc_data/bloc_rocket_provider.dart';
import '../bloc_events/bloc_home_screen_events.dart';
import '../bloc_state/bloc_home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends Bloc<HomeScreenEvent, HomeScreenState> {
  HomeBloc() : super(const HomeInitialState()) {
    on<FetchDataEvent>(_onFetchDataEvent);
  }

  void _onFetchDataEvent(FetchDataEvent event,
      Emitter<HomeScreenState> emitter,) async {
    try {
      emitter(const HomeLoadingState());
      final dio = Dio();
      dio.options.headers["spacex-key"] = "spacex-key";
      final client = RestClient(dio);
      List<Rocket> finalRocketlist = [... await client.getRockets()];
      emitter(HomeSuccessFetchDataState(rockets: finalRocketlist));
    }
    catch (error){
      HomeErrorFetchDataState(
        errorMessage: "aaaa rip"
      );
    }
  }


}