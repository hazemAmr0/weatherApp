import 'dart:ui';

import 'package:flutter/material.dart';

class WeatherModel {
  DateTime date;
  double temp;
  double MaxTemp;
  double MinTemp;
  String WeatherStateName;


  WeatherModel(
  {required this.date,
  required this.temp,
  required this.MaxTemp,
  required this.MinTemp,
  required this.WeatherStateName});

  factory  WeatherModel.fromJson(dynamic data) {
     var jsonData = data['forecast']['forecastday'][0]['day'];

   return WeatherModel(
   date:DateTime.parse(data['location']['localtime']),
   temp:jsonData['avgtemp_c'],
   MaxTemp:jsonData['maxtemp_c'],
   MinTemp:jsonData['mintemp_c'],
   WeatherStateName:jsonData['condition']['text']);
  }
  @override
  String toString() {
    // TODO: implement toString
    return 'temp =$temp mintemp =$MinTemp data= $date';
  }
String getImage(){
    if(WeatherStateName=='Clear'||
        WeatherStateName=='Lite Cloud'||WeatherStateName=='Sunny'){
      return 'assets/images/clear.png';
    }
    else if(WeatherStateName=='Sleet'||
        WeatherStateName=='Snow'||
        WeatherStateName=='Hail'){
      return 'assets/images/snow.png';

    }else if(WeatherStateName=='Heavy Cloud'||
        WeatherStateName=='Partly cloudy'){
      return 'assets/images/cloudy.png';

    }else if(WeatherStateName=='Light Rain'||
        WeatherStateName=='Heavy Rain'||
        WeatherStateName=='Showers'){
      return 'assets/images/rainy.png';

    }else if(WeatherStateName=='Thunderstorm'||
        WeatherStateName=='Thunder'){
      return 'assets/images/thunderstorm.png';

    }else {
      return 'assets/images/thunderstorm.png';
    }

    }
  MaterialColor? getThemecolor(){
    if(WeatherStateName=='Clear'||
        WeatherStateName=='Lite Cloud'||WeatherStateName=='Sunny'){
      return Colors.orange;
    }
    else if(WeatherStateName=='Sleet'||
        WeatherStateName=='Snow'||
        WeatherStateName=='Hail'){
      return Colors.blue;

    }else if(WeatherStateName=='Heavy Cloud'||
        WeatherStateName=='Partly cloudy'){
      return Colors.blueGrey;

    }else if(WeatherStateName=='Light Rain'||
        WeatherStateName=='Heavy rain'||
        WeatherStateName=='Showers'||WeatherStateName=='Overcast'){
      return Colors.blue;

    }else if(WeatherStateName=='Thunderstorm'||
        WeatherStateName=='Thunder'){
      return Colors.deepPurple;

    }else {
      return Colors.orange;
    }

  }

}


