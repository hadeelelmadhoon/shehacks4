import 'package:flutter/material.dart';
import './profile.dart';
import './experiences.dart';
import './overview.dart';
import './login.dart';


class ProfilePage extends StatelessWidget {

  // @override
  // Widget build(BuildContext context) {
  //   return new Scaffold(
  //     //appBar: _buildBar(context),
  //     body: new Container(
  //       padding: EdgeInsets.all(16.0),
  //       child: new Column(
  //         children: <Widget>[
  //           //_buildTextFields(),
  //           _buildButtons(),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  // Widget _buildButtons() {
  //     return new Container(
  //       child: new Column(
  //         children: <Widget>[
  //           new RaisedButton(
  //             child: new Text('Logout', style: new TextStyle(fontSize:10.0, color: Colors.green,
  //              backgroundColor: Colors.grey[750])),
  //              onPressed: (){},
  //              //onPressed: Navigator.popUntil(context, ModalRoute.withName(ScreenName.loginScreen));
  //           ),
  //         ],
  //       ),
  //     );
  //   }     
  // }
 

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
            title: Text('Your Overview!', style: new TextStyle(fontSize: 30)),
          ),
          ),
          body: TabBarView(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.all(10),
                child: Column(
                  children: <Widget>[
                    Text('Profile Totals', style: new TextStyle(fontSize: 35, fontFamily: 'Georgia', color: Colors.green )),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.all(10),
                child: Column(
                  children: <Widget>[
                    Text('Personal Information', style: new TextStyle(fontSize: 35, fontFamily: 'Georgia', color: Colors.green )),
                    Text('Username:', style: new TextStyle(fontSize: 18, fontFamily: 'Georgia')),
                    Text(''),
                    Text('To Logout: ', style: new TextStyle(fontSize: 18, fontFamily: 'Georgia')),
                    Text(''),
                    new RaisedButton(
                    child: new Text('Logout', style: new TextStyle(fontSize:10.0, color: Colors.green,
                    backgroundColor: Colors.grey[750])),
                    onPressed: (){},
                    //onPressed: Navigator.popUntil(context, ModalRoute.withName(ScreenName.loginScreen));
            ),
                  ],)
                  
              )
            ],
          ),
        ),
      ),
    );
  }
}
