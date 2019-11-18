
import 'package:flutter/material.dart';
import 'package:movies/services/tmdb.dart';
import 'package:movies/views/movie/movie_list.dart';

class TopRatedMovieList extends StatefulWidget {
  @override
  TopRatedMovieListState createState() {
    return new TopRatedMovieListState();
  }
}

class TopRatedMovieListState extends State<TopRatedMovieList> {
  var allList;
  var movies;
  Color mainColor = Colors.black;

  void _getTopRated() async {
    var data = await getTopRated();

    setState(() {
      movies = data['results'];
    });
  }


  @override
  Widget build(BuildContext context) {
    //_getTopRated();
    _getTopRated();

    return MovieList(movies, "top rated");
  }
}