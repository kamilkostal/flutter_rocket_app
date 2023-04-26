import 'app_events.dart';
import '../../spaceX_api/rocket_api.dart';

class LoadCardDataEvent extends AppEvents{
  final String id;
  const LoadCardDataEvent(this.id);
  @override
  List<Object> get props => [];
}
