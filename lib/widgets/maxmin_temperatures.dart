import 'package:bloc_weather/blocs_weather/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyMaxMinTemperaturesWidget extends StatelessWidget {
  const MyMaxMinTemperaturesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Bloc _bloc = BlocProvider.of<WeatherBloc>(context);
    return BlocBuilder(
        bloc: _bloc,
        builder: (ctx, state) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Maksimum Sıcaklık: " + (state as WeatherLoadedState).weatherModel!.consolidatedWeather![0].maxTemp!.floor().toString()+ "°C",
                textScaleFactor: 1.1,
              ),
              Text(
                "Minimum Sıcaklık: " + (state as WeatherLoadedState).weatherModel!.consolidatedWeather![0].maxTemp!.floor().toString()+ "°C",
                textScaleFactor: 1.1,
              )
            ],
          );
        });
  }
}
