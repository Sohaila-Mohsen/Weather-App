import 'package:flutter/material.dart';

class WeatherDetails extends StatelessWidget {
  const WeatherDetails({this.main, this.sub});
  final String? main;
  final String? sub;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(color: Color.fromARGB(164, 255, 255, 255)))),
      child: Column(
        children: [
          Text(
            main!,
            style: const TextStyle(
              color: Color.fromARGB(175, 255, 255, 255),
              fontSize: 15,
            ),
          ),
          Text(
            sub!,
            style: const TextStyle(
              color: Color.fromARGB(175, 255, 255, 255),
              fontSize: 11,
            ),
          )
        ],
      ),
    );
  }
}
