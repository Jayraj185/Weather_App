import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:weather_app/Screens/HomeScreen/model/WeatherModel2.dart';
import 'package:weather_app/Screens/SplashScreen/view/shared_preffrence.dart';

class HomeProvider extends ChangeNotifier
{
  //Only's Variable's
  bool search=false;
  TextEditingController txtSearch = TextEditingController();
  List<WeatherModel2> weatherList = [
    WeatherModel2(
        main: "Haze",
        image: "assets/image/.png",
        cel: 31,
        time: DateTime.now().hour + 0.0
    ),
    WeatherModel2(
        main: "Sunny",
        image: "assets/image/.png",
        cel: 33,
        time: DateTime.now().hour + 2.0
    ),
    WeatherModel2(
        main: "Windy",
        image: "assets/image/.png",
        cel: 27,
        time: DateTime.now().hour + 4.0
    ),
    WeatherModel2(
        main: "Clear",
        image: "assets/image/.png",
        cel: 24,
        time: DateTime.now().hour + 6.0
    ),
    WeatherModel2(
      main: "Clear",
      image: "assets/image/.png",
      cel: 21,
      time: DateTime.now().hour + 8.0
    ),
    WeatherModel2(
        main: "Rainy",
        image: "assets/image/.png",
        cel: 23,
        time: DateTime.now().hour + 10.0
    ),

  ];




  //Only's Function's
  void ChnageBoolValue()
  {
    search = !search;
    notifyListeners();
  }
  void ReadStartButton(context)
  async{
    bool? IsStart = await ReadData();
    print("=========== $IsStart");
    Timer(Duration(seconds: 3), () {
      if(IsStart!=null)
      {
        if(IsStart!)
        {
          Navigator.pushReplacementNamed(context, 'Home');
        }
        else
        {
          Navigator.pushReplacementNamed(context, 'First');
        }
      }
      else
      {
        Navigator.pushReplacementNamed(context, 'First');
      }
    });
  }
}