import 'package:flutter/material.dart';
import 'package:movies/services/auth.dart';
import 'package:movies/ui/background.dart';
import 'package:movies/views/home/home_list.dart';



class Home extends StatelessWidget {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {


    return Container(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Home'),
          backgroundColor: Colors.indigo,
          elevation: 0.0,
          actions: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.person,color: Colors.white,),
              label: Text('logout',style: TextStyle(color: Colors.white),),
              onPressed: () async {
                await _auth.signOut();
              },
            ),
          ],
        ),
        body:Stack(
          children: <Widget>[
            Background(),
            HomeList(),
          ]
        )
      )
    );
  }
}