import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/Providers/Weather_Provider.dart';
import 'package:weather_app/models/Weather_model.dart';
import 'package:weather_app/pages/HomePage.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context){
        return WeatherProvider();
      },

      child: WeatherApp()));
}

class WeatherApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

        return MaterialApp(
        theme: ThemeData(
         primarySwatch: Provider.of<WeatherProvider>(context).WeatherData==null?Colors.blue:Provider.of<WeatherProvider>(context).WeatherData!.getThemecolor()),
        debugShowCheckedModeBanner: false,
        home: HomePage(),


      );

  }
}
