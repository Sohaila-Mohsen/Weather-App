import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio;

  static init() {
    dio = Dio(BaseOptions(
      baseUrl: 'https://api.openweathermap.org/data/2.5/',
      receiveDataWhenStatusError: true,
    ));
  }

  static Future<Response> getData({String? url, String? location}) async {
    print("location  " + location.toString());
    return (location != null)
        ? await dio!.get(
            "weather?q=$location&appid=6b8e2c490ac4ce62ecf864c28262af10&units=metric")
        : await dio!.get(
            "weather?q=cairo&appid=6b8e2c490ac4ce62ecf864c28262af10&units=metric");
  }
}
