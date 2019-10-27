
import 'package:flutter/material.dart';
import 'package:movies/services/tmdb.dart';

import 'package:movies/views/movie/movie_detail.dart';
import 'package:movies/views/movie/movie_cell.dart';
import 'package:movies/views/movie/list_title.dart';



class TopRatedMovieList extends StatefulWidget {
  @override
  TopRatedMovieListState createState() {
    return new TopRatedMovieListState();
  }
}

class TopRatedMovieListState extends State<TopRatedMovieList> {
  var movies;
  Color mainColor = Colors.black;

  void getData() async {
    var data = await getTopRated();

    setState(() {
      movies = data['results'];
    });
  }

  @override
  Widget build(BuildContext context) {
    getData();

    return Container(
      
      child:  Padding(
        padding: const EdgeInsets.all(16.0),
        child:  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
             ListTitle(Colors.black),
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


