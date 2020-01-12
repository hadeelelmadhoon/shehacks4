import 'package:flutter/material.dart';
import './profile.dart';
import './experiences.dart';
import './overview.dart';
import './login.dart';


class ProfilePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      //appBar: _buildBar(context),
      body: new Container(
        padding: EdgeInsets.all(16.0),
        child: new Column(
          children: <Widget>[
            //_buildTextFields(),
            _buildButtons(),
          ],
        ),
      ),
    );
  }

  Widget _buildButtons() {
      return new Container(
        child: new Column(
          children: <Widget>[
            new RaisedButton(
              child: new Text('Logout', style: new TextStyle(fontSize:10.0, color: Colors.lightGreen[100],
               backgroundColor: Colors.grey[750])),
               //onPressed: Navigator.popUntil(context, ModalRoute.withName(ScreenName.loginScreen));
            ),
          ],
        ),
      );
    }     
  }
  // _logoutPressed () {
  //   print('The user wants to login with $_email and $_password');
  //     Navigator.push(context, MaterialPageRoute(builder: (context)=> MyApp()));
  // }
