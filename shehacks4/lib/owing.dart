import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class OwingPage extends StatelessWidget {

  final databaseReference = Firestore.instance;

  String newString = "";
  int total = 0;
  int people = 1;
  int owing = 0;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Container(
        width: MediaQuery
          .of(context)
          .size
          .height,
        child: Stack(
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
            
            Row(children: <Widget>[
              Text(getOwing()),
              Text(getUser("hadeele"))
            ]),
            // Container(
            //   // alignment: Alignment.topCenter,
            //   child: Text(getUser("khk"))),
          ]
            ),
        )
      );
  }

  String getUser(String name){
    databaseReference.collection("expenses").getDocuments().then((QuerySnapshot qs) {
      qs.documents.forEach((f) => {
          owing += int.tryParse(f.data["cost"]),
          people = f.data["split"].length,
      });
    });
    return " -" + owing.toString();
  }

  String getOwing() {
    databaseReference.collection("expenses").getDocuments().then((QuerySnapshot qs) {
      qs.documents.forEach((f) => {
      total += int.tryParse(f.data["cost"]),
      people += 1});
    });
    print(total);
    print(people);
    print(total / people);
    return "this is a test";
  }
}