import 'package:flutter/material.dart';
import './users.dart';

class ExperienceDetailPage extends StatelessWidget {
  final String name;
  ExperienceDetailPage(this.name);
  @override
  // Widget build(BuildContext context){
  //   return Container(
  //     child: Text(name),
  //   );
  // }
  Widget build(BuildContext context) {
  return Material(
    color: Colors.white,
    child: Center(
      child: Ink(
        decoration: const ShapeDecoration(
          color: Colors.lightBlue,
          shape: CircleBorder(),
        ),
        child: IconButton(
          icon: Icon(Icons.person),
          color: Colors.white,
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=> UsersPage(name)));
          },
        ),
      ),
    ),
  );
}

}