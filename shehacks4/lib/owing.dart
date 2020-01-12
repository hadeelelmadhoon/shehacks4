import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class OwingPage extends StatelessWidget {
  // static Firestore _firestore = Firestore.instance;

  // static Future<QuerySnapshot> getAllDoc() {
  //   return _firestore.collection("expenses").getDocuments();
  // }
  // QuerySnapshot alldoc =  getAllDoc();

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body:Container(
        width: MediaQuery
          .of(context)
          .size
          .height,
        child:Stack(
          children: <Widget>[
            Positioned(
              right:0.0,
              top:0.0,
              child: new Icon(Icons.favorite, color:Colors.red, size:30.0),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Text("Money Owing", 
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)
                )
            ),
            /////////////////
          ],
        )
      )
    );
  }
}