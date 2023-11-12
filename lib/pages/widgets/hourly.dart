import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:umbrella/models/weather_data.dart';
import 'package:umbrella/shared/constants.dart';

class HourWidget extends StatelessWidget {
  final Hour hour;
  const HourWidget({super.key, required this.hour});

  @override
  Widget build(BuildContext context) {
    String time = DateFormat.jm().format(DateTime.parse(hour.time));
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
        color: Constants.cardBackground,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
          child: Column(
            children: [
              Text(
                time,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10,),
              Image.network(
                'https:${hour.condition.icon}',
                height: 50.0,
                width: 50.0,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 5,),
              Text(
                '${hour.tempC}°C',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18.0
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
