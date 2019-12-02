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
     
  
        child:  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
             ListTitle(Colors.white, name),
             Expanded(
                child: GridView.builder(
                    gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                    itemCount: movies == null ? 0 : movies.length,
                    itemBuilder: (context, i) {
                      return FlatButton(
                        child: MovieCell(movies, i),
                      
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
      
    );
  }
}