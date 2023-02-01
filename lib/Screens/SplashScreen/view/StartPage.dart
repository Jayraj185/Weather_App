import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:weather_app/Screens/HomeScreen/provider/HomeProvider.dart';

class StartPage extends StatefulWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  void initState() {
    super.initState();
    Provider.of<HomeProvider>(context,listen: false).ReadStartButton(context);
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Lottie.asset("assets/animation/first.json"),
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.only(top: 65.h,left: 1.5.w),
                child: Text(
                  "From",
                  style: TextStyle(
                      fontSize: 11.sp,
                      color: Colors.grey
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.only(top: 70.h),
                child: Text(
                  "Jayraj",
                  style: TextStyle(
                      fontSize: 15.sp,
                      color: Colors.black,
                    fontWeight: FontWeight.w900
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.only(top: 85.h),
                child: CircularProgressIndicator(color: Colors.lightBlueAccent,),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
