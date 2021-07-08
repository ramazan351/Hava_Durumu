import 'package:bloc_weather/data/weather_api_client.dart';
import 'package:bloc_weather/models/weather.dart';
import '../main.dart';

class WeatherRepository{
  final WeatherApiClient _apiClient=locator<WeatherApiClient>();
  Future<WeatherModel> getWeatherForecast(String cityName) async{
      final int cityID=await _apiClient.getLocationId(cityName) ;
      //future fonksiyonlardan dönen değerleri mutlaka await ile bekle sonra bir saat hata alırsın :)
      return  _apiClient.getWeather(cityID);
  }
}