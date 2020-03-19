import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:liquid_swipe/Constants/Helpers.dart';
import 'package:quick_medicare/pageone.dart';
import 'package:quick_medicare/pagethree.dart';
import 'package:quick_medicare/pagetwo.dart';
import 'package:quick_medicare/pagefour.dart';
import 'homepage.dart';
void main() {
  runApp(
    MyApp(),
  );
}

// ignore: must_be_immutable
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //int page = 0;
  UpdateType updateType;

  final pages = [

    Container(child: MyPageOne()),
    Container(child: MyPageTwo(),),
    Container(child: MyPageThree(),),
    Container(child: MyPageFour(),),

  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes:  <String, WidgetBuilder> {
        '/landingpage': (BuildContext context)=> new MyApp(),
        //'/signup': (BuildContext context) => new SignupPage(),
        '/homepage': (BuildContext context) => new HomePage()
      },
      home: Scaffold(
        body: LiquidSwipe(
          onPageChangeCallback: pageChangeCallback,
          //currentUpdateTypeCallback: updateTypeCallback,
          pages: pages,
          fullTransitionValue: 500,
          enableSlideIcon: true,
          enableLoop: false,
          positionSlideIcon: 0.744,
          waveType: WaveType.liquidReveal,
          slideIconWidget: Icon(Icons.arrow_back_ios,size: 18,color: Color(0xff546E7A),),
          initialPage:0,
        ),
      ),
    );
  }

  pageChangeCallback(int page) {
    print(page);
  }

  updateTypeCallback(UpdateType updateType) {
    print(updateType);
  }
}
