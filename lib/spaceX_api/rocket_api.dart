import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:json_annotation/json_annotation.dart';

part 'rocket_api.g.dart';

@RestApi(baseUrl: "https://api.spacexdata.com/")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("/v5/launches")
  Future<List<Rocket>> getRockets();

  @GET("/v4/rockets/{id}")
  Future<RocketCardData> getRocketCardData(@Path('id') String id);
}

@JsonSerializable()
class Rocket {
  String name;
  String date_utc;
  int flight_number;
  String rocket;

  Rocket(
      {required this.name,
      required this.date_utc,
      required this.flight_number,
      required this.rocket,
      });

  factory Rocket.fromJson(Map<String, dynamic> json) => _$RocketFromJson(json);

  Map<String, dynamic> toJson() => _$RocketToJson(this);
}

@JsonSerializable()
class RocketCardData {
  String id;
  String description;
  String name;
  int stages;
  String wikipedia;
  int boosters;
  String company;
  String type;

  RocketCardData(
      {required this.id,
      required this.type,
      required this.boosters,
      required this.name,
      required this.company,
      required this.description,
      required this.wikipedia,
      required this.stages});

  factory RocketCardData.fromJson(Map<String, dynamic> json) =>
      _$RocketCardDataFromJson(json);

  Map<String, dynamic> toJson() => _$RocketCardDataToJson(this);
}
