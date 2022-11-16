import 'package:equatable/equatable.dart';

abstract class HomeScreenEvent extends Equatable {
  const HomeScreenEvent();
}

class FetchDataEvent extends HomeScreenEvent {
  @override
  List<Object?> get props => [];
}