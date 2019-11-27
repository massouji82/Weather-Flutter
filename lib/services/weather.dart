import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const apiKey = '2bb13bbb7d94a5f0e82e32c9d5691ed8';
const openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    NetworkHelper networkHelper = NetworkHelper(
        '$openWeatherMapURL?q=$cityName&appid=$apiKey&units=metric');

    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();

    NetworkHelper networkHelper = NetworkHelper(
        '$openWeatherMapURL?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');

    var weatherData = await networkHelper.getData();
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
    if (temp >= 25) {
      return 'It\'s 🍦 time';
    } else if (temp >= 20 && temp < 25) {
      return 'Time for shorts and 👕';
    } else if (temp >= 10 && temp < 20) {
      return 'Don\'t forget to bring a 🧥';
    } else if (temp >= 0 && temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else if (temp >= -10 && temp < 0) {
      return 'Time to go 🏂';
    } else {
      return 'Why are you even outside 😨';
    }
  }
}
