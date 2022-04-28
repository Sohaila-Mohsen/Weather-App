import 'package:flutter/material.dart';
import 'package:weather/services/dio_healper/dio_service.dart';
import 'package:weather/src/app_root.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  DioHelper.init();
  runApp(AppRoot());
}
