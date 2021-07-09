import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
@immutable
abstract class WeatherEvent extends Equatable{

}
class FetchWeatherEvent extends WeatherEvent{
  final String cityName;
  FetchWeatherEvent({required this.cityName});
  @override

  List<Object?> get props => [cityName];
}
class RefreshWeatherEvent extends WeatherEvent{
  final String cityName;
  RefreshWeatherEvent({required this.cityName});
  @override

  List<Object?> get props => [cityName];
}