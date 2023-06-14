import 'package:flutter/cupertino.dart';
import 'package:weather_app/models/Weather_model.dart';

class WeatherProvider extends ChangeNotifier{
  WeatherModel? _WeatherData;
  String? cityName;
set weatherData(WeatherModel? weather){

  _WeatherData=weather;
  notifyListeners();
}
WeatherModel? get WeatherData=>_WeatherData;


}