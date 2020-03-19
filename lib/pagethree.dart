import 'package:flutter/material.dart';
import 'package:quick_medicare/info.dart';
import 'package:quick_medicare/mypainter.dart';

class MyPageThree extends StatefulWidget{

  @override
  State createState() {
    return _MyPageThreeState();
  }
}

class _MyPageThreeState extends State<MyPageThree> {

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Stack(
          children: <Widget>[
            //Container(color: Color(0xffFFF9C4)),0xffB2EBF2
            Container(color: Colors.white38),//Color(0xffB2EBF2)
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
                  /*Image.network("https://cdn2.iconfinder.com/data/icons/artificial-intelligence-ai-color/64/diagram-deep-learning-machine-network-nural-512.png",
                    fit: BoxFit.contain,
                    width: SizeConfig.screenWidth,
                    height: SizeConfig.blockSizeVertical * 20,)*/
                  Image.asset(
                    'assets/reg.png',
                    fit: BoxFit.contain,
                    width: SizeConfig.screenWidth,
                    height: SizeConfig.blockSizeVertical * 44,
                  ),
                ),
                SizedBox(height: SizeConfig.blockSizeVertical ,),
                Padding(
                  padding: EdgeInsets.only(left: SizeConfig.blockSizeHorizontal * 14),
                  child: Text(
                    //"Smart",
                    "Easy",
                    style: TextStyle(
                        letterSpacing: 2,
                        fontSize: SizeConfig.blockSizeHorizontal * 7.6,
                        color: Colors.blueGrey,
                        fontWeight: FontWeight.w300
                    ),
                  ),
                ),
                SizedBox(height: SizeConfig.blockSizeVertical),
                Padding(
                  padding: EdgeInsets.only(left: SizeConfig.blockSizeHorizontal * 14),
                  child: Text(
                    //"PREDICTION",
                    "REGISTRATION",
                    style: TextStyle(
                        letterSpacing: 0,
                        fontSize: SizeConfig.blockSizeHorizontal * 10.2,
                        color: Color(0xff607D8B),
                        fontWeight: FontWeight.w900
                    ),
                  ),
                ),
                SizedBox(height: SizeConfig.blockSizeVertical * 2),
                Padding(
                  padding: EdgeInsets.only(left: SizeConfig.blockSizeHorizontal * 14, right: SizeConfig.blockSizeHorizontal * 14),
                  child: Text(
                    //"Simply upload all your symptoms and your machine learning and algorithm will predict the disease!",
                    "Simply upload all the birth detail in the app and we manage the birth record efficiently.",
                    style: TextStyle(
                      letterSpacing: 0.4,//4
                      fontSize: SizeConfig.blockSizeHorizontal * 4.2,
                      color: Color(0xff616161),
                    ),
                  ),
                ),
                SizedBox(height: SizeConfig.blockSizeVertical * 12,),
                Padding(
                  padding: EdgeInsets.only(left: SizeConfig.blockSizeHorizontal * 14, right: SizeConfig.blockSizeHorizontal * 14),
                  child: Row(
                    children: <Widget>[
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
                        radius: SizeConfig.blockSizeHorizontal * 1.8,
                        backgroundColor: Color(0xffB0BEC5),
                      ),
                      SizedBox(width: SizeConfig.blockSizeHorizontal * 4,),
                      CircleAvatar(
                        radius: SizeConfig.blockSizeHorizontal * 1.4,
                        backgroundColor: Color(0xffE0E0E0),
                      ),
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