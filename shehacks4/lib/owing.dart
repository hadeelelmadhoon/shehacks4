import 'package:flutter/material.dart';

class OwingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    // return Container(
    //   child: Text('Overview'),
    // );
    return Scaffold(
      body:Container(
        width: MediaQuery
          .of(context)
          .size
          .height,
        decoration: BoxDecoration(
          image: new DecorationImage(
            fit: BoxFit.fitWidth,
            image: new NetworkImage("https://i-cdn.phonearena.com/images/articles/303459-image/google-pixel-2-stock-wallpaper.jpg"))
        ),
        child:Stack(
          children: <Widget>[
            Positioned(
              right:0.0,
              top:0.0,
              child: new Icon(Icons.favorite, color:Colors.red, size:30.0),
            )
          ],
        )
      )
    );
  }
}