// import 'package:flutter/material.dart';
// import './users.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class ExperienceDetailPage extends StatefulWidget {
//   final String name;
//   ExperienceDetailPage(this.name);
//   @override
//   ExperienceDetailPageState createState() => ExperienceDetailPageState(name);
// }

// class ExperienceDetailPageState extends State<ExperienceDetailPage> {
//   final String name;
//   ExperienceDetailPageState(this.name);

//   Future getExpenses() async{
//     var db = Firestore.instance;
//     QuerySnapshot query = await db.collection("experience").getDocuments();
//     return query.documents;
//   }

// @override
// // Widget build(BuildContext context){
// //     return Container(
// //       child: FutureBuilder(
// //         future: getExpenses(),
// //         builder: (_, snapshot){
// //         if(snapshot.connectionState == ConnectionState.waiting){
// //           return Center(
// //             child: Text("Loading..."),
// //             );
// //         } else {
// //           return ListView.builder(
// //               itemCount: snapshot.data.length,
// //               itemBuilder: (_, index){           
// //                 ListTile(
// //                   title: Align(
// //                    child: new Text(
// //                      snapshot.data[index].data["name"]),
// //                   )
// //                 );
// //               });           
// //         }
// //       }),
// //     );
// // }
// // }

//   Widget build(BuildContext context) {
//   return 
//   // Container(
//   //     child: FutureBuilder(
//   //       future: getExpenses(),
//   //       builder: (_, snapshot){
//   //       if(snapshot.connectionState == ConnectionState.waiting){
//   //         return Center(
//   //           child: Text("Loading..."),
//   //           );
//   //       } else {
//   //         return ListView.builder(
//   //             itemCount: snapshot.data.length,
//   //             itemBuilder: (_, index){           
//   //               ListTile(
//   //                 title: Align(
//   //                  child: new Text(
//   //                    snapshot.data[index].data["name"]),
//   //                 )
//   //               );
//   //             });           
//   //       }
//   //     }),
//   //   );
//   Container(
//       child: FutureBuilder(
//         future: getExpenses(),
//         builder: (_, snapshot){
//         if(snapshot.connectionState == ConnectionState.waiting){
//           return Center(
//             child: Text("Loading..."),
//             );
//         } else {
//             return ListView.builder(
//               itemCount: snapshot.data.length,
//               itemBuilder: (_, index){
//                 return Container(
//                   height: 150,
//                   child: Card(
//                     semanticContainer: true,
//                     clipBehavior: Clip.antiAliasWithSaveLayer,
//                     child: new Stack(
//                       children: <Widget>[
//                           Container(
//                             width: MediaQuery.of(context).size.width,
//                             decoration: BoxDecoration(
//                             color: const Color(0xffebebeb),
//                             image: DecorationImage(
//                             colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.35), BlendMode.dstATop),
//                             fit: BoxFit.fitWidth,
//                             image: NetworkImage(snapshot.data[index].data["img"]),
//                             ),
//                             ),
//                             ),
//                           ListTile(
//                           title: Align(
//                               child: new Text(
//                                 snapshot.data[index].data["name"],
//                                 textAlign: TextAlign.center,
//                                 style: TextStyle(fontSize: 45.0, fontWeight: FontWeight.bold),
//                                 ),
//                               alignment: Alignment(0, 0)
//                             )
//                           ),
//                         new InkWell(
//                         onTap: () {
//                           Navigator.push(context, MaterialPageRoute(builder: (context)=> ExperienceDetailPage(snapshot.data[index].data["name"])));
//                         },
//                         // child: Container(
//                         //   width: 100.0,
//                         //   height: 100.0,
//                         //   ),
//   ),
                  
//                       ]
//                     )
//                 ),
//               );
//               });
//         }
//       }),
//     //);
//   Material(
//     color: Colors.white,
//     child: Center(
//       child: Align(
//         alignment: Alignment(0.85, -0.85),
//         child: Ink(
//         decoration: const ShapeDecoration(
//           color: Colors.lightBlue,
//           shape: CircleBorder(),
//         ),
//         child: IconButton(
//           icon: Icon(Icons.person),
//           color: Colors.white,
//           onPressed: () {
//             Navigator.push(context, MaterialPageRoute(builder: (context)=> UsersPage(name)));
//           },
//         ),
//       ),
//     ),
//     ),
//   );
// }

// }


// // import 'package:flutter/material.dart';
// // import 'package:cloud_firestore/cloud_firestore.dart';
// // import './detail.dart';

// // class ExperienceDetailPage extends StatefulWidget {
// //   final String name;
// //   ExperienceDetailPage(this.name);
// //   @override
// //   ExperienceDetailPageState createState() => ExperienceDetailPageState();
// // }

// // class ExperienceDetailPageState extends State<ExperienceDetailPage> {
  
// //   Future getExperiences() async{
// //     var db = Firestore.instance;
// //     QuerySnapshot qn = await db.collection("experience").getDocuments();
// //     return qn.documents;
// //   }
  
// //   @override
// //   Widget build(BuildContext context){
// //     return Container(
// //       child: FutureBuilder(
// //         future: getExperiences(),
// //         builder: (_, snapshot){
// //         if(snapshot.connectionState == ConnectionState.waiting){
// //           return Center(
// //             child: Text("Loading..."),
// //             );
// //         } else {
// //             return ListView.builder(
// //               itemCount: snapshot.data.length,
// //               itemBuilder: (_, index){
// //                 return Container(
// //                   height: 150,
// //                   child: Card(
// //                     semanticContainer: true,
// //                     clipBehavior: Clip.antiAliasWithSaveLayer,
// //                     child: new Stack(
// //                       children: <Widget>[
// //                           Container(
// //                             width: MediaQuery.of(context).size.width,
// //                             decoration: BoxDecoration(
// //                             color: const Color(0xffebebeb),
// //                             image: DecorationImage(
// //                             colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.35), BlendMode.dstATop),
// //                             fit: BoxFit.fitWidth,
// //                             image: NetworkImage(snapshot.data[index].data["img"]),
// //                             ),
// //                             ),
// //                             ),
// //                           ListTile(
// //                           title: Align(
// //                               child: new Text(
// //                                 snapshot.data[index].data["name"],
// //                                 textAlign: TextAlign.center,
// //                                 style: TextStyle(fontSize: 45.0, fontWeight: FontWeight.bold),
// //                                 ),
// //                               alignment: Alignment(0, 0)
// //                             )
// //                           ),
                  
// //                       ]
// //                     )
// //                 ),
// //               );
// //               });
// //         }
// //       }),
// //     );
// //   }

// // }