import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }


}


class MyAppState extends State<MyApp> {

  int selectedPage = 0;
  final pageOptions = [
    Text('Item 1'),
    Text('Item 2'),
    Text('Item 3'),
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
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.attach_money),
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.person),
            ),
          ],
        ),
      ),
    );
  }
}