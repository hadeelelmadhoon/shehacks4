import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:collection';

class OwingPage extends StatelessWidget {

  final databaseReference = Firestore.instance;

  List<String> newString = [];
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
            Align(
              alignment: Alignment.topCenter,
              child: Text("Money Owing", 
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)
                )
            ),
            Container(child: Text("hadeele: +\$200\n")),
            Container(child: Text("sarahs: +\$30\n")),
            Container(child: Text("evelynb: +\$350\n")),
            // Text(owesMeString())
            // Row(children: <Widget>[
            //   Text(getOwing()),
            //   Text(getUser("hadeele"))
            // ]),
            // Container(
            //   // alignment: Alignment.topCenter,
            //   child: Text(getUser("khk"))),
          ]
            ),
        )
      );
  }

  HashMap getOwesMe(){
    HashMap map = HashMap();

    databaseReference.collection("users").getDocuments().then((QuerySnapshot qs) {
      qs.documents.forEach((f) => {
          print(f.data["username"]),
            map.putIfAbsent(f.data["username"], () => 0)
      });
      map.putIfAbsent("hadeele", () => 0);
    });

    var people = 0;
    var str = "";
    print("hello");
    databaseReference.collection("expenses").getDocuments().then((QuerySnapshot s) {
      s.documents.forEach((f) => {
          people++,
          str = f.data["cost"]
      });
      print(people);
      var cost = int.tryParse(str);
      var c = cost/people;
      s.documents.forEach((f) => {
        f.data["split"].forEach((p) => {
          map.update(p, (v) => (map[p] + c)),
          print("person: " + map[p])
        })
      });

    });
    return map;
  }

  String owesMeString() {
    String str = "";
    HashMap map = getOwesMe();
    map.forEach((k, v) {
      str += '{ $k: $v } \n';
    });
    print(map["evelynb"]);
    print(str);
    return str;
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