import 'package:flutter/material.dart';

class MovieCell extends StatelessWidget {
  final movies;
  final i;
  final mainColor = Colors.black;
  final image_url = 'https://image.tmdb.org/t/p/w500/';
  MovieCell(this.movies, this.i);

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
          
            Container(
               
                width: 110.0,
                height: 150.0,
                decoration: new BoxDecoration(
                  borderRadius: new BorderRadius.circular(5.0),
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
         
             
      ],
    );
  }
}