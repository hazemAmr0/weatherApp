import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/Providers/Weather_Provider.dart';
import 'package:weather_app/models/Weather_model.dart';
import 'package:weather_app/services/weather-services.dart';

class SearchPage extends StatelessWidget {
  String? Cityname;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Search a City',
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: TextField(
            onChanged: (data){
              Cityname = data;
            },
            onSubmitted: (data) async{
              Cityname = data;
              WeatherAServices services = WeatherAServices();

              WeatherModel weather = await services.getWeather(CityName: Cityname!);

               Provider.of<WeatherProvider>(context,listen: false).weatherData=weather;
              Provider.of<WeatherProvider>(context,listen: false).cityName=Cityname;

Navigator.pop(context);

              },
            decoration: InputDecoration(
              hintText: 'enter City name',
              border: OutlineInputBorder(),
              suffixIcon: GestureDetector(
                onTap: () async{
                  WeatherAServices services = WeatherAServices();

                  WeatherModel weather = await services.getWeather(CityName: Cityname!);

                  Provider.of<WeatherProvider>(context,listen: false).weatherData=weather;
                  Provider.of<WeatherProvider>(context,listen: false).cityName=Cityname;

                  Navigator.pop(context);

                },
                child: Icon(
                  Icons.search,
                ),
              ),
              label: Text(
                'Search',
              ),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 30, horizontal: 20),
            ),
          ),
        ),
      ),
    );
  }
}


