import '../../spaceX_api/rocket_api.dart';
import 'package:dio/dio.dart';

class RocketDetailRepository {
  Future<RocketCardData> getRocketDetailRepository(String id) async {
    try {
      final dio = Dio();
      final client = RestClient(dio);
      print('getting rocket details');
      return client.getRocketCardData(id);
    } catch (e) {
      print(Exception(e));
      print('rocket details getter failed');
      return Future.error(Exception(e));
      // throw Exception(e);
    }
  }
}