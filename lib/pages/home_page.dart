// ignore_for_file: use_build_context_synchronously, unused_field, avoid_print

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'package:umbrella/models/weather_data.dart';
import 'package:umbrella/pages/loading.dart';
import 'package:umbrella/pages/widgets/error_widget.dart';
import 'package:umbrella/pages/widgets/forecast.dart';
import 'package:umbrella/pages/widgets/info_card.dart';
import 'package:umbrella/pages/widgets/weather_card.dart';
import 'package:umbrella/services/api_exceptions.dart';
import 'package:umbrella/shared/constants.dart';
import 'package:umbrella/providers/weather_data_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _textController = TextEditingController();

   Future<bool> hasLocationPermission() async {
    // Check if Location is on and prompt a toast to enable location if its off
    bool locationServiceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!locationServiceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content:Text('Location services are disabled. Please turn on Location')));
      return false;
    }
    // Request for permmison if not granted
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Location permission denied.')));
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Location permission denied permanently.')));
      return false;
    }
    return true;
  }

  Future<void> getLocation() async {
    final permission = await hasLocationPermission();
    if (!permission) {
      Provider.of<WeatherDataProvider>(context, listen: false).setApiException(LocationServiceException(message: 'Location permission denied'));
      return;
    } 
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.medium)
    .then((currentPosition) {
      setState(() {
        Provider.of<WeatherDataProvider>(context, listen: false).getForecastByLocation('${currentPosition.latitude},${currentPosition.longitude}');
      });
    }).catchError((error) {
      print(error);
    });
  }

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  @override
  Widget build(BuildContext context) {
    
    WeatherDataProvider weatherDataProvider = Provider.of<WeatherDataProvider>(context);
    WeatherData? weatherData = weatherDataProvider.weatherData;

    return weatherDataProvider.isLoading ? const Loading() : 
      Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Constants.primaryColor,
        appBar: AppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: IconButton(
                icon: const Icon(
                  Icons.place,
                  size: 24.0,
                ),
                onPressed: () {
                  getLocation();
                },
              ),
            )
          ],
          title: Text(
            weatherDataProvider.apiException == null ? '${weatherData!.location.name}, ${weatherData.location.country}' :
            'Weather Forecast'
          ),
          elevation: 0.0,
          centerTitle: true,
          backgroundColor: Constants.secondaryColor,
        ),
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: _textController,
                decoration: Constants.inputDecoration.copyWith(suffixIcon: IconButton( 
                    icon: const Icon(Icons.clear, color: Colors.white,),
                    onPressed: () {
                      _textController.clear();
                    },
                  )
                  ),
                style: const TextStyle(color: Colors.white),
                textInputAction: TextInputAction.search,
                onSubmitted: (value) {
                  if(value.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content:Text('Please Enter a City First')));
                  } else {
                    weatherDataProvider.getForecastByCity(value);
                    _textController.clear();
                  }
                },
              ),
              const SizedBox(
                    height: 24.0,
                  ),
              weatherDataProvider.apiException == null ?
              Column(
                children: [
                  WeatherCard(weatherData: weatherData!),
                  const SizedBox(
                    height: 24.0,
                  ),
                  InfoCard(weatherData: weatherData),
                  const SizedBox(
                    height: 24.0,
                  ),
                  ForecastWidget(forecast: weatherData.forecast),
                ],
               ) : 
              ErrWidget(message: weatherDataProvider.apiException!.message),
            ],
          ),
        ));
  }
}
