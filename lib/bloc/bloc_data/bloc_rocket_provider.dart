import 'package:dami_rocket_app/spaceX_api/rocket_api.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';

class RocketProvider{
  Future<List<Rocket>?> readRockets() async{
    final dio = Dio();
    dio.options.headers["spacex-key"] = "spacex-key";
    final client = RestClient(dio);
    return client.getRockets();
  }
}