// ignore_for_file: constant_identifier_names

import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';
import 'package:umbrella/models/weather_data.dart';
import 'package:http/http.dart' as http;
import 'package:umbrella/services/api_exceptions.dart';
import 'package:umbrella/shared/constants.dart';

class WeatherApi {
  
  static const int TIME_OUT_DURATION = 20;

  Future<WeatherData> getForecastbyCity({required String city,}) async {

    try {
      Uri uri = Uri.parse("${Constants.baseUrl}/forecast.json?key=${Constants.apiKey}&q=$city&days=3&aqi=no&alerts=no");
      final response = await http.get(uri).timeout( const Duration(seconds: TIME_OUT_DURATION));
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException(message: 'No internet connection');
    } on FormatException {
      throw FetchDataException(message: 'Error occured while converting format.');
    } on TimeoutException {
      throw ApiNotRespondingException(message: 'Api not responding');
    }

  }

  Future<WeatherData> getForecastbyLocation({required String geoLocation}) async {

    try {
      Uri uri = Uri.parse("${Constants.baseUrl}/forecast.json?key=${Constants.apiKey}&q=$geoLocation&days=3&aqi=no&alerts=no");
      final response = await http.get(uri);
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException(message: 'No internet connection');
    } on FormatException {
      throw FetchDataException(message: 'Error occured while converting format.');
    } on TimeoutException {
      throw ApiNotRespondingException(message: 'Api not responding');
    }

  }

  WeatherData _processResponse(Response response) {
    switch (response.statusCode) {
      case 200:
        return WeatherData.fromJson(jsonDecode(response.body));
      case 400:
        throw BadRequestException(message: 'Location not found');
      case 401: 
      case 403:
        throw UnAuthorizedException(message: 'Unauthorized, attempt failed.');
      default:
        throw FetchDataException(message: 'Error occured with code: ${response.statusCode}');
    }
  }

}
