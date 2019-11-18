import 'package:flutter/material.dart';

class MovieCell extends StatelessWidget {
  final movies;
  final i;
  Color mainColor = Colors.black;
  var image_url = 'https://image.tmdb.org/t/p/w500/';
  MovieCell(this.movies, this.i);

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
            new Padding(
              padding: const EdgeInsets.all(0.0),
              child: new Container(
                margin: const EdgeInsets.all(16.0),
                child: new Container(
                  width: 70.0,
                  height: 100.0,
                ),
                decoration: new BoxDecoration(
                  borderRadius: new BorderRadius.circular(1.0),
                  color: Colors.grey,
                  image: new DecorationImage(
                      image: new NetworkImage(
                          image_url + movies[i]['poster_path']),
                      fit: BoxFit.cover
                  ),
                  boxShadow: [
                    new BoxShadow(
                        color: mainColor,
                        blurRadius: 5.0,
                        offset: new Offset(2.0, 5.0))
                  ],
                ),
              ),
            ),  
            SizedBox(
              width: 100,
              child: Center(
                child:Text(
                movies[i]['title'],
                maxLines: 2,
                textAlign: TextAlign.center,
                style: new TextStyle(
                    color: Colors.black, fontFamily: 'Arvo',fontSize: 18),
                ),
              )
            )
             
      ],
    );
  }
}