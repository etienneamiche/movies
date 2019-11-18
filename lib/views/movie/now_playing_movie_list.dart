
import 'package:flutter/material.dart';
import 'package:movies/services/tmdb.dart';
import 'package:movies/views/movie/movie_list.dart';

class NowPlayingMovieList extends StatefulWidget {
  @override
  NowPlayingMovieListState createState() {
    return new NowPlayingMovieListState();
  }
}

class NowPlayingMovieListState extends State<NowPlayingMovieList> {
  var allList;
  var movies;
  Color mainColor = Colors.black;

  void _getNowPlaying() async {
    var data = await getNowPlaying();

    setState(() {
      movies = data['results'];
    });
  }


  @override
  Widget build(BuildContext context) {
   
    _getNowPlaying();
    return MovieList(movies, "now playing");
  }
}