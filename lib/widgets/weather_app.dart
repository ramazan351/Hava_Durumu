import 'package:bloc_weather/blocs_weather/bloc.dart';
import 'package:bloc_weather/widgets/least_update.dart';
import 'package:bloc_weather/widgets/location.dart';
import 'package:bloc_weather/widgets/maxmin_temperatures.dart';
import 'package:bloc_weather/widgets/select_city.dart';
import 'package:bloc_weather/widgets/weather_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String selectedCity="Ankara";
    final blocEvent=BlocProvider.of<WeatherBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Weather App"),
        actions: [
          IconButton(
              onPressed: () async {
                selectedCity= await Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MySelectCityWidget()));
                if(selectedCity!=null){
                  blocEvent.add(FetchWeatherEvent(cityName: selectedCity));
                  print("Girilen Şehir: $selectedCity");
                }
              },
              icon: const Icon(Icons.search))
        ],
      ),
      // ignore: prefer_const_literals_to_create_immutables
      body: BlocBuilder(bloc: blocEvent,builder: (_,WeatherState state){
        print(state);
        if(state is InitialWeatherState){
          return const Center(child: Text("Şehir Seçiniz"),);
        }
        if(state is WeatherLoadingState){
          return const Center(child: CircularProgressIndicator(),);
        }
        if(state is WeatherLoadedState){
          return ListView(
            children:  [
              Center(
                  child: Padding(
                      padding: const EdgeInsets.all(8), child: MyLocationWidget(city: selectedCity,))),
              const Center(
                  child: Padding(
                      padding: EdgeInsets.all(8), child: MyLeastUpdateWidget())),
              const Center(
                  child: Padding(
                      padding: EdgeInsets.all(8), child: MyWeatherImageWidget())),
              const Center(
                  child: Padding(
                      padding: EdgeInsets.all(15),
                      child: MyMaxMinTemperaturesWidget())),
            ],
          );
        }

        return const Center(child: Text("probllem var"),);

      },

      ),
    );
  }
}
