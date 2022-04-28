import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather/blocs/cubit/weather_cubit.dart';
import 'package:weather/services/dio_healper/dio_service.dart';
import 'package:weather/views/home_page.dart';

class LoadingPage extends StatefulWidget {
  final String? location;
  const LoadingPage({
    Key? key,
    this.location,
  }) : super(key: key);

  @override
  State<LoadingPage> createState() => _LoadingPageState(location);
}

class _LoadingPageState extends State<LoadingPage> {
  String? location;
  _LoadingPageState(this.location);
  @override
  void initState() {
    super.initState();
    getWeather();
  }

  void getWeather() async {
    var weatherCubit = WeatherCubit.get(context);
    weatherCubit.location = location;
    await weatherCubit.getWeather();
    await DioHelper.getData(location: location);
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => HomePage(
                  weatherCubit: weatherCubit,
                )));
    HomePage(weatherCubit: weatherCubit);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SpinKitRotatingCircle(
          color: Colors.orange,
          size: 70.0,
        ),
      ),
    );
  }
}
