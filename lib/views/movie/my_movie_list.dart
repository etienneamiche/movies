import 'package:movies/models/movie.dart';
import 'package:flutter/material.dart';
import 'package:movies/models/user.dart';
import 'package:movies/views/movie/movie_cell.dart';
import 'package:movies/views/movie/movie_list.dart';
import 'package:provider/provider.dart';
import 'package:movies/services/database.dart';

import 'list_title.dart';

class MyMovieList extends StatefulWidget {
  
  @override
  MyMovieListState createState(){
    return MyMovieListState();
  }
}

class MyMovieListState extends State<MyMovieList> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    final image_url = 'https://image.tmdb.org/t/p/w500/';

    //final list = Provider.of<List<Movie>>(context)??[];
    //print("movie firebase="+list.toString());
    return StreamBuilder<List<Movie>>(
        stream: DatabaseServices(uid: user.uid).list,
        builder: (context,snapshot){
          if(snapshot.hasData){
            var userMovie = snapshot.data;

           return ListView.builder(
            itemCount: userMovie.length,
            itemBuilder: (context, i) {
                return  new Column(
                children:<Widget>[
                    new Row(
                          children: <Widget>[
                            new Padding(
                              padding: const EdgeInsets.all(0.0),
                              child: new Container(
                                margin: const EdgeInsets.all(16.0),
                                child: new Container(
                                  width: 70.0,
                                  height: 70.0,
                                ),
                                decoration: new BoxDecoration(
                                  borderRadius: new BorderRadius.circular(10.0),
                                  color: Colors.black,
                                  image: new DecorationImage(
                                      image: new NetworkImage(
                                          image_url + userMovie[i].poster_path),
                                      fit: BoxFit.cover),
                                  boxShadow: [
                                    new BoxShadow(
                                        color: Colors.black,
                                        blurRadius: 5.0,
                                        offset: new Offset(2.0, 5.0))
                                  ],
                                ),
                              ),
                            ),
                            new Expanded(
                                child: new Container(
                              margin: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
                              child: new Column(
                                children: [
                                  new Text(
                                    userMovie[i].title,
                                    style: new TextStyle(
                                        fontSize: 20.0,
                                        fontFamily: 'Arvo',
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                  new Padding(padding: const EdgeInsets.all(2.0)),
                                  new Text(
                                    userMovie[i].overview,
                                    maxLines: 3,
                                    style: new TextStyle(
                                        color: Colors.black, fontFamily: 'Arvo'),
                                  )
                                ],
                                crossAxisAlignment: CrossAxisAlignment.start,
                              ),
                            )),
                             FlatButton(
                                onPressed:() async {
                                  await DatabaseServices(uid:user.uid).deleteMovieToUserList(userMovie[i].title);
                                  print("doument deleted");
                                },
                                child:  new Container(
                                padding: const EdgeInsets.all(16.0),
                                alignment: Alignment.center,
                                child: new Icon(
                                  Icons.remove_red_eye,
                                  color: Colors.indigo,
                          
                                )
                              )
                            )
                          ],
                        )
                      ]);
                  });
                }
            },
      
    );
    
 
  }
}