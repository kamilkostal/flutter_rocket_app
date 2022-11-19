import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FlightDetailScreen extends StatelessWidget {
  static const String routeName = '/flight-detail';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Column(
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
/*              style: TextStyle(
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
      ),
    );
  }
}
