import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:quick_medicare/UserManagement.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'homepage.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final DBRef = FirebaseDatabase.instance.reference();
  String _email = '';
  String _pass = '';
  String _aadhar = '';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                child: Stack(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.fromLTRB(15.0, 80.0, 0.0, 0.0),//15.0, 110.0, 0.0, 0.0
                      child: Text(
                        'Signup',
                        style: TextStyle(
                            fontSize: 60.0, fontWeight: FontWeight.bold),//80
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(210.0, 80.0, 0.0, 0.0),//260.0, 125.0, 0.0, 0.0
                      child: Text(
                        '.',
                        style: TextStyle(
                            fontSize: 80.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                  padding: EdgeInsets.only( left: 20.0, right: 20.0),//top:35
                  child: Column(
                    children: <Widget>[
                      TextField(
                        decoration: InputDecoration(
                            labelText: 'NAME',
                            labelStyle: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                            // hintText: 'EMAIL',
                            // hintStyle: ,
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.green))),
                        onChanged: (String st) {
                          print(_email);
                          _email = st;
                        },
                      ),
                      TextField(
                        decoration: InputDecoration(
                            labelText: 'TELEPHONE NO.',
                            labelStyle: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                            // hintText: 'EMAIL',
                            // hintStyle: ,
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.green))),
                        onChanged: (String st) {
                          print(_email);
                          _email = st;
                        },
                      ),
                      TextField(
                        decoration: InputDecoration(
                            labelText: 'ADDRESS',
                            labelStyle: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                            // hintText: 'EMAIL',
                            // hintStyle: ,
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.green))),
                        onChanged: (String st) {
                          print(_email);
                          _email = st;
                        },
                      ),
                      TextField(
                        decoration: InputDecoration(
                            labelText: 'EMAIL',
                            labelStyle: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                            // hintText: 'EMAIL',
                            // hintStyle: ,
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.green))),
                        onChanged: (String st) {
                          print(_email);
                          _email = st;
                        },
                      ),


                      SizedBox(height: 10.0),
                      TextField(
                        decoration: InputDecoration(
                            labelText: 'PASSWORD ',
                            labelStyle: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.green))),
                        onChanged: (String st) {
                          print(_pass);
                          _pass = st;
                        },
                        obscureText: true,
                      ),
                      SizedBox(height: 10.0),
                      TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            labelText: 'TYPE (State whether Hospital, Nursing Home, Maternity Home,etc) ',
                            labelStyle: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.green))),
                        onChanged: (String st) {
                          print(_aadhar);
                          _aadhar = st;
                        },
                      ),

                      SizedBox(height: 20.0),//50
                      RaisedButton(
                        //padding: EdgeInsets.all(30),
                        elevation: 10,
                        shape: StadiumBorder(),
                        color: Colors.blue,
                        hoverColor: Colors.blueAccent,
                        /*child: Material(
                        //borderRadius: BorderRadius.circular(20.0),
                        shadowColor: Colors.blueAccent,
                        color: Colors.blue,
                        elevation: 7.0,*/
                        onPressed: (){

                          //CircularProgressIndicator();
                          print('button pressed');
                          FirebaseAuth.instance
                              .createUserWithEmailAndPassword(
                              email: _email, password: _pass)
                              .then((signedInUser) {
                            /*FirebaseAuth.instance
                                  .createUserWithEmailAndPassword(
                                  email: _email,
                                  password: _pass)
                                  .then((currentUser) =>*/
                            DBRef.child("users")
                                .child(signedInUser.user.uid)
                                .set({
                              //"uid": signedInUser.toString(),
                              "aadhar": _aadhar,
                              "password": _pass,
                              "email": _email,
                            })

                            /*Firestore.instance
                                  .collection("users")
                                  .document(currentUser.user.toString())
                                  .setData({
                                "uid": currentUser.user.toString(),
                                "aadhar": _aadhar,
                                "password": _pass,
                                "email": _email,
                              })*/
                                .then((result) => {
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomePage(
                                        uid: signedInUser.user.uid,
                                        /*title:
                                          firstNameInputController
                                              .text +
                                              "'s Tasks",
                                          uid: currentUser.uid,*/
                                      )),
                                      (_) => false),
//                                firstNameInputController.clear(),
//                                lastNameInputController.clear(),
//                                emailInputController.clear(),
//                                pwdInputController.clear(),
//                                confirmPwdInputController.clear()
                            });
                            /*  .catchError((err) => print(err)))
                                  .catchError((err) => print(err));
*/

                            //UserManagement().storeNewUser(signedInUser, context);
                          }).catchError((err) {
                            showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: Text(err.toString()),
                                ));
                          });
                          /*Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => HomePage()),
                            );*/
                        },
                        child: Center(
                          child: Text(
                            'SIGNUP',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Montserrat'),
                          ),
                        ),
                      ),
                      /*Container(
                          height: 40.0,
                          child: Material(
                            borderRadius: BorderRadius.circular(20.0),
                            shadowColor: Colors.blueAccent,
                            color: Colors.blue,
                            elevation: 7.0,
                            child: GestureDetector(
                              onTap: () {
                              },
                              child: Center(
                                child: Text(
                                  'SIGNUP',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Montserrat'),
                                ),
                              ),
                            ),
                          )),*/
                      SizedBox(height: 20.0),
                      Container(
                        height: 40.0,
                        color: Colors.transparent,
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.black,
                                  style: BorderStyle.solid,
                                  width: 1.0),
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(20.0)),
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: Center(
                              child: Text('Go Back',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Montserrat')),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
              // SizedBox(height: 15.0),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: <Widget>[
              //     Text(
              //       'New to Spotify?',
              //       style: TextStyle(
              //         fontFamily: 'Montserrat',
              //       ),
              //     ),
              //     SizedBox(width: 5.0),
              //     InkWell(
              //       child: Text('Register',
              //           style: TextStyle(
              //               color: Colors.green,
              //               fontFamily: 'Montserrat',
              //               fontWeight: FontWeight.bold,
              //               decoration: TextDecoration.underline)),
              //     )
              //   ],
              // )
            ]));
  }
}
