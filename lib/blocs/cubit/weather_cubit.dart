// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/models/weather.dart';
import 'package:weather/services/dio_healper/dio_service.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(WeatherInitial());
  static WeatherCubit get(context) => BlocProvider.of(context);

  String? location = "cairo";
  WeatherHup? weatherHup;
  String? statue;
  int? visibility;
  double? tempreture = 0;
  int? humidity;
  String? cityName;
  double? windSpeed;
  AssetImage? backgroundImage = AssetImage("images/sunny.jpg");

  changeBackground() {
    print(tempreture.toString());
    if (tempreture! > 32)
      backgroundImage = AssetImage("images/sunny.jpg");
    else if (tempreture! > 25)
      backgroundImage = AssetImage("images/clear.jpg");
    else
      backgroundImage = AssetImage("images/cold.jpg");

    emit(BackgroungChanged());
  }

  getWeather() {
    print("object555555");
    print("lo +$location");
    DioHelper.getData(location: location).then((value) {
      emit(WeatherLodingState());
      //var jsonData = jsonDecode(value.data);
      print("here455");
      weatherHup = WeatherHup.fromJson(value.data);
      tempreture = weatherHup!.main!.temp;
      cityName = weatherHup!.name;
      statue = weatherHup!.weather![0].main;
      visibility = ((weatherHup!.visibility!) / 1000).round();
      humidity = weatherHup!.main!.humidity!.round();
      windSpeed = weatherHup!.wind!.speed;
      changeBackground();
      emit(WeatherSuccessState());
      print("here4  $tempreture  + $cityName + $statue");
    }).catchError((error) {
      print("error  " + error.toString());
      emit(WeatherErrorState());
    });
  }
}
