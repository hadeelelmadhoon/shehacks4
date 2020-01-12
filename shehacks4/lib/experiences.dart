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
                return Container(
                  height: 150,
                  child: Card(
                    semanticContainer: true,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: new Stack(
                      children: <Widget>[
                          // Image.network(
                          // snapshot.data[index].data["img"],
                          // fit: BoxFit.fitWidth,
                          // ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                            color: const Color(0xffebebeb),
                            image: DecorationImage(
                            colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.35), BlendMode.dstATop),
                            fit: BoxFit.fitWidth,
                            image: NetworkImage(snapshot.data[index].data["img"]),
                            ),
                            ),
                            ),
                          ListTile(
                          title: Text(snapshot.data[index].data["name"], textAlign: TextAlign.center, style: TextStyle(fontSize: 45.0, fontWeight: FontWeight.bold),
    )),
                      ]
                    )
                ),
              );
              });
        }
      }),
    );
  }

}

