import 'package:bloc_weather/blocs_weather/bloc.dart';
import 'package:bloc_weather/blocs_weather/theme_bloc/theme_bloc.dart';

import 'widgets/weather_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:bloc_weather/data/weather_api_client.dart';
import 'package:bloc_weather/data/weather_repository.dart';
import 'package:bloc_weather/blocs_weather/theme_bloc/theme_bloc.dart';

final locator = GetIt.instance;

void main() {
  //getIt Mutlaka main içinde kullanılmalı aksi durumlarda farklı hatalar anlınabilir
  locator.registerLazySingleton(() =>
      WeatherRepository()); //gerektiğinde nesne üretir. ve birdaha üretmez
  //dependency injection
  locator.registerLazySingleton(() => WeatherApiClient());

  runApp(BlocProvider(create: (context) => ThemeBloc(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Bloc _bloc = BlocProvider.of<ThemeBloc>(context);
    return BlocBuilder(
        bloc: _bloc,
        builder: (ctx, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Weather Demo',
            theme: (state as ChangeThemeState).theme,
            home: BlocProvider(
                create: (context) => WeatherBloc(InitialWeatherState()),
                child: const WeatherApp()),
          );
        });
  }
}
