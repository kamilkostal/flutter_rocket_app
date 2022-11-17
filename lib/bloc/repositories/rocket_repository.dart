import '../../spaceX_api/rocket_api.dart';
import 'package:dio/dio.dart';

class RocketRepository {
  Future<List<Rocket>> getRocketRepository() async {
    try {
      final dio = Dio();
      final client = RestClient(dio);
      return client.getRockets();
    } catch (e) {
      print(Exception(e));
      return Future.error(Exception(e));
      // throw Exception(e);
    }
  }
}
