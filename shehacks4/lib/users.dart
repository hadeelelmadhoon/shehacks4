import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UsersPage extends StatefulWidget {
  final String name;
  UsersPage(this.name);
  @override
  UsersPageState createState() => UsersPageState(name);
}

class UsersPageState extends State<UsersPage> {
  final String name;
  UsersPageState(this.name);
  final db = Firestore.instance;
  List<DocumentSnapshot> users; 

  Future getUsers() async{
    var db = Firestore.instance;
    Query query = db.collection("experience").where('name', isEqualTo: name);
    // print(query.toString());
    return query.getDocuments();
  }

  Future _getData() {
    db.collection("experience").where('name', isEqualTo: name)
    .getDocuments()
    .then((QuerySnapshot snapshot) {
      users = snapshot.documents;
      // print(users[0].data["users"]);
      return snapshot.documents;
    });
  }

  @override
  Widget build(BuildContext context){
    // return Container(
    //   child: FutureBuilder(
    //     future: getData(),
    //     builder: (_, snapshot){
    //       if(snapshot.connectionState == ConnectionState.waiting){
    //         return Center(
    //           child: Text("Loading..."),
    //           );
    //       } else {
    //         getData();
    //         return Container(
    //           child: Text(users[0].data["users"].toString())
    //         );
    //     }
    //   }),
    // );
    return Scaffold(
      body: FutureBuilder<List<dynamic>>(
        future: _getData(),
        builder: (context, snapshot) {
          print(users[0].data);
          if (users[0] == null) {
            return Center(child: CircularProgressIndicator());
          }
          return ListView(
            children: users.map((data) {
              print(data);
              return ListTile(
                title: Text(data["users"].toString()),
              );
            }).toList(),
          );
        },
      ),
    );
  }

}

