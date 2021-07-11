import 'dart:async';

import 'package:bloc_weather/blocs_weather/bloc.dart';
import 'package:bloc_weather/blocs_weather/theme_bloc/theme_bloc.dart';
import 'package:bloc_weather/widgets/backgrouned_container.dart';
import 'package:bloc_weather/widgets/least_update.dart';
import 'package:bloc_weather/widgets/location.dart';
import 'package:bloc_weather/widgets/maxmin_temperatures.dart';
import 'package:bloc_weather/widgets/select_city.dart';
import 'package:bloc_weather/widgets/weather_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WeatherApp extends StatefulWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  State<WeatherApp> createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  String selectedCity = "Ankara";
  final DateTime now = DateTime.now();
  Completer<void> _completer = Completer<void>();

  @override
  Widget build(BuildContext context) {
    final blocEvent = BlocProvider.of<WeatherBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Weather App"),
        actions: [
          IconButton(
              onPressed: () async {
                selectedCity = await Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MySelectCityWidget()));
                if (selectedCity != null) {
                  blocEvent.add(FetchWeatherEvent(cityName: selectedCity));
                  print("Girilen Şehir: $selectedCity");
                }
              },
              icon: const Icon(Icons.search))
        ],
      ),
      body: BlocBuilder(
        bloc: blocEvent,
        builder: (_, state) {
          if (state is InitialWeatherState) {
            return const Center(
              child: Text("Şehir Seçiniz"),
            );
          }
          if (state is WeatherLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is WeatherLoadedState) {
            final weatherSortName =
                state.weatherModel!.consolidatedWeather?[0].weatherStateAbbr;
            BlocProvider.of<ThemeBloc>(context).add(
                ChangeThemeEvent(weatherShortName: weatherSortName as String));
            _completer.complete();

            _completer = Completer();
            return BlocBuilder(
                bloc: BlocProvider.of<ThemeBloc>(context),
                builder: (ctx, themeState) {
                  return BackgroundContainer(
                    color: (themeState as ChangeThemeState).color,
                    child: RefreshIndicator(
                      onRefresh: () {
                        blocEvent
                            .add(RefreshWeatherEvent(cityName: selectedCity));
                        snacbarShow();
                        return _completer.future;
                      },
                      child: ListView(
                        children: [
                          Center(
                              child: Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: MyLocationWidget(
                                    city: selectedCity,
                                  ))),
                          const Center(
                              child: Padding(
                                  padding: EdgeInsets.all(8),
                                  child: MyLeastUpdateWidget())),
                          const Center(
                              child: Padding(
                                  padding: EdgeInsets.all(8),
                                  child: MyWeatherImageWidget())),
                          const Center(
                              child: Padding(
                                  padding: EdgeInsets.all(15),
                                  child: MyMaxMinTemperaturesWidget())),
                        ],
                      ),
                    ),
                  );
                });
          }

          return const Center(
            child: Text("probllem var"),
          );
        },
      ),
    );
  }

  void snacbarShow() {
    final snackBar = SnackBar(
      content: Text('Hava Durumu Güncellendi: ' +
          now.hour.toString() +
          "." +
          now.minute.toString()),
      action: SnackBarAction(
        label: 'Tamam',
        onPressed: () {
          //do something
        },
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
