import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import '../bloc/bloc_objects/app_bloc_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/bloc_events/app_events.dart';
import '../screens/home_screen.dart';

class HomeScreenFailed extends StatefulWidget {
  @override
  State<HomeScreenFailed> createState() => _HomeScreenFailedState();
}

class _HomeScreenFailedState extends State<HomeScreenFailed> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: <Widget>[
          Spacer(),
          Text(
            'DATA DOWNLOAD \n FAILED',
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .merge(TextStyle(color: Color.fromRGBO(155, 165, 174, 1))),
          ),
          SizedBox(
            height: 28,
          ),
          TextButton(
              onPressed: () {
                BlocProvider.of<AppBloc>(context).add(LoadUserEvent());
              },
              child: Text('TRY AGAIN'),),
/*          TextButton(
            onPressed: () {},
            child: Container(
                alignment: Alignment.center,
                height: 46,
                width: 327,
                child: Text('baaa')),
            style: TextButton.styleFrom(
                elevation: 4,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                foregroundColor: Colors.white,
                backgroundColor:
                Theme.of(context).colorScheme.secondary),
          ),*/
          Spacer(),
        ],
      ),
    );
  }
}
