import 'package:flutter/material.dart';
import 'package:weather_app/screens/city_screen.dart';
import 'package:weather_app/utilities/constant.dart';
import 'package:weather_app/services/weather.dart';
import 'package:weather_app/screens/error_massage.dart';



class LocationScreen extends StatefulWidget {
  LocationScreen({this.locationWeatherData, this.searchLocationWeather});
  final locationWeatherData;
  final searchLocationWeather;
  @override
  _LocationScreenState createState() => _LocationScreenState();
}
class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weatherCurrentData = WeatherModel();
  String cityName;
  double temperature;
  int conditionId;
  String conditionIcon;
  String temperatureMassage;
  var inputText;
  @override
  void initState() {
    super.initState();
    updateUI(widget.locationWeatherData);
  }

  void updateUI(dynamic weatherData){
    setState(() {
      if (weatherData == null){
        cityName = 'none';
        temperature = 0;
        conditionIcon = 'error';
        temperatureMassage = 'please check your internet connection';
        conditionIcon = 'sorry';
      }
      cityName = weatherData['name'];
      temperature = weatherData['main']['temp'];
      conditionId = weatherData ['weather'][0]['id'];
      conditionIcon = weatherCurrentData.getWeatherIcon(conditionId);
      temperatureMassage = weatherCurrentData.getMessage(temperature.toInt());
    });

  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(
                    onPressed: () async{
                      var updateWeather =  await weatherCurrentData.getWeatherData();
                      updateUI(updateWeather);
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  FlatButton(
                    onPressed: () async{
                     inputText=  await Navigator.push(context, MaterialPageRoute(builder: (context){
                        return CityScreen();
                      }));
                       if (inputText != null){
                         try {
                           var weatherData = await weatherCurrentData
                               .getWeatherByName(inputText);
                           updateUI(weatherData);
                         }
                         catch (e){
                            Navigator.push(context, MaterialPageRoute(builder: (context){
                             return Error(massage: inputText,);
                           }));
                         }

                       }
                    },
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 15.0),
                  child: Row(
                    children: <Widget>[
                      Text(
                        '${temperature.toInt()}°',
                        style: kTempTextStyle,
                      ),
                      Text(
                        conditionIcon,
                        style: kConditionTextStyle,
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: EdgeInsets.only(right: 15.0,bottom: 12),
                  child: Text(
                    '$temperatureMassage here in $cityName',
                    textAlign: TextAlign.right,
                    style: kMessageTextStyle,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
