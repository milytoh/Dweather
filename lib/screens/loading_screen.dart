
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_app/screens/location_screen.dart';
import 'package:weather_app/services/weather.dart';


const spinKit = SpinKitRing(
color: Colors.white,
size: 70.0,
);

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override

  //initState method that first get called when the class state get initialized
  void initState() {
    super.initState();
    getLocationWeather();

  }
  // method that handled the weather Data both the longitude and
  //latitude
  Future<void> getLocationWeather() async{
    WeatherModel weatherData = WeatherModel();
    var weather = await weatherData.getWeatherData();

    // navigating to location screen passing all the values of weather data
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return LocationScreen(locationWeatherData: weather);
    }));

  }

  @override
  Widget build(BuildContext context) {
    getLocationWeather();

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            spinKit,
            Text('MILYOH DWeather..',style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              letterSpacing: 2.0,
            ),),
            FlatButton(
              onPressed: (){
                getLocationWeather();
              },
              color: Colors.white12,
              child: Icon(
                Icons.refresh,
                size: 35,
              ),
            ),

          ],
        ),
      ),

    );
  }
}












//https://api.openweathermap.org/data/2.5/weather?lat=$5.477&lon=$7.529&appid=bc3a08f5c175f9294f5d9709a97994b6
// String data = response.body;
// String cityName = jsonDecode(data)['name'];
// double temperature = jsonDecode(data)['main']['temp'];
// int conditionId = jsonDecode(data) ['weather'][0]['id'];
//