import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import './details.dart';

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
                          title: Align(
                              child: new Text(
                                snapshot.data[index].data["name"],
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 45.0, fontWeight: FontWeight.bold),
                                ),
                              alignment: Alignment(0, 0)
                            )
                          ),
                        new InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> ExperiencesDetailPage()));
                        },
                        // child: Container(
                        //   width: 100.0,
                        //   height: 100.0,
                        //   ),
                        ),
                  
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

