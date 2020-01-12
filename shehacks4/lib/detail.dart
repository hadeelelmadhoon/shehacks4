import 'package:flutter/material.dart';
import './users.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ExperienceDetailPage extends StatefulWidget {
  final String name;
  ExperienceDetailPage(this.name);

  @override
  ExperienceDetailPageState createState() => ExperienceDetailPageState(name);
}

class ExperienceDetailPageState extends State<ExperienceDetailPage> {
  final String name;
  ExperienceDetailPageState(this.name);

  Future getExpenses() async{
    var db = Firestore.instance;
    QuerySnapshot query = await db.collection("expenses").where('exp', isEqualTo: name).getDocuments();
    return query.documents;
  }

  @override
  Widget build(BuildContext context) {
  return Container(
    color: Colors.white,
    child: FutureBuilder(
      future: getExpenses(),
      builder: (_, ss){
        if(ss.connectionState == ConnectionState.waiting){
          return Center(child: Text("Loading..."),          
          );
        }
        else {
          return ListView.builder(
            itemCount: ss.data.length,
            itemBuilder: (_, i){
              // var str = ss.data[i].data["cost"];
              var cost = int.tryParse(ss.data[i].data["cost"]);
              List<dynamic> s = ss.data[i].data["split"];
              var people = 0;
              s.forEach((f) =>{
                people++
                });
              var c = cost/(people+1);
              String s1 = "";
              s.forEach((f) =>{
                s1 += (f + " -" + c.toString() + "\n\n")
                });
              
              // return Container();
              return Container(
                decoration: BoxDecoration(color: Colors.white),
                child: Card(
                  child: new Stack(
                    children: <Widget>[
                      Container(
                        color: Colors.white,
                      ),
                      ListTile(
                        title: Text(ss.data[i].data["expense"] + "\n", style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
                        subtitle: Text(s1, style: TextStyle(color: Colors.green, fontStyle: FontStyle.italic, fontSize: 15.0),),
                    
                      )
                    ],
                  )
                ));
                // child:ListTile(
                // title: Text(ss.data[i].data["expense"]),
              // ));
            }
          );
          }
        }
      )
    );    
  }
}

/*Material(
    color: Colors.white,
    child: Center(
      child: Align(
        alignment: Alignment(0.85, -0.85),
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
    ),
  )
  );*/