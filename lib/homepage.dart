import 'package:flutter/material.dart';
import 'login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:quick_medicare/ReportUpload.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:quick_medicare/FullscreenImage.dart';
//String uid="";
class HomePage extends StatefulWidget {
  String uid = "";
  HomePage({Key key, this.uid}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  List<Item> items = List();
  Item item;
  DatabaseReference itemRef;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    item = Item("","");
    final FirebaseDatabase database = FirebaseDatabase.instance; //Rather then just writing FirebaseDatabase(), get the instance.
    itemRef = database.reference().child('users').child(widget.uid).child('Reports');
    itemRef.onChildAdded.listen(_onEntryAdded);
    itemRef.onChildChanged.listen(_onEntryChanged);
  }

  _onEntryAdded(Event event) {
    setState(() {
      items.add(Item.fromSnapshot(event.snapshot));
    }
    );
  }

  _onEntryChanged(Event event) {
    var old = items.singleWhere((entry) {
      return entry.key == event.snapshot.key;
    });
    setState(() {
      items[items.indexOf(old)] = Item.fromSnapshot(event.snapshot);
    });
  }



//  final DBRef = FirebaseDatabase.instance.reference();
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Dashboard'),
        centerTitle: true,
        actions: <Widget>[
          FlatButton(
            child: Text(
              "Logout",
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            onPressed: (){
              //print(uid);
              FirebaseAuth.instance.signOut().then((value) {
                /*Navigator
                          .of(context)
                          .pushReplacementNamed('/landingpage');*/
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => login()),
                    ModalRoute.withName("/main"));
              }).catchError((e) {
                print(e);
              });
            },
          )
        ],
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Flexible(
              child: FirebaseAnimatedList(
                query: itemRef,
                itemBuilder: (BuildContext context, DataSnapshot snapshot,
                    Animation<double> animation, int index) {
                  return new ListTile(
                    leading: Icon(Icons.receipt),
                    title: Text(items[index].time),
                    //subtitle: Text(items[index].url),
                    onTap: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FullscreenImage(items[index].url)));
                    },

                    //subtitle: Text(items[index].body),
                  );
                },
              ),
            ),
          ],
        ),
          /*StreamBuilder(
            stream: DBRef.child("users")
                .child(widget.uid).child("Reports").onValue,
            builder: (context,snapshot)
            {
              if (!snapshot.hasData)
                return new Text('Loading...');
              else
                {
                  return new Text(snapshot.data.toString());
                }

              *//*return new ListView(
                children: snapshot.data.documents.map((document) {
                  return new ListTile(
                    title: new Text(document['url']),
                    //subtitle: new Text(document['body']),
                  );
                }).toList(),
              );*//*
            },
          ),*/

          //)




          /*new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text('You are now logged in :' + widget.uid),
              SizedBox(
                height: 15.0,
              ),
              new OutlineButton(
                borderSide: BorderSide(
                    color: Colors.red, style: BorderStyle.solid, width: 3.0),
                child: Text('Logout'),
                onPressed: () {
                  //print(uid);
                  FirebaseAuth.instance.signOut().then((value) {
                    *//*Navigator
                          .of(context)
                          .pushReplacementNamed('/landingpage');*//*
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => login()),
                        ModalRoute.withName("/main"));
                  }).catchError((e) {
                    print(e);
                  });
                },
              ),
            ],
          ),
        ),
      ),*/
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          print(widget.uid),
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ReportUpload(uid: widget.uid,)),
          )
        },
        child: Icon(Icons.file_upload),
        backgroundColor: Colors.blue,
      ),
    );
  }
}

class Item {
  String key;
  String url;
  String time;


  Item(this.url,this.time);

  Item.fromSnapshot(DataSnapshot snapshot)
      : key = snapshot.key,
        url = snapshot.value["url"],
        time = snapshot.value["time"];

  toJson() {
    return {
      "url": url,
      "time": time
    };
  }
}