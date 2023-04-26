import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import '../../spaceX_api/rocket_api.dart';

@immutable
abstract class UserState extends Equatable{}

class UserLoadingState extends UserState{
  @override
  List<Object?> get props => [];
}

class UserErrorState extends UserState{
  @override
  List<Object?> get props => [];
}


