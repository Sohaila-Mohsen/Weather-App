import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/blocs/cubit/weather_cubit.dart';
import 'package:weather/components/weather_deatails.dart';
import 'package:weather/views/search_page.dart';

import '../models/MySearchDelegate.dart';

class HomePage extends StatelessWidget {
  WeatherCubit? weatherCubit;
  HomePage({Key? key, this.weatherCubit}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    print("                      " + weatherCubit.toString());
    // if (location != null) {
    //   wathercubit.location = location;
    // } else {
    //   wathercubit.location = "cairo";
    // }
    // wathercubit.getWeather();
    return BlocConsumer<WeatherCubit, WeatherState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: weatherCubit!.backgroundImage!, fit: BoxFit.cover)),
          child: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                  Color.fromARGB(123, 0, 0, 0),
                  Color.fromARGB(53, 0, 0, 0),
                ])),
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
              child: Scaffold(
                backgroundColor: Colors.transparent,
                body: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        IconButton(
                          onPressed: () {
                            weatherCubit!.getWeather();
                          },
                          icon: const Icon(
                            Icons.refresh,
                            color: Colors.grey,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SearchPage()));
                          },
                          icon: Icon(
                            Icons.search,
                            color: Colors.grey,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Expanded(
                      flex: 2,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(
                                weatherCubit!.cityName.toString(),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 23,
                                ),
                              ),
                              Text(
                                weatherCubit!.tempreture!.round().toString(),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 80,
                                ),
                              ),
                            ],
                          ),
                          RotatedBox(
                              quarterTurns: 3,
                              child: Text(
                                weatherCubit!.statue!,
                                style: const TextStyle(
                                  color: Color.fromARGB(175, 255, 255, 255),
                                  fontSize: 23,
                                ),
                              )),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(7),
                      height: 80,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(88, 0, 0, 0),
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                              color: const Color.fromARGB(133, 183, 182, 182))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          WeatherDetails(
                            main: weatherCubit!.humidity.toString(),
                            sub: "Humidity",
                          ),
                          WeatherDetails(
                            main: weatherCubit!.visibility.toString(),
                            sub: "Visibility",
                          ),
                          WeatherDetails(
                            main: weatherCubit!.windSpeed.toString(),
                            sub: "Wind Speed",
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
