import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
@immutable
abstract class WeatherEvent extends Equatable{

}
class FetchWeatherEvent extends WeatherEvent{
  final String cityName;
  FetchWeatherEvent({required this.cityName});
  @override
  // TODO: implement props
  List<Object?> get props => [cityName];
}