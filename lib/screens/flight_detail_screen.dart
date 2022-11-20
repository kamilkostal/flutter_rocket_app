import 'package:dami_rocket_app/bloc/bloc_events/app_events.dart';
import 'package:dami_rocket_app/bloc/bloc_events/flight_detail_events.dart';
import 'package:dami_rocket_app/bloc/bloc_events/home_screen_events.dart';
import 'package:dami_rocket_app/bloc/bloc_objects/app_bloc_model.dart';
import 'package:dami_rocket_app/bloc/bloc_states/app_state.dart';
import 'package:dami_rocket_app/bloc/bloc_states/flight_detail_states.dart';
import 'package:dami_rocket_app/bloc/bloc_states/home_screen_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/repositories/rocket_detail_repository.dart';

class FlightDetailScreen extends StatefulWidget {
  static const String routeName = '/flight-detail';

  const FlightDetailScreen({super.key});

  @override
  State<FlightDetailScreen> createState() => _FlightDetailScreenState();
}

class _FlightDetailScreenState extends State<FlightDetailScreen> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String id = '5e9d0d95eda69955f709d1eb';
    return BlocProvider(
      create: (context) => FlightDetailBloc(RepositoryProvider.of<RocketDetailRepository>(context), id)..add(LoadUserEvent()),
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 96,
          title: Text(
            'neco',
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .merge(TextStyle(color: Colors.white)),
          ),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        ),
        body: BlocBuilder<FlightDetailBloc, UserState>(
          builder: (context, state){
            if (state is UserLoadingState){
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if(state is UserErrorState){
              return Center(
                child: Text('debil'),
              );
            }
            if(state is CardDetailLoadedState){
              return Center(
                child: Text('me poser jestli tohle bude fungovat'),
              );
            }
            else{
              return Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(24.0),
                    child: Text(
                      '"Lorem ipsum dolor sit amet, consectetur adipiscing elit, '
                          'sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. '
                          'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. '
                          'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. '
                          'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .merge(TextStyle(fontWeight: FontWeight.w400)),
/*                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w400,
                          // letterSpacing: 20/14,
                          fontSize: 14),*/
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 24, left: 24, bottom: 24),
                    child: Row(
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            RichText(
                              //textAlign: TextAlign.left,
                              text: const TextSpan(
                                  text: 'Rocket: ',
                                  style: TextStyle(
                                    fontFamily: 'Roboto',
                                    fontSize: 11,
                                    height: 16 / 11,
                                    fontWeight: FontWeight.w900,
                                    color: Color.fromRGBO(155, 165, 174, 1),
                                  ),
                                  children: [
                                    TextSpan(
                                      text: 'Falcon 1',
                                      style: TextStyle(
                                        fontFamily: 'Roboto',
                                        fontSize: 11,
                                        height: 16 / 11,
                                        fontWeight: FontWeight.w700,
                                        color: Color.fromRGBO(155, 165, 174, 1),
                                      ),
                                    )
                                  ]),
                            ),
                            RichText(
                              //textAlign: TextAlign.left,
                              text: const TextSpan(
                                  text: 'Stages ',
                                  style: TextStyle(
                                    fontFamily: 'Roboto',
                                    fontSize: 11,
                                    height: 16 / 11,
                                    fontWeight: FontWeight.w900,
                                    color: Color.fromRGBO(155, 165, 174, 1),
                                  ),
                                  children: [
                                    TextSpan(
                                        text: '3',
                                        style: TextStyle(
                                          fontFamily: 'Roboto',
                                          fontSize: 11,
                                          height: 16 / 11,
                                          fontWeight: FontWeight.w700,
                                          color: Color.fromRGBO(155, 165, 174, 1),
                                        ))
                                  ]),
                            ),
                          ],
                        ),
                        Spacer(),
                        Column(children: <Widget>[
                          RichText(
                            text: const TextSpan(
                                text: 'Rocket: ',
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: 11,
                                  height: 16 / 11,
                                  fontWeight: FontWeight.w900,
                                  color: Color.fromRGBO(155, 165, 174, 1),
                                ),
                                children: [
                                  TextSpan(
                                      text: 'Falcon 1',
                                      style: TextStyle(
                                        fontFamily: 'Roboto',
                                        fontSize: 11,
                                        height: 16 / 11,
                                        fontWeight: FontWeight.w700,
                                        color: Color.fromRGBO(155, 165, 174, 1),
                                      ))
                                ]),
                          ),
                          RichText(
                            textAlign: TextAlign.start,
                            text: const TextSpan(
                                text: 'Stages ',
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: 11,
                                  height: 16 / 11,
                                  fontWeight: FontWeight.w900,
                                  color: Color.fromRGBO(155, 165, 174, 1),
                                ),
                                children: [
                                  TextSpan(
                                      text: '3',
                                      style: TextStyle(
                                        fontFamily: 'Roboto',
                                        fontSize: 11,
                                        height: 16 / 11,
                                        fontWeight: FontWeight.w700,
                                        color: Color.fromRGBO(155, 165, 174, 1),
                                      ))
                                ]),
                          ),
                        ]
                        ),
                        SizedBox(width: 94,)
                      ],
                    ),
                  ),
                  TextButton(onPressed: () {}, child: Text('WIKIPEDIA')),
                  Spacer()
                ],
              );
            }
          },
        )
      ),
    );
  }
}
