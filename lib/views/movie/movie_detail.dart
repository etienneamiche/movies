
import 'package:flutter/material.dart';
import 'package:movies/models/user.dart';
import 'dart:ui' as ui;
import 'package:movies/services/database.dart';
import 'package:provider/provider.dart';

class MovieDetail extends StatelessWidget {
  final movie;
  
  var image_url = 'https://image.tmdb.org/t/p/w500/';
  MovieDetail(this.movie);
  Color mainColor = const Color(0xff3C3261);


  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    _addMovieToUserList(){
      
    }
    return new Scaffold(
      body: new Stack(fit: StackFit.expand, children: [
        new Image.network(
          image_url + movie['poster_path'],
          fit: BoxFit.cover,
        ),
        new BackdropFilter(
          filter: new ui.ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
          child: new Container(
            color: Colors.black.withOpacity(0.5),
          ),
        ),
        new SingleChildScrollView(
          child: new Container(
            margin: const EdgeInsets.all(20.0),
            child: new Column(
              children: <Widget>[
                new Container(
                  alignment: Alignment.center,
                  child: new Container(
                    width: 400.0,
                    height: 400.0,
                  ),
                  decoration: new BoxDecoration(
                      borderRadius: new BorderRadius.circular(10.0),
                      image: new DecorationImage(
                          image: new NetworkImage(
                              image_url + movie['poster_path']),
                          fit: BoxFit.cover),
                      boxShadow: [
                        new BoxShadow(
                            color: Colors.black,
                            blurRadius: 20.0,
                            offset: new Offset(0.0, 10.0))
                      ]),
                ),
                new Container(
                  margin: const EdgeInsets.symmetric(
                      vertical: 20.0, horizontal: 0.0),
                  child: new Row(
                    children: <Widget>[
                      new Expanded(
                          child: new Text(
                        movie['title'],
                        style: new TextStyle(
                            color: Colors.white,
                            fontSize: 30.0,
                            fontFamily: 'Arvo'),
                      )),
                      new Text(
                        '${movie['vote_average']}/10',
                        style: new TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontFamily: 'Arvo'),
                      )
                    ],
                  ),
                ),
                new Text(movie['overview'],style: new TextStyle(color: Colors.white, fontFamily: 'Arvo')),
                new Padding(padding: const EdgeInsets.all(10.0)),
                new Row(
                  children: <Widget>[
                    
                    
                    new Padding(
                        padding: const EdgeInsets.all(8.0),
                        child:FlatButton(
                          onPressed:() async {
                            await DatabaseServices(uid:user.uid).addMovieToUserList(movie);
                          },
                          child:  new Container(
                          padding: const EdgeInsets.all(16.0),
                          alignment: Alignment.center,
                          child: new Icon(
                            Icons.bookmark,
                            color: Colors.white,
                          ),
                          
                          decoration: new BoxDecoration(
                              borderRadius: new BorderRadius.circular(10.0),
                              color: const Color(0xaa3C3261)),
                        )
                        )
                    ),
                  ],
                )
              ],
            ),
          ),
        )
      ]),
    );
  }
                          
                            
}