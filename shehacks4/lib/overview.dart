import 'package:flutter/material.dart';
import './owed.dart';
import './owing.dart';

class OverviewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.green,
            bottom: TabBar(
              tabs: <Widget>[
                Tab(icon: Icon(Icons.favorite)),
                Tab(icon: Icon(Icons.mail)),
                Tab(icon: Icon(Icons.bookmark)),
              ],
            ),
            title: Text('Testing'),
          ),
          body: TabBarView(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.all(100),
                child: Column(
                  children: <Widget>[
                    Text("hello"),
                    Text("sup")
                  ],
                ),
              ),
              OwedPage(), 
              OwingPage()
            ],
          ),
        ),
      ),
    );
  }
}
