import 'package:flutter/material.dart';
import 'package:weather/blocs/cubit/weather_cubit.dart';
import 'package:weather/views/home_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/views/search_page.dart';

class AppRoot extends StatelessWidget {
  const AppRoot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => WeatherCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SearchPage(),
      ),
    );
  }
}
