import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:umbrella/models/weather_data.dart';

class DayWidget extends StatelessWidget {
  final Forecastday day;
  final Function(int) onPressed;
  final int index;
  final int currentDayIndex;
  const DayWidget(
      {super.key,
      required this.day,
      required this.onPressed,
      required this.index,
      required this.currentDayIndex});

  @override
  Widget build(BuildContext context) {
    String formattedDate;
    DateTime date = day.date;
    if (DateTime.now().day == date.day) {
      formattedDate = "Today";
    } else if (DateTime.now().day + 1 == date.day) {
      formattedDate = "Tomorrow";
    } else {
      formattedDate = DateFormat('EEE, d MMM').format(day.date);
    }

    return index == currentDayIndex
        ? Container(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
            margin: const EdgeInsets.only(right: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: const Color.fromARGB(255, 209, 159, 7)
            ),
            child: GestureDetector(
              child: Text(
                formattedDate,
                style: const TextStyle(
                    color:Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w800),
              ),
              onTap: () {
                onPressed(index);
              },
            ),
          )
        : Container(
            padding:const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
            margin: const EdgeInsets.only(right: 20),
            child: GestureDetector(
              child: Text(
                formattedDate,
                style: TextStyle(
                    color: index == currentDayIndex ? Colors.amber : Colors.white, fontSize: 18.0, fontWeight: FontWeight.w800),
              ),
              onTap: () {
                onPressed(index);
              },
            ),
        );
  }
}
