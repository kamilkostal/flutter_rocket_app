// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rocket_api.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Rocket _$RocketFromJson(Map<String, dynamic> json) => Rocket(
      name: json['name'] as String,
      date_utc: json['date_utc'] as String,
      flight_number: json['flight_number'] as int,
    );

Map<String, dynamic> _$RocketToJson(Rocket instance) => <String, dynamic>{
      'name': instance.name,
      'date_utc': instance.date_utc,
      'flight_number': instance.flight_number,
    };

RocketCardData _$RocketCardDataFromJson(Map<String, dynamic> json) =>
    RocketCardData(
      id: json['id'] as String,
      type: json['type'] as String,
      boosters: json['boosters'] as int,
      name: json['name'] as String,
      company: json['company'] as String,
      description: json['description'] as String,
      wikipedia: json['wikipedia'] as String,
      stages: json['stages'] as int,
    );

Map<String, dynamic> _$RocketCardDataToJson(RocketCardData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'description': instance.description,
      'name': instance.name,
      'stages': instance.stages,
      'wikipedia': instance.wikipedia,
      'boosters': instance.boosters,
      'company': instance.company,
      'type': instance.type,
    };

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _RestClient implements RestClient {
  _RestClient(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= 'https://api.spacexdata.com/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<List<Rocket>> getRockets() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result =
        await _dio.fetch<List<dynamic>>(_setStreamType<List<Rocket>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/v5/launches',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) => Rocket.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<RocketCardData> getRocketCardData(id) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<RocketCardData>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/v4/rockets/${id}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = RocketCardData.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
