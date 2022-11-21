import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../bloc/bloc_events/home_screen_events.dart';
import '../bloc/bloc_objects/app_bloc_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/bloc_events/app_events.dart';
import '../screens/home_screen.dart';

class OnErrorBodyHome extends StatefulWidget {

  @override
  State<OnErrorBodyHome> createState() => _OnErrorBodyHomeState();
}


class _OnErrorBodyHomeState extends State<OnErrorBodyHome> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: <Widget>[
          const Spacer(),
          Text(
            'DATA DOWNLOAD \n FAILED',
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .merge(const TextStyle(color: Color.fromRGBO(155, 165, 174, 1))),
          ),
          const SizedBox(
            height: 28,
          ),
          TextButton(
              onPressed: () {
                BlocProvider.of<AppBloc>(context).add(LoadUserEvent());
              },
              child: Text('TRY AGAIN'),),
          Spacer(),
        ],
      ),
    );
  }
}
