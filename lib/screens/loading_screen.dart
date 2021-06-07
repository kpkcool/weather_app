import 'package:flutter/material.dart';
import 'package:weather_app/services/location.dart';
import 'package:weather_app/services/networking.dart';


const apiKey = '302e9e4ee145f9f346c342b59f611c4f';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  late double latitude;
  late double longitude;

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async{
    Location location = Location();
    await location.getCurrentLocation();
    latitude = location.latitude;
    longitude = location.longitude;

    NetworkHelper networkHelper = NetworkHelper (url: 'http://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey');

    var weatherData = await networkHelper.getData();

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
    );
  }
}

// String cityName = jsonDecode(data)['name'];
// double temperature = jsonDecode(data)['main']['temp'];
// int condition = jsonDecode(data)['weather'][0]['id'];
//
// print(cityName);
// print(temperature);
// print(condition);
