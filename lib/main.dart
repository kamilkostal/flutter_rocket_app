import 'package:dami_rocket_app/bloc/dami_app_cubit.dart';
import 'package:dami_rocket_app/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import './widgets/my_colors.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const DamiApp());
  FlutterNativeSplash.remove();
}

class DamiApp extends StatelessWidget {
  const DamiApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Color.fromRGBO(6, 31, 53, 1)
        ),
          /*primarySwatch: const MaterialColor(0xFF061F35, MyColors.damiMainColor),*/
          /*colorScheme: ColorScheme(primary: Color.fromRGBO(6, 31, 53, 1), secondary: Color.fromRGBO(128, 206, 27, 1)),*/
          textTheme: const TextTheme(
              displayLarge: TextStyle(
                  fontFamily: 'Roboto', fontSize: 57, height: 64 / 57),
              displayMedium: TextStyle(
                  fontFamily: 'Roboto', fontSize: 45, height: 52 / 45),
              displaySmall: TextStyle(
                  fontFamily: 'Roboto', fontSize: 36, height: 44 / 36),
              headlineLarge: TextStyle(
                  fontFamily: 'Roboto', fontSize: 32, height: 40 / 32),
              headlineMedium: TextStyle(
                  fontFamily: 'Roboto', fontSize: 28, height: 36 / 28),
              headlineSmall: TextStyle(
                  fontFamily: 'Roboto', fontSize: 24, height: 32 / 24),
              titleLarge: TextStyle(
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w500,
                  fontSize: 22,
                  height: 28 / 22),
              titleMedium: TextStyle(
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  height: 24 / 16,
                  letterSpacing: 0.15),
              titleSmall: TextStyle(
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  height: 20 / 14,
                  letterSpacing: 0.1),
              labelLarge: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 16,
                  height: 24 / 16,
                  letterSpacing: 0.1),
              labelMedium: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 14,
                  height: 20 / 14,
                  letterSpacing: 0.5,
                  color: Color.fromRGBO(155, 165, 174, 1)
              ),
              labelSmall: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 12,
                  height: 16 / 12,
                  letterSpacing: 0.5),
              bodyLarge: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 16,
                  height: 24 / 16,
                  letterSpacing: 0.15),
              bodyMedium: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 14,
                  height: 20 / 14,
                  letterSpacing: 0.25),
              bodySmall: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 12,
                  height: 16 / 20,
                  letterSpacing: 0.4)),
          colorScheme: ColorScheme.fromSwatch().copyWith(
              primary: Color.fromRGBO(6, 31, 53, 1),
              secondary: Color.fromRGBO(128, 206, 27, 1),
          )
      ),
      home: BlocProvider(create: (_) => DamiAppCubit(), child: HomeScreen()),
    );
  }
}
