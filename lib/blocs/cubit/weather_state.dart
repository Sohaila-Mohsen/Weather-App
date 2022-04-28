part of 'weather_cubit.dart';

@immutable
abstract class WeatherState {}

class WeatherInitial extends WeatherState {}

class WeatherLodingState extends WeatherState {}

class WeatherSuccessState extends WeatherState {}

class WeatherErrorState extends WeatherState {}

class BackgroungChanged extends WeatherState {}
