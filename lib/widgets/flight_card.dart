import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:dami_rocket_app/spaceX_api/rocket_api.dart';
import 'package:dio/dio.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class FlightCard extends StatelessWidget {
  String flightName;
  String flightNo;
  DateTime flightDate;

  FlightCard(
      {required this.flightName,
      required this.flightNo,
      required this.flightDate});

  @override
  Widget build(BuildContext context) {
    final logger = Logger();
    final dio = Dio();
    String formatedDate = DateFormat('dd. MM. yyyy H:m').format(flightDate);
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        elevation: 3,
        child: ListTile(
          onTap: () {
            dio.options.headers["spacex-key"] = "spacex-key";
            final client = RestClient(dio);
            client.getRockets().then((func) {
              for(int x = 0; x < func.length; x++){
                print(func[x].name);
              }


/*              for(int x = 0; x < func.length; x++){
                print(func[x].toString());
              }*/
            });
/*            print(DateFormat('cs_CS').format(flightDate));
            print(DateFormat('cs_CS').format(flightDate).toString());
            print(DateTime.now());
            print(DateFormat('dd. MM. yyyy H:m').format(flightDate));*/
          },
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          leading: Column(
            children: const <Widget>[
              Spacer(),
              Icon(
                Icons.accessible_forward_rounded,
                size: 50,
              ),
              Spacer()
            ],
          ),
          title: Text(
            flightName,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text.rich(TextSpan(children: [
                const TextSpan(
                    text: 'Flight number: ',
                    style: TextStyle(
                        fontSize: 11,
                        height: 16 / 11,
                        color: Color.fromRGBO(155, 165, 174, 1),
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w700)),
                TextSpan(
                    text: flightNo,
                  style: const TextStyle(
                    fontSize: 11,
                    height: 16 / 11,
                    color: Color.fromRGBO(155, 165, 174, 1),
                    fontFamily: 'Roboto',
                  )
                )
              ])),
              Text.rich(TextSpan(children: [
                const TextSpan(
                    text: 'Flight date: ',
                    style: TextStyle(
                        fontSize: 11,
                        height: 16 / 11,
                        color: Color.fromRGBO(155, 165, 174, 1),
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w700)),
                TextSpan(
                    text: formatedDate,
                    style: const TextStyle(
                      fontSize: 11,
                      height: 16 / 11,
                      color: Color.fromRGBO(155, 165, 174, 1),
                      fontFamily: 'Roboto',
                    )
                )
              ]))

/*              Text(
                'Flight number: $flightNo',
                style: Theme.of(context).textTheme.labelSmall,
              ),
              Text('Flight date $formatedDate')*/
            ],
          ),
          trailing: Column(
            children: [Spacer(), Icon(Icons.arrow_forward_ios, size: 15,), Spacer()],
          ),
          isThreeLine: true,
        ),
      ),
    );
  }
}
