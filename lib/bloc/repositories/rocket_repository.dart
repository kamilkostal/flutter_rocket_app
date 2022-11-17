import '../../spaceX_api/rocket_api.dart';
import 'package:dio/dio.dart';

class RocketRepository {
  Future<List<Rocket>> getRocketRepository() async {
    try {
      final dio = Dio();
      dio.options.headers["spacex-key"] = "spacex-key";
      final client = await RestClient(dio);
      return client.getRockets();
    } catch (e) {
      throw Exception(e);
    }
  }
}
