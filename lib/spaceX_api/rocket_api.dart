import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:json_annotation/json_annotation.dart';

part 'rocket_api.g.dart';



@RestApi(
  baseUrl: "https://api.spacexdata.com/"
)
abstract class RestClient{
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("/v5/launches")
  Future<List<Rocket>> getRockets();
}

@JsonSerializable()
class Rocket{
  String name;
  int flight_number;
  Rocket({required this.name, required this.flight_number});
  factory Rocket.fromJson(Map<String, dynamic> json) => _$RocketFromJson(json);
  Map<String, dynamic> toJson() => _$RocketToJson(this);
}
