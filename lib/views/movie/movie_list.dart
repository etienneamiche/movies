import 'package:flutter/material.dart';
import 'package:movies/views/movie/list_title.dart';
import 'movie_cell.dart';
import 'movie_detail.dart';

class MovieList extends StatelessWidget {
  var movies;
  var name;
  MovieList(this.movies,this.name);

  @override
  Widget build(BuildContext context) {
    return Container(
      child:  Padding(
        padding: const EdgeInsets.all(16.0),
        child:  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
             ListTitle(Colors.black, name),
             Expanded(
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: movies == null ? 0 : movies.length,
                    itemBuilder: (context, i) {
                      return FlatButton(
                        child: MovieCell(movies, i),
                        padding: const EdgeInsets.all(0.0),
                        onPressed: () {
                          Navigator.push(context,
                               MaterialPageRoute(builder: (context) {
                                return MovieDetail(movies[i]);
                          }));
                        },
                        color: Colors.transparent,
                      );
                    }
                  )
              )
            
          ],

        ),
      ),
    );
  }
}