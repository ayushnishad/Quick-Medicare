/*
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:quick_medicare/homepage.dart';

class UserManagement {
storeNewUser(user, context) {
Firestore.instance.collection('/users').add({
'email': user.email,
'uid': user.uid
}).then((value) {
Navigator.of(context).pop();
Navigator.of(context).pushReplacementNamed('/homepage');
  */
/*Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => HomePage()),
  );*//*

}).catchError((e) {
print(e);
});
}
}*/
