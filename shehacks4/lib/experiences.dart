import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// final db = Firestore.instance;

// void getData() {
//   db
//       .collection("experiences")
//       .getDocuments()
//       .then((QuerySnapshot snapshot) {
//     snapshot.documents.forEach((f) => print('${f.data}}'));
//   });
// }

// class ExperiencesPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context){
//     return Container(
//       child: Text('Experiences'),
//     );
//   }
// }

class ExperiencesPage extends StatefulWidget {
  @override
  ExperiencesPageState createState() => ExperiencesPageState();
}

class ExperiencesPageState extends State<ExperiencesPage> {
  
  Future getExperiences() async{
    var db = Firestore.instance;
    QuerySnapshot qn = await db.collection("experience").getDocuments();
    return qn.documents;
  }
  
  @override
  Widget build(BuildContext context){
    return Container(
      child: FutureBuilder(
        future: getExperiences(),
        builder: (_, snapshot){
        if(snapshot.connectionState == ConnectionState.waiting){
          return Center(
            child: Text("Loading..."),
            );
        } else {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (_, index){
                return ListTile(
                  title: Text(snapshot.data[index].data["name"]),
                );
              });
        }
      }),
    );
  }

}

