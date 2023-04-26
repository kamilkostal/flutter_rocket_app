import 'package:auto_route/auto_route.dart';

import '../screens/home_screen.dart';
import '../screens/flight_detail_screen.dart';


@MaterialAutoRouter(
  replaceInRouteName: 'Screen,Route',
  routes: <AutoRoute>[
    AutoRoute(page: HomeScreen, initial: true),
    AutoRoute(page: FlightDetailScreen),
  ],
)
// extend the generated private router
class $AppRouter{}