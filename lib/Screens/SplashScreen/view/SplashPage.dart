import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:weather_app/Screens/HomeScreen/provider/HomeProvider.dart';
import 'package:weather_app/Screens/SplashScreen/view/shared_preffrence.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: Lottie.asset("assets/animation/weatheranimation.json"),
              ),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.only(top: 35.h),
                  child: Text(
                    "Take Care Of Your Day By",
                    style: TextStyle(
                      fontSize: 15.sp,
                      color: Colors.lightBlueAccent
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.only(top: 41.h),
                  child: Text(
                    "Checking The Weather Forecast",
                    style: TextStyle(
                        fontSize: 15.sp,
                        color: Colors.lightBlueAccent
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.only(top: 60.h),
                  child: InkWell(
                    onTap: (){
                      CreateData(true);
                      Navigator.pushReplacementNamed(context, 'Home');
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height/15,
                      width: MediaQuery.of(context).size.width/2.1,
                      decoration: BoxDecoration(
                        color: Colors.lightBlueAccent,
                        borderRadius: BorderRadius.circular(15)
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        "Start Now",
                        style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w900,
                            color: Colors.white
                        ),
                      ),
                    ),
                  )
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
