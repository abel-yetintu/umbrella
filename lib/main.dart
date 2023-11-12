import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:umbrella/pages/home_page.dart';
import 'package:umbrella/providers/weather_data_provider.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]).then((value) {
    runApp(ChangeNotifierProvider(
      create: (context) => WeatherDataProvider(), 
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Umbrella(),
        )
      ));
  });
}

class Umbrella extends StatelessWidget {
  const Umbrella({super.key});

  @override
  Widget build(BuildContext context) {
      return const HomePage();
  }
}
