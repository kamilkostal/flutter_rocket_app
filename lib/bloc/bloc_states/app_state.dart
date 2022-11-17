import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import '../../spaceX_api/rocket_api.dart';

@immutable
abstract class UserState extends Equatable{}

class UserLoadingState extends UserState{
  @override
  List<Object?> get props => [];
}

class UserLoadedState extends UserState{
  final List<Rocket> rocketCardData;
  UserLoadedState(this.rocketCardData);

  @override
  List<Object?> get props => [rocketCardData];
}

class UserErrorState extends UserState{
  @override
  List<Object?> get props => [];
}

