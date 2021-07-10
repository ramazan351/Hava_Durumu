part of 'theme_bloc.dart';

abstract class ThemeEvent extends Equatable {
  const ThemeEvent();
}
class ChangeThemeEvent extends ThemeEvent{

  final String weatherShortName;
  const ChangeThemeEvent({required this.weatherShortName}):super();

  @override
  List<Object?> get props => [weatherShortName];

}