import 'package:bloc_weather/models/weather.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
@immutable
abstract class WeatherState extends Equatable{
 const WeatherState();
}
class InitialWeatherState extends WeatherState{
  @override

  List<Object?> get props => [];
}
class WeatherLoadingState extends WeatherState{
  @override
  List<Object?> get props=>[];
}
class WeatherLoadedState extends WeatherState{
  final WeatherModel? weatherModel;
  const WeatherLoadedState({@required this.weatherModel});
  @override
  List<Object?> get props=>[weatherModel];
}
class WeatherErrorState extends WeatherState{
  @override
  List<Object?> get props=>[];
}