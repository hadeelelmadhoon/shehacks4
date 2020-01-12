import 'package:flutter/material.dart';

class OwedPage extends StatelessWidget {
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
              child: Text("Money Owed", 
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)
                )
            ),
            Column(children: <Widget>[
              Padding(
                padding: EdgeInsets.all(50),
                child: Text("hadeele:                          -\$90\n",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15, color: Colors.green,)),
              ),
            // ],
            // ),
            // Row(children: <Widget>[
              Padding(
                padding: EdgeInsets.all(50),
                child: Text("sarahs:                           -\$400\n",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15, color: Colors.green,)),
              ),
            // ],),
            // Row(children: <Widget>[
              Padding(
                padding: EdgeInsets.all(50),
              child: Text("evelynb:                           -\$222\n",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15, color: Colors.green,)),
              )
            ],),]
            ),
            ),
        );
  }}