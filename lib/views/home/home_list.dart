
import 'package:flutter/material.dart';
import 'package:movies/views/movie/now_playing_movie_list.dart';
import 'package:movies/views/movie/top_rated_movie_list.dart';
import 'package:movies/views/movie/upcoming_movie_list.dart';


class HomeList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: <Widget>[
          Container(
            height: 300,
            child:NowPlayingMovieList(),
          ),
          Container(
            height: 300,
            child:TopRatedMovieList(),
          ),
           Container(
            height: 300,
            child:UpComingMovieList(),
          ),
        ],
      ),
    );
  }
}