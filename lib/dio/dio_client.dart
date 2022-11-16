import 'package:dio/dio.dart';
import 'package:retrofit/dio.dart';

Dio buildDioClient(String baseUrl){
  final dio = Dio()..options = BaseOptions(baseUrl: baseUrl);
  dio.interceptors.addAll([
  ]);
}