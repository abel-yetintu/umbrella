import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:umbrella/models/weather_data.dart';
import 'package:umbrella/shared/constants.dart';

class WeatherCard extends StatelessWidget {
  final WeatherData weatherData;

  const WeatherCard({super.key, required this.weatherData});

  @override
  Widget build(BuildContext context) {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(weatherData.location.localtimeEpoch *1000);
    //DateTime dateTime = DateTime.parse(weatherData.location.localtime);
    String formattedDate = DateFormat('EEE, d MMM').format(date);

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      color: Constants.cardBackground,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  weatherData.current.condition.text,
                  style: const TextStyle(fontSize: 20.0, color: Colors.white),
                ),
                Text(
                  formattedDate,
                  style: const TextStyle(fontSize: 12.0, color: Colors.white),
                ),
              ],
            ),
            const SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.network(
                  'https:${weatherData.current.condition.icon}',
                  height: 120,
                  width: 120,
                  fit: BoxFit.cover,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${weatherData.current.tempC.round()}',
                      style: const TextStyle(
                          fontSize: 60.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      '°C',
                      style: TextStyle(color: Colors.amber, fontSize: 30.0),
                    )
                  ],
                )
              ],
            ),
            Row(
              children: [
                const Icon(
                  Icons.place,
                  color: Colors.amber,
                  size: 16.0,
                ),
                const SizedBox(
                  width: 4.0,
                ),
                Expanded(
                  child: Text(
                    '${weatherData.location.name}, ${weatherData.location.country}',
                    style: const TextStyle(color: Colors.white, fontSize: 16.0),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
