import 'package:dami_rocket_app/bloc/repositories/rocket_repository.dart';
import 'package:dami_rocket_app/spaceX_api/rocket_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//test importy
import 'package:logger/logger.dart';
import 'package:dio/dio.dart';

// widgety
import '../widgets/flight_card.dart';

// pomocne tridy
import 'package:bloc/bloc.dart';
import '../bloc/bloc_events/app_events.dart';
import '../bloc/bloc_states/app_state.dart';
import '../bloc/bloc_objects/app_bloc_model.dart';

//importy ktere pak smazat
import '../DUMMY_DATA.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // asynchronni metoda, ktera zavola api

  @override
  void initState() {
    super.initState();
    // spustit metodu z radku 21
  }

  final logger = Logger();

  final dio = Dio();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          AppBloc(RepositoryProvider.of<RocketRepository>(context))
            ..add(LoadUserEvent()),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
          elevation: 10,
          toolbarHeight: 117,
          //117 - NotiBar?
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(8.0),
                  bottomRight: Radius.circular(8.0))),

          title: Column(
            children: [
              Image.asset(
                'lib/assets/pics/dami_logo_white.png',
                fit: BoxFit.contain,
                scale: 3,
              ),
              const SizedBox(height: 8),
              Text('SPACE X FLIGHT',
                  style: Theme.of(context).textTheme.labelMedium)
            ],
          ),
          centerTitle: true,
        ),
        body: BlocBuilder<AppBloc, UserState>(
          builder: (context, state) {
            if(state is UserLoadingState) {
              return Center(child: CircularProgressIndicator(),);
            }
            if(state is UserLoadedState){
              List<Rocket> rocketCardData = state.rocketCardData;
              return ListView.builder(
                  itemCount: rocketCardData.length,
                  itemBuilder: (context, i) => (Column(
                    children: <Widget>[
                      FlightCard(
                          flightName: rocketCardData[i].name!,
                          flightNo: rocketCardData[i].flight_number,
                          flightDate: DateTime.now())
                    ],
                  )));
            }
            if(state is UserErrorState){
              return Center(child: Text('Something went wrong'),);
            }
            else{
              return Center(child: Text('something went wrong'),);
            }
          },
        )
      ),
    );
  }
}
