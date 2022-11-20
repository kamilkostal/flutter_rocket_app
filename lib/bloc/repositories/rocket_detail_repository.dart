import '../../spaceX_api/rocket_api.dart';
import 'package:dio/dio.dart';

class RocketDetailRepository {
  Future<RocketCardData> getRocketDetailRepository(String id) async {
    try {
      final dio = Dio();
      final client = RestClient(dio);
      return client.getRocketCardData(id);
    } catch (e) {
      print(Exception(e));
      return Future.error(Exception(e));
      // throw Exception(e);
    }
  }
}