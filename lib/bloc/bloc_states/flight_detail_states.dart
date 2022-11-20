import 'app_state.dart';
import '../../spaceX_api/rocket_api.dart';
import '../../spaceX_api/rocket_api.dart';

class CardDetailLoadedState extends UserState{
  final RocketCardData rocketCardDetail;
  CardDetailLoadedState(this.rocketCardDetail);

  @override
  List<Object?> get props => [rocketCardDetail];
}