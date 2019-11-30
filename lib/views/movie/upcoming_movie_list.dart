
import 'package:flutter/material.dart';
import 'package:movies/services/tmdb.dart';
import 'package:movies/views/movie/movie_list.dart';

class UpComingMovieList extends StatefulWidget {
  @override
  UpComingMovieListState createState() {
    return new UpComingMovieListState();
  }
}

class UpComingMovieListState extends State<UpComingMovieList> {
  var allList;
  var movies;


  void _getUpcoming() async {
    var data = await getUpcoming();

    setState(() {
      movies = data['results'];
    });
  }


  @override
  Widget build(BuildContext context) {
   
    _getUpcoming();

    return MovieList(movies, "up coming");
  }
}