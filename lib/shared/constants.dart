import 'package:flutter/material.dart';

class Constants {
  static const String baseUrl = "http://api.weatherapi.com/v1";
  static const String apiKey = "###############";
  static const Color primaryColor = Color.fromARGB(255, 19, 16, 64);
  static const Color secondaryColor = Color.fromARGB(255, 14, 11, 51);
  static const Color cardBackground = Color.fromARGB(174, 53, 48, 113);

  static const InputDecoration inputDecoration = InputDecoration(
    filled: true,
    fillColor: Constants.cardBackground,
    border: OutlineInputBorder(),
    hintText: 'Enter a city name',
    hintStyle: TextStyle(color: Color.fromARGB(255, 217, 217, 217)),
    prefixIcon: Icon(Icons.place, color: Colors.white,),
  );
}
