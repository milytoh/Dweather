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
      return '๐ฉ';
    } else if (condition < 400) {
      return '๐ง';
    } else if (condition < 600) {
      return 'โ๏ธ';
    } else if (condition < 700) {
      return 'โ๏ธ';
    } else if (condition < 800) {
      return '๐ซ';
    } else if (condition == 800) {
      return 'โ๏ธ';
    } else if (condition <= 804) {
      return 'โ๏ธ';
    } else {
      return '๐คทโ';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s ๐ฆ time';
    } else if (temp > 20) {
      return 'Time for shorts. ๐';
    } else if (temp < 10) {
      return 'You\'ll need ๐งฃ and ๐งค';
    } else {
      return 'Bring a ๐งฅ just in case';
    }
  }
}
