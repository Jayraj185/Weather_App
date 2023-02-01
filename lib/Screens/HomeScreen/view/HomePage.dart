import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:weather_app/Screens/HomeScreen/model/WeatherModel.dart';
import 'package:weather_app/Screens/HomeScreen/provider/HomeProvider.dart';
import 'package:weather_app/Utils/api_http.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeProvider? homeProviderTrue;
  HomeProvider? homeProviderFalse;
  @override
  Widget build(BuildContext context) {
    homeProviderTrue = Provider.of<HomeProvider>(context,listen: true);
    homeProviderFalse = Provider.of<HomeProvider>(context,listen: false);
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
            child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.topCenter,
        decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                Color(0xFF65B1D1),
                Color(0xFF8CC3DD),
                Colors.white,
                Colors.white,
              ])),
        child: Column(
            children: [
              Container(
                height: 8.h,
                margin: EdgeInsets.symmetric(horizontal: 3.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.grid_view_rounded,
                          color: Colors.black,
                          size: 30,
                        )),
                    AnimatedContainer(
                        duration: Duration(seconds: 2),
                      height: MediaQuery.of(context).size.height/16,
                      width: homeProviderTrue!.search?MediaQuery.of(context).size.width/1.5:0.0,
                      // color: Colors.red,
                      alignment: Alignment.center,
                      child: TextField(
                        controller: homeProviderTrue!.txtSearch,
                        decoration: InputDecoration(
                          hintText: "Search Ex. Surat",
                          focusedBorder: UnderlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide(color: Colors.black)
                          )
                        ),
                        onSubmitted: (value) {
                          Apihttp().getWeatherData("${homeProviderTrue!.txtSearch.text.isEmpty?"Surat":homeProviderTrue!.txtSearch.text}");
                        },
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          homeProviderFalse!.ChnageBoolValue();
                        },
                        icon: Icon(
                          Icons.search,
                          color: Colors.black,
                          size: 30,
                        )),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  child: FutureBuilder<WeatherModel?>(
                    future: Apihttp().getWeatherData("${homeProviderTrue!.txtSearch.text.isEmpty?"Surat":homeProviderTrue!.txtSearch.text}"),
                    builder: (context, snapshot) {
                      if(snapshot.hasError)
                        {
                          return Center(child: Text("${snapshot.error}"),);
                        }
                      else if(snapshot.hasData)
                        {
                          WeatherModel? data = snapshot.data;
                          return Column(
                            children: [
                              Text(
                                "${data!.name}",
                                style: GoogleFonts.merriweather(
                                  fontSize: 25.sp,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w900
                                ),
                              ),
                              SizedBox(height: 1.5.h,),
                              Text(
                                "${data!.weather![0].main}",
                                style: GoogleFonts.merriweather(
                                  fontSize: 15.sp,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w900
                                ),
                              ),
                              Container(
                                height: MediaQuery.of(context).size.height/4,
                                width: MediaQuery.of(context).size.width/2,
                                child: Image.asset("assets/image/morningweather.png"),
                              ),
                              SizedBox(height: 1.h,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "${((data.wind!.deg! - 32) * 5/9).toStringAsFixed(0)}",
                                    style: GoogleFonts.notoSerifAhom(
                                        fontSize: 25.sp,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w900
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 1.5.h),
                                    child: Text(
                                      " °C",
                                      style: GoogleFonts.notoSerifAhom(
                                          fontSize: 15.sp,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w900
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 2.1.h,),
                              Container(
                                height: 8.h,
                                margin: EdgeInsets.symmetric(horizontal: 6.w),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Today",
                                      style: GoogleFonts.merriweather(
                                          fontSize: 15.sp,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w900
                                      ),
                                    ),
                                    Text(
                                      "See All",
                                      style: GoogleFonts.merriweather(
                                          fontSize: 12.sp,
                                          color: Colors.grey,
                                          fontWeight: FontWeight.bold,
                                          decoration: TextDecoration.underline,
                                          decorationColor: Colors.grey
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height/5.6,
                                width: MediaQuery.of(context).size.width,
                                child: ListView.builder(
                                  itemCount: homeProviderTrue!.weatherList.length,
                                  physics: BouncingScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    return Align(
                                      alignment: Alignment.topLeft,
                                      child: Container(
                                        margin: EdgeInsets.symmetric(horizontal: 10),
                                        width: MediaQuery.of(context).size.width/4.5,
                                        decoration: DateTime.now().hour==homeProviderTrue!.weatherList[index].time?BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(21),
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Colors.black12,
                                                  blurRadius: 6,
                                                  offset: Offset(0,0)
                                              ),
                                            ]
                                        ):BoxDecoration(
                                            color: Colors.lightBlueAccent.shade100,
                                            borderRadius: BorderRadius.circular(21),
                                        ),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          children: [
                                            SizedBox(width: 4.w,),
                                            Text(
                                              "${homeProviderTrue!.weatherList[index].time}",
                                              style: GoogleFonts.notoSerifAhom(
                                                  fontSize: 12.sp,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w900
                                              ),
                                            ),
                                            Container(
                                              child: Column(
                                                children: [
                                                  Container(
                                                    margin: EdgeInsets.only(bottom: 0.5.h),
                                                    height: MediaQuery.of(context).size.height/25,
                                                    width: MediaQuery.of(context).size.width/10,
                                                    child: Image.asset("assets/image/morningweather.png"),
                                                  ),
                                                  SizedBox(width: 3.w,),
                                                  Text(
                                                    "${homeProviderTrue!.weatherList[index].cel}°",
                                                    style: GoogleFonts.notoSerifAhom(
                                                        fontSize: 12.sp,
                                                        color: Colors.black,
                                                        fontWeight: FontWeight.w900
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Text(
                                              "${homeProviderTrue!.weatherList[index].main}",
                                              style: GoogleFonts.notoSerifAhom(
                                                  fontSize: 13.sp,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w900
                                              ),
                                            ),
                                            SizedBox(width: 3.w,),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                              Container(
                                height: 8.h,
                                margin: EdgeInsets.symmetric(horizontal: 6.w),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Tomorrow",
                                      style: GoogleFonts.merriweather(
                                          fontSize: 15.sp,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w900
                                      ),
                                    ),
                                    Text(
                                      "See All",
                                      style: GoogleFonts.merriweather(
                                          fontSize: 12.sp,
                                          color: Colors.grey,
                                          fontWeight: FontWeight.bold,
                                          decoration: TextDecoration.underline,
                                          decorationColor: Colors.grey
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: MediaQuery.of(context).size.height/11,
                                width: MediaQuery.of(context).size.width/1.1,
                                decoration: BoxDecoration(
                                    color: Colors.lightBlueAccent.shade100,
                                    borderRadius: BorderRadius.circular(21),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      "01.00",
                                      style: GoogleFonts.notoSerifAhom(
                                          fontSize: 15.sp,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w900
                                      ),
                                    ),
                                    Container(
                                      child: Row(
                                        children: [
                                          Container(
                                          margin: EdgeInsets.only(bottom: 0.7.h),
                                          height: MediaQuery.of(context).size.height/25,
                                          width: MediaQuery.of(context).size.width/10,
                                          child: Image.asset("assets/image/morningweather.png"),
                                        ),
                                          SizedBox(width: 3.w,),
                                          Text(
                                            "Rainy Day",
                                            style: GoogleFonts.notoSerifAhom(
                                                fontSize: 15.sp,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w900
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(width: 3.w,),
                                    Text(
                                      "24°",
                                      style: GoogleFonts.notoSerifAhom(
                                          fontSize: 15.sp,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w900
                                      ),
                                    ),
                                    //SizedBox(width: 3.w,)
                                  ],
                                ),
                              )
                            ],
                          );
                        }
                      return Center(child: CircularProgressIndicator(color: Colors.lightBlueAccent,));
                    },
                  ),
                ),
              )
            ],
        ),
      ),
          )),
    );
  }
}
