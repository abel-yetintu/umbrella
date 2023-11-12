import 'package:flutter/material.dart';
import 'package:umbrella/models/weather_data.dart';
import 'package:umbrella/shared/constants.dart';

class InfoCard extends StatelessWidget {
  final WeatherData weatherData;

  const InfoCard({super.key, required this.weatherData});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0)
        ),
      color: Constants.cardBackground,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(Icons.thermostat, color: Colors.white, size: 42,),
                    const SizedBox(width: 2.0,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Feels like',
                          style: TextStyle(
                            color: Colors.white
                          )
                        ),
                        const SizedBox(height: 4.0,),
                        Text(
                          '${weatherData.current.feelslikeC}°C',
                          style: const TextStyle(
                            color: Colors.white
                          )
                        )
                      ],
                    )
                  ],
                ),
                Row(
                  children: [
                    const Icon(Icons.air, color: Colors.white, size: 42,),
                    const SizedBox(width: 10.0,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Wind',
                          style: TextStyle(
                            color: Colors.white
                          )
                        ),
                        const SizedBox(height: 4.0,),
                        Text(
                          '${weatherData.current.windKph} Km/h',
                          style: const TextStyle(
                            color: Colors.white
                          )
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),
            const SizedBox(height: 24.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(Icons.water_drop, color: Colors.white, size: 42,),
                    const SizedBox(width: 5.0,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Humidity',
                          style: TextStyle(
                            color: Colors.white
                          )
                        ),
                        const SizedBox(height: 4.0,),
                        Text(
                          '${weatherData.current.humidity}%',
                          style: const TextStyle(
                            color: Colors.white
                          )
                        )
                      ],
                    )
                  ],
                ),
                Row(
                  children: [
                    const Icon(Icons.visibility, color: Colors.white, size: 42,),
                    const SizedBox(width: 10.0,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Visibility',
                          style: TextStyle(
                            color: Colors.white
                          )
                        ),
                        const SizedBox(height: 4.0,),
                        Text(
                          '${weatherData.current.visKm} Km',
                          style: const TextStyle(
                            color: Colors.white
                          )
                        )
                      ],
                    )
                  ],
                ),
              ],
            )
          ],
        )
      ),
    );
  }
}
