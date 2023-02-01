import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:weather_app/Screens/HomeScreen/provider/HomeProvider.dart';
import 'package:weather_app/Screens/HomeScreen/view/HomePage.dart';
import 'package:weather_app/Screens/SplashScreen/view/SplashPage.dart';
import 'package:weather_app/Screens/SplashScreen/view/StartPage.dart';

void main()
{
  runApp(
    ChangeNotifierProvider(
      create: (context) => HomeProvider(),
      child: Sizer(
        builder: (context, orientation, deviceType) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            routes: {
              '/' : (context) => StartPage(),
              'First' : (context) => SplashPage(),
              'Home' : (context) => HomePage(),
            },
          );
        },
      ),
    )
  );
}