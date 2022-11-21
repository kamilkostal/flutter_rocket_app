import 'package:dami_rocket_app/bloc/bloc_events/app_events.dart';
import 'package:dami_rocket_app/bloc/bloc_events/flight_detail_events.dart';
import 'package:dami_rocket_app/bloc/bloc_events/home_screen_events.dart';
import 'package:dami_rocket_app/bloc/bloc_objects/app_bloc_model.dart';
import 'package:dami_rocket_app/bloc/bloc_states/app_state.dart';
import 'package:dami_rocket_app/bloc/bloc_states/flight_detail_states.dart';
import 'package:dami_rocket_app/bloc/bloc_states/home_screen_states.dart';
import 'package:dami_rocket_app/spaceX_api/rocket_api.dart';
import 'package:dami_rocket_app/widgets/flight_card.dart';
import '../bloc/repositories/rocket_detail_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/repositories/rocket_detail_repository.dart';
import '../widgets/on_error_body_home.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:dami_rocket_app/DUMMY_DATA.dart';
import '../widgets/on_error_body_detail.dart';

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
    final arguments =
        ModalRoute.of(context)!.settings.arguments as ArgumentObject;
    // final String id = arguments.rocketId;
    // String id = '5e9d0d95eda69955f709d1eb';
    // String id = dummyId;
    return BlocProvider(
      create: (context) => FlightDetailBloc(RocketDetailRepository())
        ..add(LoadCardDataEvent(arguments.rocketId)),
      child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 96,
            title: Text(
              arguments.rocketName,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .merge(TextStyle(color: Colors.white)),
              overflow: TextOverflow.fade,
            ),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          ),
          body: BlocBuilder<FlightDetailBloc, UserState>(
            builder: (context, state) {
              if (state is UserLoadingState) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is UserErrorState) {
                return OnErrorBodyDetail(arguments.rocketId);
              }
              if (state is CardDetailLoadedState) {
                RocketCardData rocketData = state.rocketCardDetail;
                return Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(24.0),
                      child: Text(
                        rocketData.description,
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
                      padding: const EdgeInsets.only(
                          right: 24, left: 24, bottom: 24),
                      child: Row(
                        children: <Widget>[
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              RichText(
                                //textAlign: TextAlign.left,
                                text: TextSpan(
                                    text: 'Rocket: ',
                                    style: const TextStyle(
                                      fontFamily: 'Roboto',
                                      fontSize: 11,
                                      height: 16 / 11,
                                      fontWeight: FontWeight.w900,
                                      color: Color.fromRGBO(155, 165, 174, 1),
                                    ),
                                    children: [
                                      TextSpan(
                                        text: rocketData.type,
                                        style: const TextStyle(
                                          fontFamily: 'Roboto',
                                          fontSize: 11,
                                          height: 16 / 11,
                                          fontWeight: FontWeight.w700,
                                          color:
                                              Color.fromRGBO(155, 165, 174, 1),
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
                                            color: Color.fromRGBO(
                                                155, 165, 174, 1),
                                          ))
                                    ]),
                              ),
                            ],
                          ),
                          Spacer(),
                          Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                RichText(
                                  text: TextSpan(
                                      text: 'Company: ',
                                      style: const TextStyle(
                                        fontFamily: 'Roboto',
                                        fontSize: 11,
                                        height: 16 / 11,
                                        fontWeight: FontWeight.w900,
                                        color: Color.fromRGBO(155, 165, 174, 1),
                                      ),
                                      children: [
                                        TextSpan(
                                            text: rocketData.company,
                                            style: const TextStyle(
                                              fontFamily: 'Roboto',
                                              fontSize: 11,
                                              height: 16 / 11,
                                              fontWeight: FontWeight.w700,
                                              color: Color.fromRGBO(
                                                  155, 165, 174, 1),
                                            ))
                                      ]),
                                ),
                                RichText(
                                  textAlign: TextAlign.start,
                                  text: TextSpan(
                                      text: 'Boosters: ',
                                      style: const TextStyle(
                                        fontFamily: 'Roboto',
                                        fontSize: 11,
                                        height: 16 / 11,
                                        fontWeight: FontWeight.w900,
                                        color: Color.fromRGBO(155, 165, 174, 1),
                                      ),
                                      children: [
                                        TextSpan(
                                            text:
                                                rocketData.boosters.toString(),
                                            style: const TextStyle(
                                              fontFamily: 'Roboto',
                                              fontSize: 11,
                                              height: 16 / 11,
                                              fontWeight: FontWeight.w700,
                                              color: Color.fromRGBO(
                                                  155, 165, 174, 1),
                                            ))
                                      ]),
                                ),
                              ]),
                          const SizedBox(
                            width: 94,
                          )
                        ],
                      ),
                    ),
                    TextButton(
                        onPressed: () {

                        },
                        child: Text('WIKIPEDIA')),
                    Spacer()
                  ],
                );
              } else {
                return Center(
                  child: Text('smula no'),
                );
              }
            },
          )),
    );
  }

/*  void loadContent(){
    BlocProvider.of<FlightDetailBloc>(context).add(LoadCardDataEvent());
  }*/

}
