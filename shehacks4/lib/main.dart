import 'package:flutter/material.dart';
import './profile.dart';
import './experiences.dart';
import './overview.dart';
import './login.dart';


void main() => runApp(MyApp());

class MyAppLogin extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.lightBlueAccent,
        accentColor: Colors.amber[200],
      ),
      home: new LoginPage(),
    );
  }
}

class MyApp extends StatefulWidget {
 State<StatefulWidget> createState() {
   return MyAppState();
 }
}


class MyAppState extends State<MyApp> {
  int selectedPage = 0;
  final pageOptions = [
    ExperiencesPage(),
    OverviewPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(title: Text('Bottom Nav Bar'),),
        body: pageOptions[selectedPage],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedPage,
          onTap: (int index) {
            setState(() {
              selectedPage = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.event),
              title: Text('')
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.attach_money),
                title: Text('')
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.person),
                title: Text('')
            ),
          ],
        ),
      ),
    );
  }
}