import 'package:bloc_weather/blocs_weather/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class MyLeastUpdateWidget extends StatelessWidget {
  const MyLeastUpdateWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _bloc=BlocProvider.of<WeatherBloc>(context);
    return BlocBuilder(bloc: _bloc,builder: (ctx,WeatherState state){
      var newTime=(state as WeatherLoadedState).weatherModel!.time?.toLocal();
      return Text(
        "Son güncellenme: " +  TimeOfDay.fromDateTime(DateTime.parse(newTime.toString())).format(context),
        //Datetime?'i DateTime'e çevirmek için parse metodunu kullandık
        textScaleFactor: 1.3,
        style: const TextStyle(fontWeight: FontWeight.w500),
      );
    }

    );
  }
}
