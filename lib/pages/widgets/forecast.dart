import 'package:flutter/material.dart';
import 'package:umbrella/models/weather_data.dart';
import 'package:umbrella/pages/widgets/days.dart';
import 'package:umbrella/pages/widgets/hourly.dart';

class ForecastWidget extends StatefulWidget {
  final Forecast forecast;
  const ForecastWidget({super.key, required this.forecast});

  @override
  State<ForecastWidget> createState() => _ForecastWidgetState();
}

class _ForecastWidgetState extends State<ForecastWidget> {
  int currentDayIndex = 0;
  void ondayPressed(int index) {
    setState(() {
      currentDayIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Forecastday> forecastdays = widget.forecast.forecastday;
    return Column(
      children: [
        SizedBox(
          height: 40.0,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: forecastdays.length,
            itemBuilder: (context, index) {
              return DayWidget(
                day: forecastdays[index],
                index: index,
                currentDayIndex: currentDayIndex,
                onPressed: ondayPressed,
              );
            },
          ),
        ),
        const SizedBox(
          height: 24.0,
        ),
        SizedBox(
          height: 150.0,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: forecastdays[currentDayIndex].hour.length,
            itemBuilder: (context, index) {
              return HourWidget(
                  hour: forecastdays[currentDayIndex].hour[index]);
            },
          ),
        ),
      ],
    );
  }
}
