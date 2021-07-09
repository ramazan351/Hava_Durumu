import 'package:bloc/bloc.dart';
import 'package:bloc_weather/blocs_weather/weather_event.dart';
import 'package:bloc_weather/blocs_weather/weather_state.dart';
import 'package:bloc_weather/data/weather_repository.dart';

import 'package:bloc_weather/models/weather.dart';


import '../main.dart';

class WeatherBloc extends Bloc<WeatherEvent,WeatherState>{
  final WeatherRepository _weatherRepository=locator<WeatherRepository>();

  WeatherBloc(WeatherState initialState) : super(initialState);

  @override
  Stream<WeatherState> mapEventToState(WeatherEvent event) async*{
    if(event is FetchWeatherEvent) {
      yield WeatherLoadingState();
      try{
        WeatherModel _pulledModel= await _weatherRepository.getWeatherForecast(event.cityName);
        yield WeatherLoadedState(weatherModel: _pulledModel);
      }catch(_){
        print("$_ Hatası ile karşılaşıldı (Weather_bloc)");
        yield WeatherErrorState();
      }
    }
    else if(event is RefreshWeatherEvent) {
      try{
        WeatherModel _pulledModel= await _weatherRepository.getWeatherForecast(event.cityName);
        yield WeatherLoadedState(weatherModel: _pulledModel);
      }catch(_){
        print("$_ Hatası ile karşılaşıldı (Weather_bloc)");
        yield WeatherErrorState();
      }
    }
  }

}