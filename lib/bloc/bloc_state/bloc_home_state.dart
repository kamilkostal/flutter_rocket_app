import 'package:dami_rocket_app/spaceX_api/rocket_api.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

abstract class HomeScreenState extends Equatable {
  const HomeScreenState();
}

class HomeInitialState extends HomeScreenState {
  const HomeInitialState();

  @override
  List<Object?> get props => [];
}

class HomeLoadingState extends HomeScreenState {
  const HomeLoadingState();

  @override
  List<Object?> get props => [];
}

class HomeErrorFetchDataState extends HomeScreenState {
  final String errorMessage;
  const HomeErrorFetchDataState({
    required this.errorMessage,
  });

  @override
  List<Object?> get props => [];
}

class HomeSuccessFetchDataState extends HomeScreenState {
  final List<Rocket> rockets;
  const HomeSuccessFetchDataState({
    required this.rockets,
  });

  @override
  List<Object?> get props => [];
}
