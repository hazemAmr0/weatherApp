import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/models/Weather_model.dart';

class WeatherAServices {
  String baseurl = 'http://api.weatherapi.com/v1';
  String apiKey = 'f35d333f747d4e12868233010232301';

  Future<WeatherModel> getWeather({required String CityName}) async {
    Uri url =
        Uri.parse('$baseurl/forecast.json?key=$apiKey&q=$CityName&days=7');

    http.Response response = await http.get(url);
    Map<String, dynamic> data = jsonDecode(response.body);

    WeatherModel weather = WeatherModel.fromJson(data);

    return weather;
  }
}
