import 'package:bloc_weather/blocs_weather/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyWeatherImageWidget extends StatelessWidget {
  const MyWeatherImageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Bloc _bloc = BlocProvider.of<WeatherBloc>(context);

    return BlocBuilder(
        bloc: _bloc,
        builder: (ctx, state) {
          return Column(children: [
            Text((state as WeatherLoadedState).weatherModel!.consolidatedWeather![0].theTemp!.floor().toString()+"°C",textScaleFactor: 1.2,),
            Image.network(
              "https://www.metaweather.com/static/img/weather/png/${(state as WeatherLoadedState)
                  .weatherModel!.consolidatedWeather?[0].weatherStateAbbr}.png",
              width: MediaQuery
                  .of(context)
                  .size
                  .width * 0.7, height: MediaQuery
                .of(context)
                .size
                .height * 0.25,),
          ],);
        });
  }
}
