import 'package:flutter/material.dart';
import './owing.dart';

class OverviewPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(48),
            child: AppBar(
              backgroundColor: Colors.green,
              bottom: TabBar(
              tabs: <Widget>[
                Tab(
                  icon: Align(alignment: Alignment.centerRight,
                    child: Icon(
                    Icons.radio_button_unchecked,
                    size: 10,
                    ),
                  )),
                Tab(
                  icon: Align(alignment: Alignment.centerLeft,
                      child: Icon(
                        Icons.radio_button_unchecked,
                        size: 10,
                      ),
                  )),
              ],
            ),
            title: Text('Your Overview!'),
          ),
          ),
          body: TabBarView(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.all(10),
                child: Column(
                  children: <Widget>[
                    Text("hello"),
                    Text("sup")
                  ],
                ),
              ),
              OwingPage()
            ],
          ),
        ),
      ),
    );
  }
}
