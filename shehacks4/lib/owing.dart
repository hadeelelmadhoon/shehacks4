import 'package:flutter/material.dart';

class OwingPage extends StatelessWidget {
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
          ],
        )
      )
    );
  }
}