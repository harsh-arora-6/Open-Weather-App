import 'location.dart';
import 'networking.dart';

class WeatherModel {
  Future<dynamic> getCityWeather(var cityName) async {
    var url = Uri.https('api.openweathermap.org', '/data/2.5/weather', {
      'appid': 'd773206cb0ffd76139959202d3c7a256',
      'q': cityName,
      'units': 'metric'
    });
    NetworkHelper networkHelper = NetworkHelper(url);
    return await networkHelper.getData();
  }

  Future<dynamic> getLocationWeather() async {
    Location locationObj = Location();
    await locationObj.getCurrentLocation();
    var url = Uri.https('api.openweathermap.org', '/data/2.5/weather', {
      'lat': '${locationObj.latitude}',
      'lon': '${locationObj.longitude}',
      'appid': 'd773206cb0ffd76139959202d3c7a256',
      'units': 'metric'
    });
    NetworkHelper networkHelper = NetworkHelper(url);
    return await networkHelper.getData();
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
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
