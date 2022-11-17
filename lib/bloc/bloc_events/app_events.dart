import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
abstract class AppEvents extends Equatable{
  const AppEvents();
}

class LoadUserEvent extends AppEvents{
  @override
  List<Object> get props => [];
}