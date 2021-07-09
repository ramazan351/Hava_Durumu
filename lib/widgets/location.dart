import 'package:bloc_weather/blocs_weather/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyLocationWidget extends StatelessWidget {
  const MyLocationWidget({Key? key,@required String? city}):super(key: key);
  @override
  Widget build(BuildContext context) {
    var _bloc=BlocProvider.of<WeatherBloc>(context);
    return BlocBuilder(bloc: _bloc,builder: (ctx,WeatherState state){
      return  Text((state as WeatherLoadedState).weatherModel!.title.toString(),textScaleFactor: 1.5,style: TextStyle(fontWeight: FontWeight.bold),);
    });
  }
}
