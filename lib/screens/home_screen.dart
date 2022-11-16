import 'package:dami_rocket_app/spaceX_api/rocket_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//test importy
import 'package:logger/logger.dart';
import 'package:dio/dio.dart';

//importy ktere pak smazat
import '../DUMMY_DATA.dart';
import '../widgets/flight_card.dart';

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
    return Scaffold(
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
      body: ListView.builder(
          itemCount: dummy_flights.length,
          itemBuilder: (_, i) => (Column(
                children: <Widget>[
                  FlightCard(
                      flightName: dummy_flights[i]['DUMMY_NAME']!,
                      flightNo: dummy_flights[i]['DUMMY_FLIGHT_NO']!,
                      flightDate: dummy_flights[i]['DUMMY_FLIGHT_DATE']!)
                ],
              ))),
    );
  }
}
