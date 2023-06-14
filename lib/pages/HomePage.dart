import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/Providers/Weather_Provider.dart';
import 'package:weather_app/models/Weather_model.dart';
import 'package:weather_app/pages/search-page.dart';

class HomePage extends StatefulWidget {
   HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  WeatherModel? weatherData;
  Widget build(BuildContext context) {
    weatherData=Provider.of<WeatherProvider>(context).WeatherData;
    return Scaffold(
appBar: AppBar(
  actions: [
    IconButton(onPressed: (){
    Navigator.push(context,
    MaterialPageRoute(
      builder:(context) {
      return SearchPage();
    }));
    },
        icon:Icon(
          Icons.search,
        ),),

  ],

  title: Text(
    'Weather App',
  ),
),

    body:weatherData==null?Center(

        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
                'there is no weather 😔 start',
              style:TextStyle(
                fontSize: 30,

              ) ,


            ),

            Text(
              'searching now 🔍',
              style:TextStyle(
                fontSize: 30,

              ) ,
            ),


          ],
    ),
    ):Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
           weatherData!.getThemecolor()!,
            weatherData!.getThemecolor()![300]!,
            weatherData!.getThemecolor()![100]!
          ],
begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),

      ),


      child:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(flex: 3,),
          Text(

           Provider.of<WeatherProvider>(context).cityName??'null',
            style: TextStyle(
              fontSize: 35,
fontWeight: FontWeight.bold,
            ),
          ),
          Text(
         'Update at :${weatherData!.date.hour.toString()}:${weatherData!.date.minute.toString()}',
            style: TextStyle(
              fontSize: 22,

            ),
          ),
        Spacer(

        ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(weatherData!.getImage()),

              Text(
               weatherData!.temp.toInt().toString(),
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),

              Column(
                children: [
                  Text('MaxTemp :${weatherData!.MaxTemp.toInt()} '),
                  Text('MixTemp :${weatherData!.MinTemp.toInt()} '),


                ],



              ),

            ],


          ),
       Spacer(),

Text(
  weatherData!.WeatherStateName,
    style: TextStyle(
    fontSize: 35,
    fontWeight: FontWeight.bold,
    ),),
Spacer(flex: 5,),
        ],

      ) ,


    ),
        );












  }
}
