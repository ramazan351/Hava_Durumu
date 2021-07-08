import 'package:bloc_weather/models/weather.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class WeatherApiClient {
  final baseUrl = "https://www.metaweather.com";
  final http.Client httpClient= http.Client();

  Future<int> getLocationId(String cityName) async{
    final cityUrl="$baseUrl/api/location/search/?query=$cityName";
    final incomingResponse=await httpClient.get(Uri.parse(cityUrl));
    if(incomingResponse.statusCode!=200){
      throw Exception("Hata:Şehir ID'si için veri alınamıyor !!!!!");
    }
    final incomingResponseToJson=(jsonDecode(incomingResponse.body)) as List;
//bu bir liste dönderiyor yani json listesi bakınız json listesi =[{"somethingString":"stringValue","somethingInt":123}]
    return  incomingResponseToJson[0]["woeid"];
  }
  Future<WeatherModel> getWeather(int cityId) async{
    final cityDetailUrl="$baseUrl/api/location/$cityId/";
    final incomingDetailResponse=await httpClient.get(Uri.parse(cityDetailUrl));
    if(incomingDetailResponse.statusCode!=200){
      throw Exception("Hata: Hava Durumu İçin Veri Alınamıyor!!!!");
    }
    final incomingDetailResponseToJson=jsonDecode(incomingDetailResponse.body);
//bu bir liste değil bir obje dönderiyor liste gibi kullanamayız
    return WeatherModel.fromJson(incomingDetailResponseToJson);
  }
}
