import 'package:flutter/material.dart';
import 'package:quick_medicare/info.dart';
import 'package:quick_medicare/mypainter.dart';

class MyPageOne extends StatefulWidget{

  @override
  State createState() {
    return _MyPageOneState();
  }
}

class _MyPageOneState extends State<MyPageOne> {

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Stack(
          children: <Widget>[
            //Container(color: Color(0xffFFF9C4)),
            Container(color: Color(0xffCBE7EA)),
            Container(child: MyPainter(Colors.white),),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: SizeConfig.blockSizeVertical * 6,),
                Padding(
                  padding: EdgeInsets.only(left: SizeConfig.blockSizeHorizontal * 6.4,right:  SizeConfig.blockSizeHorizontal * 6.4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        //Quick Medicare
                        'BirthPad',
                        style: TextStyle(
                            fontFamily: 'Header',
                            fontSize: SizeConfig.blockSizeHorizontal * 5.2,
                            fontWeight: FontWeight.w900,
                            letterSpacing: 1.2,
                            color: Color(0xff757575)
                        ),
                      ),
                      Text(
                        'Skip',
                        style: TextStyle(
                          fontFamily: 'Header',
                          fontSize: SizeConfig.blockSizeHorizontal * 3.4,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0.4,
                          color: Color(0xff546E7A),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: SizeConfig.blockSizeVertical * 3,),
                Center(
                  child: /*Image.asset("https://cdn.dribbble.com/users/615726/screenshots/7189691/media/4a5c125eaafa38070daed538ab33cdc3.png"
                  ,fit: BoxFit.contain,
                    width: SizeConfig.screenWidth,
                    height: SizeConfig.blockSizeVertical * 44,)*/
                  Image.asset(
                    'assets/doc3.png',
                    fit: BoxFit.contain,
                    width: SizeConfig.screenWidth,
                    height: SizeConfig.blockSizeVertical * 44,
                  ),
                ),
                SizedBox(height: SizeConfig.blockSizeVertical * 4,),
                Padding(
                  padding: EdgeInsets.only(left: SizeConfig.blockSizeHorizontal * 14),
                  child: Text(
                    "Welcome To",
                    style: TextStyle(
                        letterSpacing: 2,
                        fontSize: SizeConfig.blockSizeHorizontal * 7.6,
                        color: Color(0xff1e4a4a),
                        fontWeight: FontWeight.w300
                    ),
                  ),
                ),
                SizedBox(height: SizeConfig.blockSizeVertical),
                Padding(
                  padding: EdgeInsets.only(left: SizeConfig.blockSizeHorizontal * 14),
                  child: Text(
                    //"QUICK MEDICARE",
                    "BIRTHPAD",
                    style: TextStyle(
                        letterSpacing: 4,
                        fontSize: SizeConfig.blockSizeHorizontal * 7,
                        color: Color(0xff607D8B),
                        fontWeight: FontWeight.w900
                    ),
                  ),
                ),
                SizedBox(height: SizeConfig.blockSizeVertical * 2),
                Padding(
                  padding: EdgeInsets.only(left: SizeConfig.blockSizeHorizontal * 14, right: SizeConfig.blockSizeHorizontal * 14),
                  child: Text(
                    //"App that manages your medical record , diagnose disease and give disease infected areas in real-time quickly!",
                    "App that manages birth record and immunization history in real-time!",
                    style: TextStyle(
                      letterSpacing: 0.4,
                      fontSize: SizeConfig.blockSizeHorizontal * 4.2,
                      color: Color(0xff616161),
                    ),
                  ),
                ),
                SizedBox(height: SizeConfig.blockSizeVertical * 8,),
                Padding(
                  padding: EdgeInsets.only(left: SizeConfig.blockSizeHorizontal * 14, right: SizeConfig.blockSizeHorizontal * 14),
                  child: Row(
                    children: <Widget>[
                      CircleAvatar(
                        radius: SizeConfig.blockSizeHorizontal * 1.8,
                        backgroundColor: Color(0xffB0BEC5),
                      ),
                      SizedBox(width: SizeConfig.blockSizeHorizontal * 4,),
                      CircleAvatar(
                        radius: SizeConfig.blockSizeHorizontal * 1.4,
                        backgroundColor: Color(0xffE0E0E0),
                      ),
                      SizedBox(width: SizeConfig.blockSizeHorizontal * 4,),
                      CircleAvatar(
                        radius: SizeConfig.blockSizeHorizontal * 1.4,
                        backgroundColor: Color(0xffE0E0E0),
                      ),
                      SizedBox(width: SizeConfig.blockSizeHorizontal * 4,),
                      CircleAvatar(
                        radius: SizeConfig.blockSizeHorizontal * 1.4,
                        backgroundColor: Color(0xffE0E0E0),
                      )
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}