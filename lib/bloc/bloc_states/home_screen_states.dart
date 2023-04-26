import 'app_state.dart';
import '../../spaceX_api/rocket_api.dart';

class UserLoadedState extends UserState{
  final List<Rocket> rocketCardData;
  UserLoadedState(this.rocketCardData);

  @override
  List<Object?> get props => [rocketCardData];
}

