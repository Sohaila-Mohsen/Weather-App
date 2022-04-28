// import 'package:flutter/material.dart';
// import 'package:weather/blocs/cubit/weather_cubit.dart';
// import 'package:weather/views/Result_page.dart';

// class MySearchDelegate extends SearchDelegate {
//   @override
//   List<Widget>? buildActions(BuildContext context) {
//     return [
//       IconButton(
//         icon: Icon(
//           Icons.clear,
//           color: Colors.white,
//         ),
//         onPressed: () {
//           if (query.isEmpty) {
//             close(context, null);
//           } else {
//             query = '';
//           }
//         },
//       )
//     ];
//   }

//   @override
//   Widget? buildLeading(BuildContext context) {
//     return IconButton(
//       icon: Icon(
//         Icons.arrow_back,
//         color: Colors.white,
//       ),
//       onPressed: () {
//         close(context, null);
//       },
//     );
//   }

//   // @override
//   // Widget buildResults(BuildContext context) {
//   //   WeatherCubit wc = WeatherCubit();
//   //   //return wc.getWeather(query) != null
//   //      // ? HomePage(location: query)
//   //       //: HomePage(location: "cairo");
//   // }

//   @override
//   Widget buildSuggestions(BuildContext context) {
//     return Container();
//   }
// }
