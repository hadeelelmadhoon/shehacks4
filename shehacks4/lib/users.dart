import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UsersPage extends StatefulWidget {
  final String name;
  UsersPage(this.name);
  @override
  UsersPageState createState() => UsersPageState();
}

class UsersPageState extends State<UsersPage> {
  
  Future getUsers() async{
    var db = Firestore.instance;
    DocumentReference dr = db.collection("experience").document("");
    print(dr);
    return dr;
  }
  
  @override
  Widget build(BuildContext context){
    return Container(
      child: FutureBuilder(
        future: getUsers(),
        builder: (_, snapshot){
        if(snapshot.connectionState == ConnectionState.waiting){
          return Center(
            child: Text("Loading..."),
            );
        } else {
            return ListView.builder(
              // itemCount: snapshot.data.length,
              // for(int i = 0; i<snapshot.data.length; i++)


              
              // itemBuilder: (_, index){    
                itemBuilder: (_, index2){
                  return ListTile(
                  title: Text(snapshot.data[index2].data["users"]),
                );
                
              });
        }
      }),
    );
  }

}

