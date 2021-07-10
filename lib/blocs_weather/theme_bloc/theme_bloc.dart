import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

part 'theme_event.dart';

part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc()
      : super(ChangeThemeState(theme: ThemeData.light(), color: Colors.blue));

  @override
  Stream<ThemeState> mapEventToState(
    ThemeEvent event,
  ) async* {

    if (event is ChangeThemeEvent) {
      switch (event.weatherShortName) {
        case "sn":
        case "sl":
        case "h":
        case "t":
        case "hc":
          yield ChangeThemeState(
              theme: ThemeData(primarySwatch: Colors.blueGrey),
              color: Colors.grey);
          break;
        case "hr":
        case "lr":
        case "s":
          yield ChangeThemeState(
              theme: ThemeData(primarySwatch: Colors.indigo),
              color: Colors.purple);
          break;
        case "lc":
        case "c":
          yield ChangeThemeState(
              theme: ThemeData(primarySwatch: Colors.green),
              color: Colors.lightGreen);
          break;
        default:
          yield ChangeThemeState(
              theme: ThemeData(primarySwatch: Colors.red), color: Colors.red);
          break;


      }
    }
  }
}
