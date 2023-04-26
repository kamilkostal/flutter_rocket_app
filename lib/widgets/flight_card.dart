// externi packages
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// pomocne tridy
import '../screens/flight_detail_screen.dart';

class FlightCard extends StatelessWidget {
  final String flightName;
  final int flightNo;
  final DateTime flightDate;
  final String rocketId;

  FlightCard(
      {required this.flightName,
      required this.flightNo,
      required this.flightDate,
      required this.rocketId});

  @override
  Widget build(BuildContext context) {
    String formatedDate = DateFormat('dd. MM. yyyy H:m').format(flightDate);
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        elevation: 3,
        child: ListTile(
          visualDensity: const VisualDensity(vertical: 0.5),
          onTap: () {
            Navigator.of(context).pushNamed(FlightDetailScreen.routeName, arguments: ArgumentObject(rocketId: rocketId, rocketName: flightName));

          },
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          leading: Column(
            children: <Widget>[
              Container(
                  height: 57,
                  width: 57,
                  child: Image.asset(
                    'lib/assets/pics/rocket_icon_list_item.png',
                    fit: BoxFit.cover,
                  )),
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
                    text: flightNo.toString(),
                    style: const TextStyle(
                      fontSize: 11,
                      height: 16 / 11,
                      color: Color.fromRGBO(155, 165, 174, 1),
                      fontFamily: 'Roboto',
                    ))
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
                    ))
              ]))

/*              Text(
                'Flight number: $flightNo',
                style: Theme.of(context).textTheme.labelSmall,
              ),
              Text('Flight date $formatedDate')*/
            ],
          ),
          trailing: Column(
            children: const [
              Spacer(),
              Icon(
                Icons.arrow_forward_ios,
                size: 15,
              ),
              Spacer()
            ],
          ),
          isThreeLine: true,
        ),
      ),
    );
  }
}

class ArgumentObject{
  String rocketName;
  String rocketId;
  ArgumentObject({required this.rocketId, required this.rocketName});
}
