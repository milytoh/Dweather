import 'package:weather_app/services/location.dart';
import 'package:weather_app/services/network.dart';

const WeatherApiKey = 'bc3a08f5c175f9294f5d9709a97994b6';

class WeatherModel {
  double latitude;
  double longitude;

  Future<dynamic> getWeatherByName(String inputName) async{
    try {
      NetworkHelper networkHelper = NetworkHelper(
          url: 'https://api.openweathermap.org/data/2.5/weather?q=$inputName&appid=$WeatherApiKey&units=metric');
      var weatherData = await networkHelper.networkData();
      return weatherData;
    }
    catch(e){
      throw 'nothing';
    }
  }
  Future getWeatherData() async{
    Location location = Location();
    await location.getCurrentLocation();
    latitude =   location.latitude;
    longitude = location.longitude;

    NetworkHelper networkHelper = NetworkHelper(url:'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$WeatherApiKey&units=metric');
    var weatherData = await networkHelper.networkData();
    return weatherData;
  }
  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts. 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
